/*
 * Created on 2022-11-03 ( Time 15:20:00 )
 * Generated by Telosys Tools Generator ( version 3.1.2 )
 */
package org.whitepaper.web.controller;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

//--- Common classes
import org.whitepaper.web.common.AbstractController;
import org.whitepaper.web.common.FormMode;
import org.whitepaper.web.common.Message;
import org.whitepaper.web.common.MessageType;

//--- Entities
import org.whitepaper.bean.MessaggioTags;
import org.whitepaper.bean.Messaggio;

//--- Services 
import org.whitepaper.business.service.MessaggioTagsService;
import org.whitepaper.business.service.MessaggioService;

//--- List Items 
import org.whitepaper.web.listitem.MessaggioListItem;

/**
 * Spring MVC controller for 'MessaggioTags' management.
 */
@Controller
@RequestMapping("/messaggioTags")
public class MessaggioTagsController extends AbstractController {

	//--- Variables names ( to be used in JSP with Expression Language )
	private static final String MAIN_ENTITY_NAME = "messaggioTags";
	private static final String MAIN_LIST_NAME   = "list";

	//--- JSP pages names ( View name in the MVC model )
	private static final String JSP_FORM   = "messaggioTags/form";
	private static final String JSP_LIST   = "messaggioTags/list";

	//--- SAVE ACTION ( in the HTML form )
	private static final String SAVE_ACTION_CREATE   = "/messaggioTags/create";
	private static final String SAVE_ACTION_UPDATE   = "/messaggioTags/update";

	//--- Main entity service
	@Resource
    private MessaggioTagsService messaggioTagsService; // Injected by Spring
	//--- Other service(s)
	@Resource
    private MessaggioService messaggioService; // Injected by Spring

	//--------------------------------------------------------------------------------------
	/**
	 * Default constructor
	 */
	public MessaggioTagsController() {
		super(MessaggioTagsController.class, MAIN_ENTITY_NAME );
		log("MessaggioTagsController created.");
	}

	//--------------------------------------------------------------------------------------
	// Spring MVC model management
	//--------------------------------------------------------------------------------------
	/**
	 * Populates the combo-box "items" for the referenced entity "Messaggio"
	 * @param model
	 */
	private void populateListOfMessaggioItems(Model model) {
		List<Messaggio> list = messaggioService.findAll();
		List<MessaggioListItem> items = new LinkedList<MessaggioListItem>();
		for ( Messaggio messaggio : list ) {
			items.add(new MessaggioListItem( messaggio ) );
		}
		model.addAttribute("listOfMessaggioItems", items ) ;
	}


	/**
	 * Populates the Spring MVC model with the given entity and eventually other useful data
	 * @param model
	 * @param messaggioTags
	 */
	private void populateModel(Model model, MessaggioTags messaggioTags, FormMode formMode) {
		//--- Main entity
		model.addAttribute(MAIN_ENTITY_NAME, messaggioTags);
		if ( formMode == FormMode.CREATE ) {
			model.addAttribute(MODE, MODE_CREATE); // The form is in "create" mode
			model.addAttribute(SAVE_ACTION, SAVE_ACTION_CREATE); 			
			//--- Other data useful in this screen in "create" mode (all fields)
			populateListOfMessaggioItems(model);
		}
		else if ( formMode == FormMode.UPDATE ) {
			model.addAttribute(MODE, MODE_UPDATE); // The form is in "update" mode
			model.addAttribute(SAVE_ACTION, SAVE_ACTION_UPDATE); 			
			//--- Other data useful in this screen in "update" mode (only non-pk fields)
			populateListOfMessaggioItems(model);
		}
	}

	//--------------------------------------------------------------------------------------
	// Request mapping
	//--------------------------------------------------------------------------------------
	/**
	 * Shows a list with all the occurrences of MessaggioTags found in the database
	 * @param model Spring MVC model
	 * @return
	 */
	@RequestMapping()
	public String list(Model model) {
		log("Action 'list'");
		List<MessaggioTags> list = messaggioTagsService.findAll();
		model.addAttribute(MAIN_LIST_NAME, list);		
		return JSP_LIST;
	}

	/**
	 * Shows a form page in order to create a new MessaggioTags
	 * @param model Spring MVC model
	 * @return
	 */
	@RequestMapping("/form")
	public String formForCreate(Model model) {
		log("Action 'formForCreate'");
		//--- Populates the model with a new instance
		MessaggioTags messaggioTags = new MessaggioTags();	
		populateModel( model, messaggioTags, FormMode.CREATE);
		return JSP_FORM;
	}

