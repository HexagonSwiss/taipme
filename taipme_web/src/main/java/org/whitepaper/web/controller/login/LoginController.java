package org.whitepaper.web.controller.login;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.security.web.authentication.rememberme.TokenBasedRememberMeServices;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.whitepaper.web.common.AbstractController;
import org.whitepaper.web.common.Message;
import org.whitepaper.web.common.MessageHelper;
import org.whitepaper.web.common.MessageType;
import org.whitepaper.web.common.custom.SecurityHelper;

@Controller
public class LoginController extends AbstractController{

	@Resource
	protected MessageHelper messageHelper;

	private static final String MAIN_ENTITY_NAME = "loginForm";
	
	@Resource
	TokenBasedRememberMeServices tokenBasedRememberMeServices ;

	private static final String JSP_LOGINFORM   = "login/form";
	private static final String JSP_HOME_FOGLIO1 = "redirect:/reg/1";


	public LoginController() {
		super(LoginController.class, MAIN_ENTITY_NAME );
		log("LoginController created.");
	}

	
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public ModelAndView signin(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, BindingResult resutErr) {
		return login( error, logout, null, resutErr) ; 
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout,  @ModelAttribute("msgConfOk") String msgConfOk, BindingResult resutErr) {

		ModelAndView model = new ModelAndView();
		
		//check se utente eseguito login
		Integer idUtente = SecurityHelper.getIdUser();		
		if ( null!=idUtente ) {
			model.setViewName(JSP_HOME_FOGLIO1);
			return model;
		}		
		
		if (error != null) {
			//model.addObject("error", "Invalid username and password!");
			model.addObject("message", new Message(MessageType.DANGER,"login.ko") ) ;
		}

		if (logout != null) {
			//model.addObject("msg", "You've been logged out successfully.");
			model.addObject("msg", new Message(MessageType.INFO,"logout.ok") ) ;
		}
		
		if ( msgConfOk!=null )
			model.addObject("message", new Message(MessageType.SUCCESS,"conf.ok") ) ;
		
		model.setViewName(JSP_LOGINFORM);
		
		return model;
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup(HttpServletRequest request, HttpServletResponse response) {
		return logoutPage( request,  response) ; 
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
		//ModelAndView model = new ModelAndView();
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null){  
	    	//User p = (User)auth.getPrincipal();
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	    	tokenBasedRememberMeServices.logout(request, response, auth);
	        //model.addObject("msg", "You've been logged out successfully.");
	    }
	    
	    
	    return "redirect:/login?logout=true";//You can redirect wherever you want, but generally it's a good practice to show login screen again.
	}	

	

}