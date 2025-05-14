package org.whitepaper.mobile.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import org.whitepaper.bean.AnaUtente;
import org.whitepaper.business.service.custom.GestUtenteService;
import org.whitepaper.business.service.impl.custom.JwtTokenService;
import org.whitepaper.mobile.dto.JwtRequest;
import org.whitepaper.mobile.dto.JwtResponse;
import org.whitepaper.mobile.dto.UserRegistrationRequest;
import org.whitepaper.utility.EncoderGenerator;
import org.whitepaper.utility.ConstantsDefinition;

import java.util.Calendar;
import java.util.Objects;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RestController
public class MobileAuthController {

    private static final Logger authLogger = LoggerFactory.getLogger(MobileAuthController.class);

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private JwtTokenService jwtTokenService;

    @Autowired
    @Qualifier("userDetailServiceImpl")
    private UserDetailsService userDetailsService;

    @Autowired
    private GestUtenteService gestUtenteService;

    @Value("${app.baseUrl}")
    private String appBaseUrl;

    // --- LOGIN ENDPOINT ---
    @RequestMapping(value = "/authenticate", method = RequestMethod.POST)
    public ResponseEntity<?> createAuthenticationToken(@RequestBody JwtRequest authenticationRequest) throws Exception {
        authLogger.info("Authentication attempt for user: {}", authenticationRequest.getUsername());

        UserDetails preliminaryUserDetails;
        try {
            preliminaryUserDetails = userDetailsService.loadUserByUsername(authenticationRequest.getUsername());

            boolean isConfirmed = preliminaryUserDetails.getAuthorities().stream()
                    .anyMatch(grantedAuthority -> (ConstantsDefinition.CODPFL_UTEREG != null
                            && ConstantsDefinition.CODPFL_UTEREG.equals(grantedAuthority.getAuthority())) ||
                            "REG".equals(grantedAuthority.getAuthority()) // Fallback if constant is not "REG"
                    );
            if (!isConfirmed) {
                authLogger.warn("Login failed: User {} is not confirmed yet. Authorities: {}",
                        authenticationRequest.getUsername(), preliminaryUserDetails.getAuthorities());
                return new ResponseEntity<>("{\"error\":\"User account not confirmed. Please check your email.\"}",
                        HttpStatus.FORBIDDEN);
            }
        } catch (UsernameNotFoundException e) {
            authLogger.warn("User not found during pre-authentication check for login: {}",
                    authenticationRequest.getUsername());
            // Let authenticate() handle the formal BadCredentialsException
        }

        authenticate(authenticationRequest.getUsername(), authenticationRequest.getPassword());

        final UserDetails userDetails = userDetailsService.loadUserByUsername(authenticationRequest.getUsername());
        final String token = jwtTokenService.generateToken(userDetails);

        authLogger.info("Token generated successfully for user: {}", userDetails.getUsername());

        HttpHeaders headers = new HttpHeaders();
        headers.add("Access-Control-Allow-Origin", "*");
        headers.add("Access-Control-Allow-Methods", "POST, GET, OPTIONS, PUT, DELETE");
        headers.add("Access-Control-Allow-Headers", "Content-Type, Authorization, X-Requested-With");
        headers.add("Access-Control-Expose-Headers", "Authorization");

        return new ResponseEntity<>(new JwtResponse(token, userDetails.getUsername()), headers, HttpStatus.OK);
    }

    private void authenticate(String username, String password) throws Exception {
        Objects.requireNonNull(username);
        Objects.requireNonNull(password);
        try {
            authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(username, password));
        } catch (DisabledException e) {
            authLogger.warn("User DISABLED: {}", username, e);
            throw new Exception("USER_DISABLED", e);
        } catch (BadCredentialsException e) {
            authLogger.warn("INVALID_CREDENTIALS for user: {}", username, e);
            throw new Exception("INVALID_CREDENTIALS", e);
        }
    }

    // --- REGISTRATION ENDPOINT ---
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ResponseEntity<?> registerUser(@RequestBody UserRegistrationRequest registrationRequest,
            HttpServletRequest httpRequest) { // Added HttpServletRequest
        authLogger.info("Registration attempt for email: {}", registrationRequest.getEmail());

        String emailCheckResult = gestUtenteService.checkUsernameMail(registrationRequest.getEmail());
        if (emailCheckResult != null) {
            authLogger.warn("Registration failed: Email {} already exists. Service message: {}",
                    registrationRequest.getEmail(), emailCheckResult);
            return new ResponseEntity<>("{\"error\":\"Email already exists\"}", HttpStatus.BAD_REQUEST);
        }
        authLogger.info("Email {} is available for registration.", registrationRequest.getEmail());

        AnaUtente newUser = new AnaUtente();
        newUser.setEmail(registrationRequest.getEmail());
        newUser.setPwd(EncoderGenerator.encode(registrationRequest.getPassword()));

        if (registrationRequest.getUserName() != null) {
            newUser.setUsername(registrationRequest.getUserName());
        }

        newUser.setCodTipPrf(ConstantsDefinition.CODPFL_UTEANY);

        String conUid = UUID.randomUUID().toString();
        newUser.setConUid(conUid);

        Calendar now = Calendar.getInstance();
        newUser.setDatCreUte(now.getTime());
        newUser.setDatUltMov(now.getTime());

        // Construct the confirmation link using HttpServletRequest for base URL
        // (temporary fix)
        String scheme = httpRequest.getScheme(); // http or https
        String serverName = httpRequest.getServerName(); // hostname.com
        int serverPort = httpRequest.getServerPort(); // 80, 8080, 443
        String contextPath = httpRequest.getContextPath(); // /YourAppContextPath
        String appBaseUrlFromRequest = scheme + "://" + serverName + ":" + serverPort + contextPath;

        String linkConferma = appBaseUrlFromRequest + "/registrazione/" + conUid;
        authLogger.info("Generated confirmation link: {}", linkConferma);

        try {
            AnaUtente savedUser = gestUtenteService.insertUtente(newUser, linkConferma);
            authLogger.info("User {} submitted for registration. Confirmation email to be sent. ID: {}",
                    savedUser.getEmail(), savedUser.getIdUte());
            return new ResponseEntity<>(
                    "{\"message\":\"Registration successful. Please check your email to confirm your account.\"}",
                    HttpStatus.CREATED);
        } catch (Exception e) {
            authLogger.error("Error during user registration for email {}: {}", registrationRequest.getEmail(),
                    e.getMessage(), e);
            return new ResponseEntity<>(
                    "{\"error\":\"Registration failed due to an internal error: " + e.getMessage() + "\"}",
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
