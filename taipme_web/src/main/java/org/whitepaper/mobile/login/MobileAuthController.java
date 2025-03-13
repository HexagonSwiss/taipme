
package org.whitepaper.mobile.login;
import java.util.ArrayList;
import java.util.List;

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

import javax.annotation.PostConstruct;
import org.whitepaper.utility.EncoderGenerator;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.util.UUID;
import org.springframework.web.bind.annotation.RequestParam;

	@Component
	@Transactional
	public class MobileAuthController {

		@PostConstruct
		public void init() {
		    System.out.println("MobileAuthController bean creato correttamente: " + this);
		}
		
		@Resource
		private AnaUtenteCustomJpaRepository anaUtenteCustomJpaRepository;
		
		@Resource
		private AnaUtenteServiceMapper anaUtenteServiceMapper;
		
		//@Autowired
		//private InfoController infoController;
		
		// Metodo che gestisce il login mobile
	    public HttpServletResponse loginMobile(@RequestParam String username, @RequestParam String password, HttpServletResponse response) {
	        // Cerca l'utente per email (username)
	    	UserDetails user = loadUserByUsername(username);

	        if (user == null) {
	            // Utente non trovato
	        	response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
	        }

	        // Verifica se la password inserita è corretta (confronto con la password criptata)
			boolean isPasswordMatches = EncoderGenerator.isEncodeMatchgDecode(password, user.getPassword());
			System.out.println("HttpServletResponse loginMobile username: " + username);
			if(isPasswordMatches) {
				createSessionToken(username, response);	
			}
			else {
				response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
			}
			 System.out.println("HttpServletResponse loginMobile response: " + response);
	        return response;//isPasswordMatches;//passwordEncoder.matches(password, user.password);
	    }
	    
	    //ricerca utente per email
		public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException, DataAccessException {
	    	
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

		 // Metodo per creare il token di sessione
	    public void createSessionToken(String username, HttpServletResponse response) {
	    	// Genera un token unico per la sessione (UUID per esempio)
	    	String cookieName = "SESSIONID_" + username.replace('@', '-');  
	        String sessionToken = UUID.randomUUID().toString();
	        System.out.println("createSessionToken username: " + username);
	        // Crea un cookie di sessione
	        Cookie sessionCookie = new Cookie("SESSIONID" + cookieName, sessionToken);
	        
	        // Imposta la durata del cookie (1 giorno)
	        sessionCookie.setMaxAge(-1);//(60 * 60 * 24);  // Il cookie scade in 1 giorno
	        
	        // Imposta il percorso in cui il cookie è valido (tutta l'app)
	        sessionCookie.setPath("/");  // Il cookie è valido per tutta l'app
	        
	        // Imposta Secure per inviare il cookie solo su HTTPS
	        //sessionCookie.setSecure(true);  // Assicurati che il server usi HTTPS per la sicurezza

	        
	        System.out.println("Cookie name: " + sessionCookie.getName());
	        System.out.println("Cookie value: " + sessionCookie.getValue());
	        
	        // Aggiungi il cookie alla risposta HTTP
	        response.addCookie(sessionCookie);
	        
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
	}
		    
