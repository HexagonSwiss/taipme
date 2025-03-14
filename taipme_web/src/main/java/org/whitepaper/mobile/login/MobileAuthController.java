
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
import java.util.Base64;

	@Component
	@Transactional
	public class MobileAuthController {

		@PostConstruct
		public void init() {
		    System.out.println("MobileAuthController bean creato correttamente: " + this);
		}
		
	}
		    
