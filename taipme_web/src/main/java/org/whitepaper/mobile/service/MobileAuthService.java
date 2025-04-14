package org.whitepaper.mobile.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Base64;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.springframework.dao.DataAccessException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import org.whitepaper.utility.EncoderGenerator;
import org.whitepaper.bean.AnaUtente;
import org.whitepaper.bean.jpa.AnaUtenteEntity;
import org.whitepaper.bean.login.CustomUser;
import org.whitepaper.business.service.mapping.AnaUtenteServiceMapper;
import org.whitepaper.data.repository.jpa.custom.AnaUtenteCustomJpaRepository;

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
		
		
		public Map<String, Object> loginMobile(String username, String password) {
    		Map<String, Object> responseMap = new HashMap<>();
    		String decodedUsername = decodeBase64(username);
    		String decodedPassword = decodeBase64(password);
   			CustomUser user = loadUserByUsername(decodedUsername);
    
    		if (user == null) {
        		responseMap.put("status", "error");
        		responseMap.put("message", "User not found");
        		responseMap.put("user", null);
        		responseMap.put("cookie", null);
        		return responseMap;
    		}
    
    		boolean passwordsMatch = EncoderGenerator.isEncodeMatchgDecode(decodedPassword, user.getPassword());
    	
			if (passwordsMatch) {
        		Cookie cookie = createSessionToken(decodedUsername);
        		responseMap.put("status", "ok");
        		responseMap.put("message", "Valid credentials");
        		Map<String, String> userMap = new HashMap<>();
        		userMap.put("userid", user.getIdUser().toString());
        		responseMap.put("user", userMap);
        		Map<String, String> cookieMap = new HashMap<>();
        		cookieMap.put("name", cookie.getName());
        		cookieMap.put("value", cookie.getValue());
        		responseMap.put("cookie", cookieMap);
    		} else {
        		responseMap.put("status", "error");
        		responseMap.put("message", "Invalid credentials");
        		responseMap.put("user", null);
        		responseMap.put("cookie", null);
    		}

    		return responseMap;
		}


		public CustomUser loadUserByUsername(String username) throws UsernameNotFoundException, DataAccessException {
	    	
	    	CustomUser customUser = null;
	        List<SimpleGrantedAuthority> authorities = new ArrayList<>();
	 
	        if ( null==username || username.isEmpty() ) {
	        	customUser = new CustomUser(username, "NA", true, true, true, true, authorities);
	        	return customUser;
	        }
	        	
	        AnaUtente theUtente = loadUtenteByEmail(username, authorities);
	        if(theUtente != null) {
	        	customUser = new CustomUser(theUtente.getEmail(), theUtente.getPwd(), true, true, true, true, authorities);        				             		
	        	customUser.setIdUser(theUtente.getIdUte());
	        } else {
	           	customUser = new CustomUser(username, "NA", true, true, true, true, authorities);
	        } 
	        
	        return customUser;
	   }
		
	    
		private AnaUtente loadUtenteByEmail(String email, List<SimpleGrantedAuthority> authorities) {
					
			AnaUtenteEntity anaUtenteEntity = anaUtenteCustomJpaRepository.findByEmail(email);
			if ( null==anaUtenteEntity )
				return null;
			
			AnaUtente theUtente = anaUtenteServiceMapper.mapAnaUtenteEntityToAnaUtente(anaUtenteEntity);
			
			//profilo utente per security
			authorities.add(new  SimpleGrantedAuthority(theUtente.getCodTipPrf()) );

			return theUtente;
		}


	    private Cookie createSessionToken(String username) {
	    	String cookieName = "SESSIONID_" + username.replace('@', '-');  
	        String sessionToken = UUID.randomUUID().toString();
	        System.out.println("createSessionToken username: " + username);

	        Cookie sessionCookie = new Cookie("SESSIONID" + cookieName, sessionToken);
	        sessionCookie.setMaxAge(-1); //(60 * 60 * 24);  // Il cookie scade in 1 giorno
	        sessionCookie.setPath("/");  // Il cookie è valido per tutta l'app
	        
	        return sessionCookie;        
	    }
	    

	    private static String decodeBase64(String encoded) {
	        byte[] decodedBytes = Base64.getDecoder().decode(encoded);
	        return new String(decodedBytes);
	    }
	}	    
