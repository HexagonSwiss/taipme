
package org.whitepaper.web.controller.custom;

import java.util.Calendar;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.whitepaper.bean.AnaUtente;
import org.whitepaper.business.service.custom.GestUtenteService;
import org.whitepaper.business.service.impl.custom.SendEmailService;
import org.whitepaper.web.common.AbstractController;
import org.whitepaper.web.common.FormMode;
import org.whitepaper.web.common.Message;
import org.whitepaper.web.common.MessageType;

/**
 * Spring MVC controller for 'AnaUtente' management.
 */
@Controller
@RequestMapping(value="/resetpwd")
public class PasswordDimenticataController extends AbstractController {

	//--- Variables names ( to be used in JSP with Expression Language )
	private static final String MAIN_ENTITY_NAME = "anaUtente";
	

	
	
	private static final String JSP_PWD  = "pwd";
	private static final String JSP_PWD_OK  = "pwdok";
	private static final String JSP_PWD_MODIFY  = "modifypwd";
	private static final String SAVE_ACTION_REGISTRAZIONE   = "/resetpwd/send";
	private static final String SAVE_ACTION_MODIFYPASSWORD   = "/resetpwd/modifyPassword";
	
	

	//--- Main entity service
	@Resource
    private GestUtenteService gestUtenteService; // Injected by Spring
	
	@Resource
    private SendEmailService sendEmailService; // Injected by Spring
	
	
	
	
	/**
	 * Default constructor
	 */
	public PasswordDimenticataController() {
		super(PasswordDimenticataController.class, MAIN_ENTITY_NAME );
		log("PasswordDimenticataController created.");
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
		if ( formMode == FormMode.CREATE ) {
			model.addAttribute(MODE, MODE_CREATE); // The form is in "create" mode
			model.addAttribute(SAVE_ACTION, SAVE_ACTION_REGISTRAZIONE); 		
			//--- Other data useful in this screen in "create" mode (all fields)
			
		
			
		}
		else if ( formMode == FormMode.UPDATE ) {
			model.addAttribute(MODE, MODE_UPDATE); // The form is in "update" mode
			model.addAttribute(SAVE_ACTION, SAVE_ACTION_REGISTRAZIONE); 
			//--- Other data useful in this screen in "update" mode (only non-pk fields)
			
		
		}
	}

	//--------------------------------------------------------------------------------------
	// Request mapping
	//--------------------------------------------------------------------------------------
	
	
	@RequestMapping(value="")
	public String init(Model model) {
		log("Action 'PasswordDimenticataController'");
		//--- Populates the model with a new instance
		AnaUtente anaUtente = new AnaUtente();	
		populateModel( model, anaUtente, FormMode.CREATE);
			
		return JSP_PWD;
	}
	
	@RequestMapping(value = "/send" ) // GET or POST
	public String recuperoPassword(AnaUtente anaUtente, BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes, HttpServletRequest httpServletRequest) {
		log("Action 'recuperoPassword'");
		try {
			if (!bindingResult.hasErrors()) {
				
				// controllo email
				if ( null==anaUtente.getEmail() || anaUtente.getEmail().isEmpty() ) {
					messageHelper.addMessage(model, new Message(MessageType.DANGER, "NotNull.anaUtente.email"));
					populateModel( model, anaUtente, FormMode.CREATE);
					return JSP_PWD;
				}
				
				AnaUtente utente = gestUtenteService.findUtenteByMail(anaUtente.getEmail());
				
				if (utente == null){
					messageHelper.addMessage(model, new Message(MessageType.DANGER, "forgotPwd.error.indirizzoMailNotExist"));
					populateModel( model, anaUtente, FormMode.CREATE);
					return JSP_PWD;
				}
				
				utente.setDatUltMov(Calendar.getInstance().getTime());
				utente.setConUid( UUID.randomUUID().toString());
				
				//String linkConferma = httpServletRequest.getScheme() + "://" + httpServletRequest.getServerName() +":"+ httpServletRequest.getServerPort() +"/"+ httpServletRequest.getContextPath() +"/dimenticata/" + utente.getConUid();
				String linkConferma = getFullServerContextPath(httpServletRequest) +"/resetpwd/" + utente.getConUid();
				AnaUtente anaUtenteSaved = gestUtenteService.updateRecuperoPassword(utente, linkConferma);
				 
			
				model.addAttribute(MAIN_ENTITY_NAME, anaUtenteSaved);
				//
				//---
				//messageHelper.addMessage(model, new Message(MessageType.SUCCESS,"save.ok"));
				return JSP_PWD_OK;
			} else {
				populateModel( model, anaUtente, FormMode.CREATE);
				
				return JSP_PWD;
			}
		} catch(Exception e) {
			log("Action 'create' : Exception - " + e.getMessage() );
			messageHelper.addException(model, "anaUtente.error.create", e);
			populateModel( model, anaUtente, FormMode.CREATE);
			
			return JSP_PWD;
		}
	}
	
	
	@RequestMapping(value = "/{conUid}" ) // GET or POST
	public String impostaNuovaPassword( @PathVariable("conUid") String conUid, Model model, HttpServletRequest httpServletRequest) {
		log("Action 'impostaNuovaPassword'");
		try {
				AnaUtente anaUtente = gestUtenteService.findUtenteByConUid(conUid);
				boolean linkOK = true ; 
				
				if (anaUtente == null){
					anaUtente = new AnaUtente() ;
					// uid non trovato dare errore
					messageHelper.addMessage(model, new Message(MessageType.DANGER,"conf.linkKO"));
					linkOK = false; 
				}
				model.addAttribute("linkOK", linkOK); 
				model.addAttribute(MAIN_ENTITY_NAME, anaUtente);
				model.addAttribute(MODE, MODE_CREATE); // The form is in "create" mode
				model.addAttribute(SAVE_ACTION, SAVE_ACTION_MODIFYPASSWORD); 		


				//messageHelper.addMessage(model, new Message(MessageType.SUCCESS,"conf.ok"));

				return JSP_PWD_MODIFY;
		
		} catch(Exception e) {
			AnaUtente anaUtente = new AnaUtente();
			log("Action 'impostaNuovaPassword' : Exception - " + e.getMessage() );
			messageHelper.addException(model, "anaUtente.error.create", e);
			populateModel( model, anaUtente, FormMode.CREATE);
			
			return JSP_PWD;
		}
	}

	@RequestMapping(value = "/modifyPassword" ) // GET or POST
	public String update(AnaUtente anaUtente,  Model model, RedirectAttributes redirectAttributes) {
		log("Action 'update'");
		
		 try {
				//--- Perform database operations
				AnaUtente anaUtenteSaved = gestUtenteService.updatePasswordByLinkRecupero(anaUtente);
				model.addAttribute(MAIN_ENTITY_NAME, anaUtenteSaved);
				//--- Set the result message
				messageHelper.addMessage(model, new Message(MessageType.SUCCESS,"save.ok"));
				log("Action 'update' : update done - redirect");
				//return redirectToForm(httpServletRequest, anaUtente.getIdUte());
				
				
				model.addAttribute(MAIN_ENTITY_NAME, anaUtenteSaved);
				model.addAttribute(MODE, MODE_CREATE); // The form is in "create" mode

				model.addAttribute("stepFinal", true); 
				return JSP_PWD_MODIFY;
			
		} catch(Exception e) {
			messageHelper.addException(model, "anaUtente.error.update", e);
			log("Action 'update' : Exception - " + e.getMessage() );
			populateModel( model, anaUtente, FormMode.UPDATE);
			return JSP_PWD_MODIFY;
		}
	}

}
