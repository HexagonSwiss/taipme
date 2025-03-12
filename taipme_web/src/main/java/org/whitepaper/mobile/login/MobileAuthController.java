
	package org.whitepaper.mobile.login;
	import java.util.ArrayList;
	import java.util.List;

	import javax.annotation.Resource;

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

import javax.annotation.PostConstruct;



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
		
		
		// Metodo che gestisce il login mobile
	    public boolean loginMobile(String username, String password) {
	        // Cerca l'utente per email (username)
	    	UserDetails user = loadUserByUsername(username);

	        if (user == null) {
	            // Utente non trovato
	            return false;
	        }


	        System.out.println("userDetails bean creato correttamente: " + user);
	        // Verifica se la password inserita è corretta (confronto con la password criptata)
	        return true;//passwordEncoder.matches(password, user.getPwd());
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

	}
		    
