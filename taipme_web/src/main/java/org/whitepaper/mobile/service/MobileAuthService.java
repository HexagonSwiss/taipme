package org.whitepaper.mobile.service;
import java.util.ArrayList;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.whitepaper.bean.AnaUtente;
import org.whitepaper.bean.jpa.AnaUtenteEntity;
import org.whitepaper.bean.login.CustomUser;
import org.whitepaper.business.service.mapping.AnaUtenteServiceMapper;
import org.whitepaper.data.repository.jpa.custom.AnaUtenteCustomJpaRepository;
import org.whitepaper.web.common.custom.SecurityHelper;
import org.whitepaper.web.controller.InfoController;
import com.fasterxml.jackson.databind.ObjectMapper;
import javax.annotation.PostConstruct;
import org.whitepaper.utility.EncoderGenerator;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.util.UUID;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;

	@Component
	@Transactional
	public class MobileAuthService {

		@PostConstruct
		public void init() {
		    System.out.println("MobileAuthService bean creato correttamente: " + this);
		}
		
		@Resource
		private AnaUtenteCustomJpaRepository anaUtenteCustomJpaRepository;
		
		@Resource
		private AnaUtenteServiceMapper anaUtenteServiceMapper;
		
		
		public HttpServletResponse loginMobile(@RequestParam String username, @RequestParam String password, HttpServletResponse response) {
		    // Decodifica email e password
		    String decodedUsername = decodeBase64(username);
		    String decodedPassword = decodeBase64(password);
		    
		    // Cerca l'utente per email (username)
		    CustomUser user = loadUserByUsername(decodedUsername);
		    System.out.println("MobileAuthService USER: " + user);
		    System.out.println("MobileAuthService USER: " + user.getAuthorities());
		    // Se l'utente non è trovato, restituisce errore
		    if (user == null) {
		        return createErrorResponse(response, "User not found");
		    }

		    // Verifica se la password è corretta (confronto con la password criptata)
		    boolean isPasswordMatches = EncoderGenerator.isEncodeMatchgDecode(decodedPassword, user.getPassword());

		    if (isPasswordMatches) {
		        // Crea il cookie di sessione e risponde con successo
		    	Cookie cookies = createSessionToken(decodedUsername);
		    	return createRightResponse(response, cookies, user, "Valid credentials");
		    } else {
		        // Se la password non corrisponde, restituisce un errore
		        return createErrorResponse(response, "Invalid credentials");
		    }	    
		}

		// Metodo di supporto per creare una risposta di errore in formato JSON
		private HttpServletResponse createRightResponse(HttpServletResponse response, Cookie cookie, CustomUser user, String message) {
		    try {
		        // Crea una mappa per la risposta JSON
		        Map<String, Object> responseMap = new HashMap<>();
		        responseMap.put("status", "ok");
		        responseMap.put("message", message);

		        // Serializza solo i dati rilevanti dell'utente (ad esempio username, email, etc.)
		        Map<String, String> userMap = new HashMap<>();
		        userMap.put("userid", user.getIdUser().toString());
		        responseMap.put("user", userMap);

		        // Crea una mappa per il cookie (nome e valore)
		        Map<String, String> cookieMap = new HashMap<>();
		        cookieMap.put("name", cookie.getName());
		        cookieMap.put("value", cookie.getValue());
		        responseMap.put("cookie", cookieMap);

		        // Imposta il codice di stato della risposta HTTP come OK (200)
		        response.setStatus(HttpServletResponse.SC_OK);  // HTTP 200 OK

		        // Serializza la mappa in JSON e scrivila nella risposta
		        ObjectMapper objectMapper = new ObjectMapper();
		        response.setContentType("application/json");
		        response.getWriter().write(objectMapper.writeValueAsString(responseMap));
		        response.getWriter().flush();  // Assicurati che la risposta venga completata

		    } catch (IOException e) {
		        e.printStackTrace(); // Gestione eccezioni se necessario
		    }
		    return response;
		}
				
		// Metodo di supporto per creare una risposta di errore in formato JSON
		private HttpServletResponse createErrorResponse(HttpServletResponse response, String errorMessage) {
		    try {
		        // Crea una mappa per la risposta JSON
		        Map<String, Object> responseMap = new HashMap<>();
		        responseMap.put("status", "error");
		        responseMap.put("message", errorMessage);
		        responseMap.put("user", null);
		        responseMap.put("cookie", null);

		        // Imposta il codice di stato della risposta HTTP
		        response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);  // HTTP 401 Unauthorized

		        // Serializza la mappa in JSON e scrivila nella risposta
		        ObjectMapper objectMapper = new ObjectMapper();
		        response.setContentType("application/json");
		        response.getWriter().write(objectMapper.writeValueAsString(responseMap));
		        response.getWriter().flush();  // Assicurati che la risposta venga completata

		    } catch (IOException e) {
		        e.printStackTrace(); // Gestione eccezioni se necessario
		    }
		    return response;
		}
	    
	    //ricerca utente per email
		public CustomUser loadUserByUsername(String username) throws UsernameNotFoundException, DataAccessException {
	    	
	    	CustomUser customUser = null;
	        List<SimpleGrantedAuthority> authorities = new ArrayList<>();
	 
	        if ( null==username || username.isEmpty() ) {
	        	customUser = new CustomUser(username, "NA", true, true, true, true, authorities);
	        	return customUser;
	        }
	        	
	        //ricerca utente per email
	        AnaUtente theUtente = loadUtenteByEmail(username, authorities);
	        if(theUtente != null){
	        	customUser = new CustomUser(theUtente.getEmail(), theUtente.getPwd(), true, true, true, true, authorities);        				             		
	        	customUser.setIdUser(theUtente.getIdUte());
	        }else {
	           	customUser = new CustomUser(username, "NA", true, true, true, true, authorities);
	        } 
	        
	        return customUser;
	   }
	    
		//ricerca utente per indirizzo email
		private AnaUtente loadUtenteByEmail(String email, List<SimpleGrantedAuthority> authorities) {
					
			AnaUtenteEntity anaUtenteEntity = anaUtenteCustomJpaRepository.findByEmail(email);
			if ( null==anaUtenteEntity )
				return null;
			
			AnaUtente theUtente = anaUtenteServiceMapper.mapAnaUtenteEntityToAnaUtente(anaUtenteEntity);
			
			//profilo utente per security
			authorities.add(new  SimpleGrantedAuthority(theUtente.getCodTipPrf()) );

			return theUtente;
		}

		// Metodo per creare il cookie di sessione
	    public Cookie createSessionToken(String username) {
	    	// Genera un cookie unico per la sessione (UUID per esempio)
	    	String cookieName = "SESSIONID_" + username.replace('@', '-');  
	        String sessionToken = UUID.randomUUID().toString();
	        System.out.println("createSessionToken username: " + username);
	        // Crea un cookie di sessione
	        Cookie sessionCookie = new Cookie("SESSIONID" + cookieName, sessionToken);
	        
	        // Imposta la durata del cookie
	        sessionCookie.setMaxAge(-1);//(60 * 60 * 24);  // Il cookie scade in 1 giorno
	        
	        // Imposta il percorso in cui il cookie è valido (tutta l'app)
	        sessionCookie.setPath("/");  // Il cookie è valido per tutta l'app
	        
	        // Aggiungi il cookie alla risposta HTTP
	        return sessionCookie;
	        
	    }
	    
	 // Controlla se c'è un cookie di sessione esistente
	    public boolean checkSession(Cookie[] cookies) {
	        //Cookie[] cookies = httpRequest.getCookies();
	        boolean sessionFound = false;
	        //String sessionToken = null;
	
	        if (cookies != null) {
	            for (Cookie cookie : cookies) {
	                if ("SESSIONID".equals(cookie.getName())) {
	                	String sessionToken = cookie.getValue();
	                    sessionFound = true;
	                    break;
	                }
	            }
	        }
	        if (!sessionFound) {
	        	return false;
	        }
	        
	        return true;
	    }
	    
	    public void listFaqsMobile() {
	    	//infoController.listFaqsMobile();
	    }
	    
	    public static String decodeBase64(String encoded) {
	        byte[] decodedBytes = Base64.getDecoder().decode(encoded);
	        return new String(decodedBytes);
	    }
	}
		    
