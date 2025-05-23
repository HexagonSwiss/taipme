/*
 * Created on 13 lug 2017 ( Time 12:06:10 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package org.whitepaper.web.controller.custom;

import javax.annotation.Resource;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.whitepaper.bean.AnaUtente;
import org.whitepaper.bean.login.CustomUser;
import org.whitepaper.business.service.AnaUtenteService;
import org.whitepaper.business.service.custom.GestUtenteService;
import org.whitepaper.utility.EncoderGenerator;
import org.whitepaper.utility.UtilityFunction;
import org.whitepaper.web.common.AbstractController;
import org.whitepaper.web.common.FormMode;
import org.whitepaper.web.common.Message;
import org.whitepaper.web.common.MessageType;
import org.whitepaper.web.common.custom.SecurityHelper;

/**
 * Spring MVC controller for 'AnaUtente' management.
 */
@Controller
@RequestMapping("/password")
public class PasswordController extends AbstractController {

	//--- Variables names ( to be used in JSP with Expression Language )
	private static final String MAIN_ENTITY_NAME = "anaUtente";
	

	//--- JSP pages names ( View name in the MVC model )
	private static final String JSP_FORM   = "password/form";

	//--- SAVE ACTION ( in the HTML form )
	
	private static final String SAVE_ACTION_UPDATE   = "/password/update";

	//--- Main entity service
	@Resource
    private AnaUtenteService anaUtenteService; // Injected by Spring
	
	@Resource
    private GestUtenteService gestUtenteService; // Injected by Spring
		

	//--------------------------------------------------------------------------------------
	/**
	 * Default constructor
	 */
	public PasswordController() {
		super(PasswordController.class, MAIN_ENTITY_NAME );
		log("PasswordController created.");
	}

	//--------------------------------------------------------------------------------------
	// Spring MVC model management
	//--------------------------------------------------------------------------------------



	/**
	 * Populates the Spring MVC model with the given entity and eventually other useful data
	 * @param model
	 * @param anaUtente
	 */
	private void populateModel(Model model, AnaUtente anaUtente, FormMode formMode) {
		//--- Main entity
		model.addAttribute(MAIN_ENTITY_NAME, anaUtente);		
		model.addAttribute(MODE, MODE_UPDATE); // The form is in "update" mode
		model.addAttribute(SAVE_ACTION, SAVE_ACTION_UPDATE); 					
	}

	//--------------------------------------------------------------------------------------
	// Request mapping
	//--------------------------------------------------------------------------------------
	
	

	/**
	 * Shows a form page in order to update an existing AnaUtente
	 * @param model Spring MVC model
	 * @param idUte  primary key element
	 * @return
	 */
	@RequestMapping(value = "")
	public String formForUpdate(Model model ) {
		log("Action 'formForUpdate'");
		//--- Search the entity by its primary key and stores it in the model 
		CustomUser user =  SecurityHelper.getUser();		
		//AnaUtente anaUtente = gestUtenteService.findUtenteByUsername(user.getUsername());
		AnaUtente anaUtente = gestUtenteService.findUtentePerIdUte( user.getIdUser() );
		//reset password attuale
		anaUtente.setPwd(null);
		populateModel( model, anaUtente, FormMode.UPDATE);		
		
		return JSP_FORM;
	}

	

	/**
	 * 'UPDATE' action processing. <br>
	 * This action is based on the 'Post/Redirect/Get (PRG)' pattern, so it ends by 'http redirect'<br>
	 * @param anaUtente  entity to be updated
	 * @param bindingResult Spring MVC binding result
	 * @param model Spring MVC model
	 * @param redirectAttributes Spring MVC redirect attributes
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping(value = "/update" ) // GET or POST
	public String update(AnaUtente anaUtente,  Model model, RedirectAttributes redirectAttributes) {
		log("Action 'update'");
		
		 try {
			 	//controllo password attuale
			 	if ( null==anaUtente || null==anaUtente.getIdUte()) {
					messageHelper.addMessage(redirectAttributes, new Message(MessageType.DANGER,"NotNull.anaUtente.idUte.ko"));					
					return "redirect:/password";					
				}
			 
			 	if ( UtilityFunction.isFieldBlank(anaUtente.getPwd()) ) {
					messageHelper.addMessage(redirectAttributes, new Message(MessageType.DANGER,"NotNull.anaUtente.pwd.current"));					
					return "redirect:/password";					
				}
			 	if ( UtilityFunction.isFieldBlank(anaUtente.getPwdConf()) || UtilityFunction.isFieldBlank(anaUtente.getPwdNew() ) 
			 			|| !anaUtente.getPwdConf().equals(anaUtente.getPwdNew()) ) {
					messageHelper.addMessage(redirectAttributes, new Message(MessageType.DANGER,"NotNull.anaUtente.pwd.new.ko"));					
					return "redirect:/password";					
				}
			 
			 	//check se password attuale valida
			 	AnaUtente anaUtenteDB = gestUtenteService.findUtentePerIdUte( anaUtente.getIdUte() );
				if ( null==anaUtenteDB ) {
					messageHelper.addMessage(redirectAttributes, new Message(MessageType.DANGER,"NotNull.anaUtente.idUte.ko"));					
					return "redirect:/password";					
				}
								  
				boolean isPasswordMatches = EncoderGenerator.isEncodeMatchingDecode(anaUtente.getPwd(), anaUtenteDB.getPwd());
				if ( !isPasswordMatches ) {
					messageHelper.addMessage(redirectAttributes, new Message(MessageType.DANGER,"NotNull.anaUtente.pwd.current.ko"));					
					return "redirect:/password";					
				} 
				
				//aggiornamento password
				anaUtente.setPwd( anaUtente.getPwdNew() );
			 	
				//--- Perform database operations
				AnaUtente anaUtenteSaved = gestUtenteService.updatePassword(anaUtente);
				model.addAttribute(MAIN_ENTITY_NAME, anaUtenteSaved);
				//--- Set the result message				
				messageHelper.addMessage(redirectAttributes, new Message(MessageType.SUCCESS,"anaUtente.pwd.save.ok"));
				log("Action 'update' : update done - redirect");			
				return "redirect:/password";
			
		} catch(Exception e) {
			messageHelper.addMessage(redirectAttributes, new Message(MessageType.DANGER,"anaUtente.pwd.save.ko"));
			log("Action 'update' : Exception - " + e.getMessage() );
			return "redirect:/password";			
		}
	}

	 @RequestMapping(value = "/mobile/login", method = RequestMethod.GET)
	    public String loginMobile(@RequestParam(required = false) String username, 
	                              @RequestParam(required = false) String password) {
	    	System.out.println("Il filtro ha chiamato loginMobile con username: " + username);
	        return "Hello, IS LOGIN! Username: " + username;
	    }
	
	
}
