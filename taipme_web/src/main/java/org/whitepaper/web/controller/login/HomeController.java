package org.whitepaper.web.controller.login;


import java.text.ParseException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.whitepaper.bean.AnaUtente;
import org.whitepaper.business.service.AnaUtenteService;
import org.whitepaper.business.service.MessaggioService;
import org.whitepaper.business.service.custom.MessaggioCustomService;
import org.whitepaper.utility.ConstantsDefinition;
import org.whitepaper.web.common.custom.SecurityHelper;
import org.whitepaper.web.controller.BaseController;

@Controller
public class HomeController extends BaseController {
	
	private static final String JSP_HOMEPAGE = "index";
	private static final String REDIRECT_HOMEPAGEREG = "redirect:/reg";
	private static final String REDIRECT_HOMEPAGEADMIN = "redirect:/admin";
	private static final String JSP_PAGEACCESSDENIED = "pageaccessdenied";
	
	@Resource
    private MessaggioService messaggioService;
	
	@Resource
	private AnaUtenteService anaUtenteService;
	
	@Resource
	private MessaggioCustomService messaggioCustomService;
	
		

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homeRedirect(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception,ParseException {
		
		try{
			//boolean test = request.isUserInRole("ROLE_PEOPLE_MANAGER") ;
			return goHomePageProfilo(request, model, response);
			
		}catch(Throwable e){
			e.printStackTrace();
		    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		    if (auth != null){  
		        new SecurityContextLogoutHandler().logout(request, response, auth);
		    }
			return JSP_HOMEPAGE;
		}
		
		//return JSP_HOMEPAGE;
	}
	
	//redirect alla hoemepage a secondo del profilo
	@RequestMapping(value = "/homeprof")
	public String goHomePageProfilo(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception,ParseException {
		
		//utente registrato
		Integer idUtente = SecurityHelper.getIdUser();		
		if ( null==idUtente ) {

			//caricamento dati homepage pubblica 
			//slogan
			//model.addAttribute(ConstantsDefinition.COD_SLOGAN, ConstantsDefinition.MSG_SLOGAN);			
			return JSP_HOMEPAGE;
		}
		try{			
			//profilo utente
			AnaUtente anaUtente = anaUtenteService.findById(idUtente);
			if ( null==anaUtente ) {
				return JSP_PAGEACCESSDENIED;				
			}
			
			//email in sessione
			request.getSession().setAttribute(ConstantsDefinition.SESSION_EMAIL, anaUtente.getEmail());
			
			String codPrf = anaUtente.getCodTipPrf();					 			
			if ( null==codPrf || codPrf.isEmpty()) {
				return JSP_PAGEACCESSDENIED;				
			} else if ( codPrf.equalsIgnoreCase(ConstantsDefinition.CODPFL_ADMIN)) {			
				//admin
				return REDIRECT_HOMEPAGEADMIN;
			} else if ( codPrf.equalsIgnoreCase(ConstantsDefinition.CODPFL_UTEREG)) {
				//utente registrato				
				return REDIRECT_HOMEPAGEREG;					
			} 
			
		}catch(Throwable e){
			e.printStackTrace();
		    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		    if (auth != null){  
		        new SecurityContextLogoutHandler().logout(request, response, auth);
		    }
		}
				
		return JSP_HOMEPAGE;		
	}

	
}