	/**
	 * Shows a form page in order to update an existing MessaggioTags
	 * @param model Spring MVC model
	 * @param idTag  primary key element
	 * @return
	 */
	@RequestMapping(value = "/form/{idTag}")
	public String formForUpdate(Model model, @PathVariable("idTag") Integer idTag ) {
		log("Action 'formForUpdate'");
		//--- Search the entity by its primary key and stores it in the model 
		MessaggioTags messaggioTags = messaggioTagsService.findById(idTag);
		populateModel( model, messaggioTags, FormMode.UPDATE);		
		return JSP_FORM;
	}

	/**
	 * 'CREATE' action processing. <br>
	 * This action is based on the 'Post/Redirect/Get (PRG)' pattern, so it ends by 'http redirect'<br>
	 * @param messaggioTags  entity to be created
	 * @param bindingResult Spring MVC binding result
	 * @param model Spring MVC model
	 * @param redirectAttributes Spring MVC redirect attributes
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping(value = "/create" ) // GET or POST
	public String create(MessaggioTags messaggioTags, BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes, HttpServletRequest httpServletRequest) {
		log("Action 'create'");
		try {
			if (!bindingResult.hasErrors()) {
				MessaggioTags messaggioTagsCreated = messaggioTagsService.create(messaggioTags); 
				model.addAttribute(MAIN_ENTITY_NAME, messaggioTagsCreated);

				//---
				messageHelper.addMessage(redirectAttributes, new Message(MessageType.SUCCESS,"save.ok"));
				return redirectToForm(httpServletRequest, messaggioTagsCreated.getIdTag() );
			} else {
				populateModel( model, messaggioTags, FormMode.CREATE);
				return JSP_FORM;
			}
		} catch(Exception e) {
			log("Action 'create' : Exception - " + e.getMessage() );
			messageHelper.addException(model, "messaggioTags.error.create", e);
			populateModel( model, messaggioTags, FormMode.CREATE);
			return JSP_FORM;
		}
	}

	/**
	 * 'UPDATE' action processing. <br>
	 * This action is based on the 'Post/Redirect/Get (PRG)' pattern, so it ends by 'http redirect'<br>
	 * @param messaggioTags  entity to be updated
	 * @param bindingResult Spring MVC binding result
	 * @param model Spring MVC model
	 * @param redirectAttributes Spring MVC redirect attributes
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping(value = "/update" ) // GET or POST
	public String update(@Valid MessaggioTags messaggioTags, BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes, HttpServletRequest httpServletRequest) {
		log("Action 'update'");
		try {
			if (!bindingResult.hasErrors()) {
				//--- Perform database operations
				MessaggioTags messaggioTagsSaved = messaggioTagsService.update(messaggioTags);
				model.addAttribute(MAIN_ENTITY_NAME, messaggioTagsSaved);
				//--- Set the result message
				messageHelper.addMessage(redirectAttributes, new Message(MessageType.SUCCESS,"save.ok"));
				log("Action 'update' : update done - redirect");
				return redirectToForm(httpServletRequest, messaggioTags.getIdTag());
			} else {
				log("Action 'update' : binding errors");
				populateModel( model, messaggioTags, FormMode.UPDATE);
				return JSP_FORM;
			}
		} catch(Exception e) {
			messageHelper.addException(model, "messaggioTags.error.update", e);
			log("Action 'update' : Exception - " + e.getMessage() );
			populateModel( model, messaggioTags, FormMode.UPDATE);
			return JSP_FORM;
		}
	}

	/**
	 * 'DELETE' action processing. <br>
	 * This action is based on the 'Post/Redirect/Get (PRG)' pattern, so it ends by 'http redirect'<br>
	 * @param redirectAttributes
	 * @param idTag  primary key element
	 * @return
	 */
	@RequestMapping(value = "/delete/{idTag}") // GET or POST
	public String delete(RedirectAttributes redirectAttributes, @PathVariable("idTag") Integer idTag) {
		log("Action 'delete'" );
		try {
			messaggioTagsService.delete( idTag );
			//--- Set the result message
			messageHelper.addMessage(redirectAttributes, new Message(MessageType.SUCCESS,"delete.ok"));	
		} catch(Exception e) {
			messageHelper.addException(redirectAttributes, "messaggioTags.error.delete", e);
		}
		return redirectToList();
	}

}
