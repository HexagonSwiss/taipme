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
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import org.whitepaper.bean.AnaUtente;
import org.whitepaper.business.service.custom.GestUtenteService;
import org.whitepaper.business.service.impl.custom.JwtTokenService;
import org.whitepaper.mobile.dto.ChangePasswordRequest;
import org.whitepaper.mobile.dto.ForgotPasswordRequest; // New DTO
import org.whitepaper.mobile.dto.JwtRequest;
import org.whitepaper.mobile.dto.JwtResponse;
import org.whitepaper.mobile.dto.ResetPasswordRequest; // New DTO
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
@RequestMapping("/mobile/auth")
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

    @Autowired
    private PasswordEncoder passwordEncoder; 

    @Value("${app.baseUrl}")
    private String appBaseUrl;

    // --- LOGIN ENDPOINT ---
    /**
     * Authenticate a user and generate a JWT token.
     *
     * @param authenticationRequest The request containing username and password.
     * @return A response containing the JWT token and user details.
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST) // Path relative to /mobile/auth
    public ResponseEntity<?> createAuthenticationToken(@RequestBody JwtRequest authenticationRequest) throws Exception {
        authLogger.info("Authentication attempt for user: {}", authenticationRequest.getUsername());

        UserDetails preliminaryUserDetails;
        try {
            preliminaryUserDetails = userDetailsService.loadUserByUsername(authenticationRequest.getUsername());
            boolean isConfirmed = preliminaryUserDetails.getAuthorities().stream()
                    .anyMatch(grantedAuthority -> (ConstantsDefinition.CODPFL_UTEREG != null
                            && ConstantsDefinition.CODPFL_UTEREG.equals(grantedAuthority.getAuthority())) ||
                            "REG".equals(grantedAuthority.getAuthority()));
            if (!isConfirmed) {
                authLogger.warn("Login failed: User {} is not confirmed yet. Authorities: {}",
                        authenticationRequest.getUsername(), preliminaryUserDetails.getAuthorities());
                return new ResponseEntity<>("{\"error\":\"User account not confirmed. Please check your email.\"}",
                        HttpStatus.FORBIDDEN);
            }
        } catch (UsernameNotFoundException e) {
            authLogger.warn("User not found during pre-authentication check for login: {}",
                    authenticationRequest.getUsername());
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
    /**
     * Register a new user.
     *
     * @param registrationRequest The request containing user details.
     * @return A response indicating success or failure.
     */
    @RequestMapping(value = "/register", method = RequestMethod.POST) // Path relative to /mobile/auth
    public ResponseEntity<?> registerUser(@RequestBody UserRegistrationRequest registrationRequest,
            HttpServletRequest httpRequest) {
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

        String scheme = httpRequest.getScheme();
        String serverName = httpRequest.getServerName();
        int serverPort = httpRequest.getServerPort();
        String contextPath = httpRequest.getContextPath();
        String appBaseUrlFromRequest = scheme + "://" + serverName + ":" + serverPort + contextPath;

        String linkConferma = appBaseUrlFromRequest + "/registrazione/" + conUid; // Points to existing web confirmation
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

    // --- FORGOT PASSWORD ENDPOINT ---
    /**
     * Request a password reset for a user.
     *
     * @param forgotRequest The request containing the email address.
     * @return A response indicating success or failure.
     */
    @RequestMapping(value = "/forgot-password", method = RequestMethod.POST)
    public ResponseEntity<?> requestPasswordReset(@RequestBody ForgotPasswordRequest forgotRequest,
            HttpServletRequest httpRequest) {
        authLogger.info("Password reset requested for email: {}", forgotRequest.getEmail());
        if (forgotRequest.getEmail() == null || forgotRequest.getEmail().trim().isEmpty()) {
            return new ResponseEntity<>("{\"error\":\"Email is required.\"}", HttpStatus.BAD_REQUEST);
        }

        AnaUtente user = gestUtenteService.findUtenteByMail(forgotRequest.getEmail());

        if (user == null) {
            authLogger.warn("Password reset requested for non-existent email: {}", forgotRequest.getEmail());
            return new ResponseEntity<>(
                    "{\"message\":\"If your email address exists in our database, you will receive a password recovery link at your email address in a few minutes.\"}",
                    HttpStatus.OK);
        }

        String resetToken = UUID.randomUUID().toString();
        user.setConUid(resetToken);

        String scheme = httpRequest.getScheme();
        String serverName = httpRequest.getServerName();
        int serverPort = httpRequest.getServerPort();
        String contextPath = httpRequest.getContextPath();
        String appBaseUrlFromRequest = scheme + "://" + serverName + ":" + serverPort + contextPath;

        String linkRecupero = appBaseUrlFromRequest + "/resetpwd/" + resetToken; // Points to existing web reset
                                                                                 // password
        authLogger.info("Generated password recovery link for {}: {}", user.getEmail(), linkRecupero);

        try {
            gestUtenteService.updateRecuperoPassword(user, linkRecupero);
            authLogger.info("Password recovery email initiated for: {}", user.getEmail());
            return new ResponseEntity<>(
                    "{\"message\":\"If your email address exists in our database, you will receive a password recovery link at your email address in a few minutes.\"}",
                    HttpStatus.OK);
        } catch (Exception e) {
            authLogger.error("Error initiating password recovery for {}: {}", forgotRequest.getEmail(), e.getMessage(),
                    e);
            return new ResponseEntity<>(
                    "{\"message\":\"If your email address exists in our database, you will receive a password recovery link at your email address in a few minutes.\"}",
                    HttpStatus.OK);
        }
    }

    // --- RESET PASSWORD ENDPOINT ---
    /**
     * Reset the password of a user using a token.
     *
     * @param resetRequest The request containing the token and new password.
     * @return A response indicating success or failure.
     */
    @RequestMapping(value = "/reset-password", method = RequestMethod.POST)
    public ResponseEntity<?> resetPassword(@RequestBody ResetPasswordRequest resetRequest) {
        authLogger.info("Attempting to reset password with token (conUid)");

        if (resetRequest.getToken() == null || resetRequest.getToken().trim().isEmpty() ||
                resetRequest.getNewPassword() == null || resetRequest.getNewPassword().trim().isEmpty()) {
            return new ResponseEntity<>("{\"error\":\"Token and new password are required.\"}", HttpStatus.BAD_REQUEST);
        }

        AnaUtente user = gestUtenteService.findUtenteByConUid(resetRequest.getToken());

        if (user == null) {
            authLogger.warn("Password reset attempt with invalid or expired token.");
            return new ResponseEntity<>("{\"error\":\"Invalid or expired password reset link.\"}",
                    HttpStatus.BAD_REQUEST);
        }

        if (!ConstantsDefinition.CODPFL_UTEREG.equals(user.getCodTipPrf()) && !"REG".equals(user.getCodTipPrf())) {
            authLogger.warn("Password reset attempt for user {} with non-REG profile: {}", user.getEmail(),
                    user.getCodTipPrf());
            return new ResponseEntity<>("{\"error\":\"Password reset not allowed for this account status.\"}",
                    HttpStatus.BAD_REQUEST);
        }

        user.setPwd(resetRequest.getNewPassword());

        try {
            gestUtenteService.updatePasswordByLinkRecupero(user);
            authLogger.info("Password successfully reset for user: {}", user.getEmail());
            return new ResponseEntity<>(
                    "{\"message\":\"Password has been successfully reset. You can now log in with your new password.\"}",
                    HttpStatus.OK);
        } catch (Exception e) {
            authLogger.error("Error resetting password for user {}: {}", user.getEmail(), e.getMessage(), e);
            return new ResponseEntity<>("{\"error\":\"Failed to reset password. Please try again later.\"}",
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // --- CHANGE PASSWORD ENDPOINT ---
    /**
     * Change the password of the authenticated user.
     *
     * @param changeRequest The request containing the current and new passwords.
     * @return A response indicating success or failure.
     */
    @RequestMapping(value = "/change-password", method = RequestMethod.POST)
    public ResponseEntity<?> changePassword(@RequestBody ChangePasswordRequest changeRequest) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication == null || !authentication.isAuthenticated()
                || "anonymousUser".equals(authentication.getPrincipal().toString())) {
            authLogger.warn("Change password attempt by unauthenticated user.");
            return new ResponseEntity<>("{\"error\":\"User not authenticated.\"}", HttpStatus.UNAUTHORIZED);
        }

        String currentUsername = authentication.getName();
        authLogger.info("Password change attempt for user: {}", currentUsername);

        if (changeRequest.getCurrentPassword() == null || changeRequest.getCurrentPassword().trim().isEmpty() ||
                changeRequest.getNewPassword() == null || changeRequest.getNewPassword().trim().isEmpty()) {
            return new ResponseEntity<>("{\"error\":\"Current and new passwords are required.\"}",
                    HttpStatus.BAD_REQUEST);
        }

        if (changeRequest.getCurrentPassword().equals(changeRequest.getNewPassword())) {
            return new ResponseEntity<>("{\"error\":\"New password cannot be the same as the current password.\"}",
                    HttpStatus.BAD_REQUEST);
        }

        // TODO: Add password policy checks for newPassword (length, complexity etc.)

        UserDetails userDetails;

        try {
            userDetails = userDetailsService.loadUserByUsername(currentUsername);
        } catch (UsernameNotFoundException e) {
            authLogger.error("Authenticated user {} not found in UserDetailsService during password change.",
                    currentUsername);
            return new ResponseEntity<>("{\"error\":\"User not found, please re-authenticate.\"}",
                    HttpStatus.UNAUTHORIZED);
        }

        if (!passwordEncoder.matches(changeRequest.getCurrentPassword(), userDetails.getPassword())) {
            authLogger.warn("Incorrect current password for user: {}", currentUsername);
            return new ResponseEntity<>("{\"error\":\"Incorrect current password.\"}", HttpStatus.BAD_REQUEST);
        }

        AnaUtente userToUpdate = gestUtenteService.findUtenteByMail(currentUsername);

        if (userToUpdate == null) {
            authLogger.error("AnaUtente record not found for authenticated user {} during password change.",
                    currentUsername);
            return new ResponseEntity<>("{\"error\":\"User data inconsistency. Please contact support.\"}",
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }

        userToUpdate.setPwd(changeRequest.getNewPassword());

        try {
            gestUtenteService.updatePassword(userToUpdate);
            authLogger.info("Password successfully changed for user: {}", currentUsername);
            return new ResponseEntity<>("{\"message\":\"Password changed successfully.\"}", HttpStatus.OK);
        } catch (Exception e) {
            authLogger.error("Error changing password for user {}: {}", currentUsername, e.getMessage(), e);
            return new ResponseEntity<>("{\"error\":\"Failed to change password. Please try again later.\"}",
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
