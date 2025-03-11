package org.whitepaper.web.controller.login;


import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.whitepaper.bean.AnaUtente;
import org.whitepaper.bean.FoglioIndice;
import org.whitepaper.bean.Messaggio;
import org.whitepaper.bean.MessaggioAdmin;
import org.whitepaper.bean.MessaggioSegnalato;
import org.whitepaper.business.service.AnaUtenteService;
import org.whitepaper.business.service.MessaggioService;
import org.whitepaper.business.service.TipInfoService;
import org.whitepaper.business.service.custom.MessaggioAdminCustomService;
import org.whitepaper.business.service.custom.MessaggioCustomService;
import org.whitepaper.business.service.custom.MessaggioSegnalatoCustomService;
import org.whitepaper.business.service.custom.UtenteActionCustomService;
import org.whitepaper.utility.ConstantsDefinition;
import org.whitepaper.utility.UtilityFunction;
import org.whitepaper.web.common.Message;
import org.whitepaper.web.common.MessageType;
import org.whitepaper.web.common.custom.SecurityHelper;
import org.whitepaper.web.controller.BaseController;

@Controller
public class HomeRegController extends BaseController {

	private static final String JSP_PAGEACCESSDENIED = "pageaccessdenied";
	
	private static final String JSP_HOMEPAGEREG = "homepagereg";	
	private static final String MAIN_ENTITY_NAME = "messaggio";
	private static final String LIST_FOGLI_INDICE = "listFogliIndice";
	private static final String MESSAGGIO_ADMIN = "messaggioadmin";
	private static final String IS_MESSAGGIO_ADMIN = "isMessaggioadmin";
	
	private static final String IS_ADD_NEW_FOGLIO = "isPossibleAddNewFoglio";	
	private static final String NUM_MAX_FOGLI_KEY = "numMaxFogli";
	
	//flag per bottoniera
	private static final String isLeggiAltriMsg = "isLeggiAltriMsg";
	private static final String isScriviNewMsg = "isScriviNewMsg";
	private static final String isReplyMsg = "isReplyMsg";
	
	private static final String urltHomeReg = "/reg";
	private static final String redirectHome = "redirect:"+urltHomeReg;
	
	private static final String urlReadNsg = "typewriter/readmsg";
	private static final String urlReadNsgAdmin = "typewriter/readmsgadmin";
	
	private static Logger logger = LoggerFactory.getLogger(HomeRegController.class);
	
	@Resource
    private MessaggioService messaggioService;
	
	@Resource
	private AnaUtenteService anaUtenteService;
	
	@Resource
	private MessaggioCustomService messaggioCustomService;
	
	@Resource
	private MessaggioAdminCustomService messaggioAdminCustomService;
	
	@Resource
	private MessaggioSegnalatoCustomService messaggioSegnalatoCustomService;
	
	@Resource
	private TipInfoService tipInfoService;
	
	@Resource
	UtenteActionCustomService utenteActionCustomService;

	//homepage utente registrato
	@RequestMapping( value = urltHomeReg)
	public String goHomePageReg(HttpServletRequest request, Model model) throws Exception, ParseException {
				
		//caricamento foglio1		
		return redirectHome+"/1";
	}

	private String getUserLog() {
		String msgLog = " +++ idUtente connesso: "+SecurityHelper.getIdUser()+" +++ ";
		return msgLog;
	}
	
	//homepage utente registrato con foglio	
	@RequestMapping(value = urltHomeReg+"/{idFoglio}", method = RequestMethod.GET) // GET or POST
	public String goHomePageRegIdFoglio(Model model, HttpServletRequest request, RedirectAttributes redirectAttributes, @PathVariable("idFoglio") Integer idFoglio) {
				
		//lettura email da sessione (non dovrebbe mai essere null???)
		String emailUte = (String)request.getSession().getAttribute(ConstantsDefinition.SESSION_EMAIL);
		if ( null==emailUte || emailUte.isEmpty() ) {
		
			//load profilo utente (per visualizzazione email in menu)
			Integer idUtente = SecurityHelper.getIdUser();		
			if ( null!=idUtente ) {
				AnaUtente anaUtente = anaUtenteService.findById(idUtente);
				if ( null==anaUtente ) {
					logger.error("******goHomePageRegIdFoglio: utente non trovato: idUte=" + idUtente );
					return JSP_PAGEACCESSDENIED;				
				}
		
				//email in sessione
				request.getSession().setAttribute(ConstantsDefinition.SESSION_EMAIL, anaUtente.getEmail());
			}
		}
		
		//indica da quale operazione proviene (valorizzato per STRAPPA e ADD FOGLIO)
		String fromTipOperaz = (String) model.asMap().get(ConstantsDefinition.FROM_TIP_OPERAZ);
		if ( UtilityFunction.isFieldBlank(fromTipOperaz) )
			fromTipOperaz = ConstantsDefinition.COD_TIP_OPERAZ_GOFOGLIO;
		
		//check foglio valido (NON se gia utilizzato)
		if ( !checkIdFoglioIsValido(idFoglio, fromTipOperaz) ) {
			return JSP_PAGEACCESSDENIED;
		}
						
		//check fogli attivi e caricamento model
		boolean isFoglioOk = populateModel(model, idFoglio);
		if ( !isFoglioOk )
			return JSP_PAGEACCESSDENIED;
		
		return JSP_HOMEPAGEREG;
	}
	
	
	//pagina per lettura nuovo messaggio
	@RequestMapping(value = urltHomeReg+"/readmsg", method = RequestMethod.POST) // GET or POST
	public String readmsg(HttpServletRequest request, Messaggio messaggio, Model model, RedirectAttributes redirectAttributes) throws Exception, ParseException {
				
		//caricamento model
		populateModel(model, messaggio.getIdFoglio());
				
		//ricarica pagina lettura messaggio
		return urlReadNsg;
	}
		
	//pagina per scrittura nuovo messaggio
	@RequestMapping(value = urltHomeReg+"/writemsg"+"/{idFoglio}", method = RequestMethod.GET) // GET or POST
	public String writemsg(HttpServletRequest request, Model model, RedirectAttributes redirectAttributes
			,@PathVariable("idFoglio") Integer idFoglio, Messaggio messaggio) throws Exception, ParseException {
		
		//check foglio valido (anche se gia utilizzato)
		if ( !checkIdFoglioIsValido(idFoglio, ConstantsDefinition.COD_TIP_OPERAZ_SCRIVI) ) {
			logger.error("******writemsg: idFoglio non valido: " + idFoglio+getUserLog() );
			return JSP_PAGEACCESSDENIED;
		}
		
		//load indice fogli
		loadListaFogliIndice(model, idFoglio, false);	

		//check: un foglio un messaggio
		Messaggio messaggioDB = messaggioCustomService.findMsgByAutoreAndIdFoglio(SecurityHelper.getIdUser(), idFoglio);		
		if ( null!=messaggioDB ) {
			//7redirect homepage foglio corrente		
			messageHelper.addMessage(redirectAttributes, new Message(MessageType.DANGER,"messaggio.foglio.busy"));			
			return  redirectHome+"/"+idFoglio;
		}
		
		//frase random per placeholder
		String msgPlaceHolder = tipInfoService.findELementRandom(ConstantsDefinition.COD_FRASI_SCRIVI);		
		model.addAttribute("msgPlaceHolder", msgPlaceHolder);
		
		return "typewriter/writemsg";
	}
	
	//foglio valido: 1-5
	private boolean checkIdFoglioIsValido(Integer idFoglio, String tipoOperazione) {
		
		if ( null==idFoglio || idFoglio.intValue()>ConstantsDefinition.NUM_MAX_FOGLI || idFoglio.intValue()<1 ) {
			return false;
		}
		
		//lista messaggi autore connesso
		Integer idAut = SecurityHelper.getIdUser();
		List<Messaggio> listMsg = messaggioCustomService.findMsgByAutore(idAut);
				
		//determinazione idFoglio massimo
		int numFogliUtilizzati = 1;	
		if ( null!=listMsg && !listMsg.isEmpty() ) {
			
			//check se idFoglio supera ultimo foglio disponibile
			numFogliUtilizzati = countNumFogliUtilizzatiPerMsgPubblicati(listMsg);
			if ( idFoglio>(numFogliUtilizzati+1) ) 												
				return false;
			
		} else {
			//resta un solo foglio
			if ( idFoglio.intValue()>1 )
				return false;			
		}
				
		
		//contorlli su idFoglio se usato o lista fogli presenta buchi
		if ( tipoOperazione.equals(ConstantsDefinition.COD_TIP_OPERAZ_SCRIVI) ) {
			
			//check se foglio gia utilizzato 
			boolean isFoglioGiaUsato = isFoglioGiaUsato(listMsg, idFoglio);
			if ( isFoglioGiaUsato )
				return false;
		} else if ( tipoOperazione.equals(ConstantsDefinition.COD_TIP_OPERAZ_GOFOGLIO) ) {
						
			//check se presente buco nella lista dei fogli per nuovo foglio TODO
			if ( idFoglio>numFogliUtilizzati ) {
				
				if ( idFoglio-listMsg.size()>1 )
					return false;
				
				if ( isBucoTraFogli(listMsg) )
					return false;				
			}			
		}
		
		return true;
	}
	
	private boolean isBucoTraFogli(List<Messaggio> listMsg) {
		
		boolean isBucoTraFogli = false;
		if ( null==listMsg || listMsg.isEmpty() )
			return false;
		
		for ( int i=0; i<listMsg.size()-1; i++ ) {
			
			Messaggio messaggio = listMsg.get(i);			
			if ( null==messaggio || null==messaggio.getIdFoglio() )
				continue;
			
			int diff = listMsg.get(i+1).getIdFoglio().intValue()-listMsg.get(i).getIdFoglio().intValue();
			if ( diff>1 ) {
				isBucoTraFogli = true;
				break;
			}
							
		}//endfor
		
		return isBucoTraFogli;
	}	
	
	//pubblica
	@RequestMapping(value = urltHomeReg+"/savemsg", method = RequestMethod.POST) // GET or POST
	public String savemsg(HttpServletRequest request, Messaggio messaggio, Model model, RedirectAttributes redirectAttributes) throws Exception, ParseException {
		
		Integer idUtente = SecurityHelper.getIdUser();		

		///////////////////////////		
		//controlli nuovo messaggio
		///////////////////////////
		if ( null==messaggio.getIdFoglio() ) {
			messageHelper.addMessage(redirectAttributes, new Message(MessageType.DANGER,"messaggio.idFoglio.ko"));
			return redirectHome;
		}
		
		//7redirect homepage foglio corrente
		String urlPageFoglio = redirectHome+"/"+messaggio.getIdFoglio();
		
		if ( null==idUtente ) {
			//caricamento dati homepage
			messageHelper.addMessage(redirectAttributes, new Message(MessageType.DANGER,"NotNull.anaUtente.idUte.ko"));
			return urlPageFoglio;
		}
		
		if ( null==messaggio || null==messaggio.getDesMsg() || messaggio.getDesMsg().isEmpty() ) {
			messageHelper.addMessage(redirectAttributes, new Message(MessageType.DANGER,"messaggio.desMsg.required"));
			return urlPageFoglio;
		}		
		
		//check: un foglio un messaggio		
		Messaggio messaggioClone = messaggioCustomService.findMsgByAutoreAndIdFoglio(idUtente, messaggio.getIdFoglio());
		if ( null!=messaggioClone ) {
			messageHelper.addMessage(redirectAttributes, new Message(MessageType.DANGER,"messaggio.foglio.busy"));
			return urlPageFoglio;
		}
		
		//salvataggio messaggio	pubblico con relativi tags
		Messaggio messaggioCreated = messaggioCustomService.insertMsgAndTags(idUtente, null, messaggio.getDesMsg(), ConstantsDefinition.CODMSG_PUB, messaggio.getIdFoglio(), null, true); 
		if (null==messaggioCreated || null==messaggioCreated.getIdMsg()) {
			//errore vave
			messageHelper.addMessage(redirectAttributes, new Message(MessageType.DANGER,"save.ko"));
			return urlPageFoglio;				
		}
		
		//ricarica pagina lettura messaggio
		messageHelper.addMessage(redirectAttributes, new Message(MessageType.SUCCESS,"messaggio.ok"));
		return urlPageFoglio;
	}
		
	@RequestMapping(value = urltHomeReg+"/strappamsg/{idMsg}", method = RequestMethod.GET) // GET or POST
	public String strappaMsg(RedirectAttributes redirectAttributes, @PathVariable("idMsg") Integer idMsg) {
				
		String urlPageFoglio = redirectHome;
		try {
			
			if (null==idMsg) {
				//errore
				messageHelper.addMessage(redirectAttributes, new Message(MessageType.DANGER,"messaggio.error.id.strappa"));
				return urlPageFoglio;			
			}
			
			//caricamento messaggio
			Messaggio messaggio = messaggioService.findById(idMsg);
			if ( null==messaggio ) {
				//errore
				messageHelper.addMessage(redirectAttributes, new Message(MessageType.DANGER,"messaggio.error.msg.strappa"));
				return urlPageFoglio;
			}
			
			if (null==messaggio.getIdFoglio()) {
				//errore
				messageHelper.addMessage(redirectAttributes, new Message(MessageType.DANGER,"messaggio.error.foglio.strappa"));
				return redirectHome;			
			}
			
			//utente connesso
			Integer idUte = SecurityHelper.getIdUser();
			
			urlPageFoglio += "/"+messaggio.getIdFoglio();			
			if ( null==messaggio.getIdUteAut() || messaggio.getIdUteAut().intValue()!=idUte.intValue() ) {
				if ( null==messaggio.getIdUteReply() || messaggio.getIdUteReply().intValue()!=idUte.intValue() ) {
					messageHelper.addMessage(redirectAttributes, new Message(MessageType.DANGER,"messaggio.error.strappa.autore.ko"));
					return urlPageFoglio;
				}
			}			
			
			//determinazione foglio di provenienza in caso di strappo risposta al messaggio originale
			if ( idUte!=messaggio.getIdUteAut().intValue() ) {
				Messaggio msgReply = messaggioService.findById(messaggio.getIdMsgReply());
				if ( msgReply!=null )
					urlPageFoglio = redirectHome+"/"+msgReply.getIdFoglio();
			}

			//check numero max di strappi giornalieri
			boolean isStrappaGreaterMax = utenteActionCustomService.checkNumStrappaGreaterMax(idUte, new Date());
			if (isStrappaGreaterMax) {
				//errore
				messageHelper.addMessage(redirectAttributes, new Message(MessageType.DANGER,"messaggio.error.greatermax.strappa"));
				return urlPageFoglio;			
			}
			
			//strappo messaggio/conversazione e relativi tags	
			boolean isError = messaggioCustomService.strappoMsg(idUte, idMsg, messaggio.getIdMsgReply());
			if ( isError) { 				
				//errore
				messageHelper.addMessage(redirectAttributes, new Message(MessageType.DANGER,"messaggio.strappo.ko"));								
			} else  												
				messageHelper.addMessage(redirectAttributes, new Message(MessageType.SUCCESS,"messaggio.strappo.ok"));			
		
			//check assenza di messaggi per utente, default foglio1 
			int numMsg = messaggioCustomService.countMsgByIdAutore(SecurityHelper.getIdUser());							
			if ( 0==numMsg )
				urlPageFoglio = redirectHome+"/1";		
			
			//per evitare controllo su buchi fogli nel caricamento pagina
			redirectAttributes.addFlashAttribute(ConstantsDefinition.FROM_TIP_OPERAZ, ConstantsDefinition.COD_TIP_OPERAZ_STRAPPA);
			
		} catch(Exception e) {
			messageHelper.addException(redirectAttributes, "messaggio.error.delete", e);
			logger.error("******strappaMsg:" + getUserLog()+" eccezione: "+e.getMessage() );
		}
		
		return urlPageFoglio;
	}
	
	
	private boolean populateModel(Model model, Integer idFoglio) {
		
		//slogan
		model.addAttribute(ConstantsDefinition.COD_SLOGAN, ConstantsDefinition.MSG_SLOGAN);
		
		//utente connesso
		Integer idUte = SecurityHelper.getIdUser();
		
		//caricamento lista fogli indice (con bottone Add foglio abilitato)
		boolean isFoglioValido = loadListaFogliIndice(model, idFoglio, true);
		if (!isFoglioValido )
			return false;
		
		/*
		 * --------- check se presente messaggio ----
		 * - se pubblicato messaggio, non e' possibile scrivere un nuovo messaggio
		 * - se non e' stato ancora pubblicato, bottone SCRIVI abilitato
		 * 
		 * --------- check se presente risposta al messaggio pubblicato ----
		 * - se pubblicato risposta, visualizza risposta e possibilita' di RISPONDERE o STRAPPARE
		 * - se non e' presente risposta, solo bottone STRAPPA abilitato
		 */
		
		//check presenza messaggio PUBBLICO/PRIVATO su foglio specificato				
		Messaggio messaggio = findMsgViewAndBottoniera(model, idUte, idFoglio);		
		if ( null==messaggio ) {		
			//lettura messaggio random (di altri autori)					
			messaggio = findMsgRandomNoReply();	
		}  		
		
		//bottone segnalaz messaggio (non puoi segnalare i tuoi messaggi)
		if ( null!=messaggio.getIdUteAut() && idUte.intValue()!=messaggio.getIdUteAut().intValue() ) {
			
			//puoi segnalare solo i messaggi non tuoi e PUBBLICI
			if ( null!=messaggio.getCodTipMsg() && messaggio.getCodTipMsg().equals(ConstantsDefinition.CODMSG_PUB) ) 
				messaggio.setSegnala(true);
		}
	
		messaggio.setIdFoglio(idFoglio);		
		model.addAttribute(MAIN_ENTITY_NAME, messaggio);
		
		//DEBUG 
		//model.addAttribute("idUtenteConnesso", idUte);
		return true;
	}
	
	//lista fogli disponibili (ritorna false se foglio corrente non valido)
	private boolean loadListaFogliIndice(Model model, Integer idFoglioCorrente, boolean isPossibileAddNewFoglio) {
		
		//numero massimo di fogli disponibili
		model.addAttribute(NUM_MAX_FOGLI_KEY, ConstantsDefinition.NUM_MAX_FOGLI);
		
		//flag per visualizzare o meno bottone aggiungi foglio
		model.addAttribute(IS_ADD_NEW_FOGLIO, isPossibileAddNewFoglio);

		//caricamento lista messaggi TODO DA VERIFICARE CARICAMENOTO ESEGUITO GIA
		List<Messaggio> listMsg = messaggioCustomService.findMsgByAutore(SecurityHelper.getIdUser());
		
		//determinazione idfoglio ultimo foglio
		int numFogliUtilizzati = countNumFogliUtilizzatiPerMsgPubblicati(listMsg);

		//foglio di default
		if ( null==idFoglioCorrente ) {
			idFoglioCorrente = new Integer(1);
		}
						
		//caricamento lista fogli		
		if ( numFogliUtilizzati<idFoglioCorrente.intValue() ) {
			//aggiungi un nuovo foglio
			numFogliUtilizzati = idFoglioCorrente.intValue();
		}
		if ( null==listMsg || listMsg.isEmpty() )
			numFogliUtilizzati = 1;
		
		//creazione indice lista fogli  
		List<FoglioIndice> listFogli = new ArrayList<FoglioIndice>();
		for (int i=0; i<numFogliUtilizzati; i++) {
			
			FoglioIndice foglio = new FoglioIndice();
			Integer idFoglioCurrent = i+1;
			foglio.setIdFoglio(idFoglioCurrent);
			
			listFogli.add(foglio);			
			
		}//endfor
		
		//set foglio con risposta e se necessita di una risposta
		if ( listMsg!=null && !listMsg.isEmpty() ) {
			for (Messaggio messaggio : listMsg) {
				
				if ( null==messaggio )
					continue;
				
				int numFoglio = messaggio.getIdFoglio()-1;
				
				//foglio con risposta da visualizzare
				listFogli.get(numFoglio).setPresenteRisposta( messaggio.isPresenteRisposta());
				
				//foglio coinvolto in conversazione in attesa di rispondere ad un messaggio LETTO
				String codTipMsg = messaggio.getCodTipMsg();
				if ( null!=codTipMsg && codTipMsg.equals(ConstantsDefinition.CODMSG_LET )) 
					listFogli.get(numFoglio).setSendReply(true);
							
			}//endfor
		}
		
		model.addAttribute(LIST_FOGLI_INDICE, listFogli);	
				
		return true;
	}
	
	//restituisce il numero massimo dell'IdFoglio utilizzato
	private int countNumFogliUtilizzatiPerMsgPubblicati(List<Messaggio> listMsg) {
		
		int numFogliUtilizzati = 1;
		
		//messaggi pubblicati dall'utente connesso
		if ( null==listMsg )
			listMsg = messaggioCustomService.findMsgByAutore(SecurityHelper.getIdUser());
		
		if ( null==listMsg || listMsg.isEmpty() )
			return numFogliUtilizzati;
				
		for (Messaggio messaggio : listMsg) {
			if ( null==messaggio || null==messaggio.getIdFoglio())
				continue;
			if ( numFogliUtilizzati<messaggio.getIdFoglio().intValue() )
				numFogliUtilizzati = messaggio.getIdFoglio().intValue();
		}
		
		return numFogliUtilizzati;
	}
	
	//check esistenza messaggio da admin e, se esiste, pubblica
	private boolean viewMsgAmind(Model model) {

		//check e pubblicazione messaggio da ADMIN
		boolean isMessaggioAdmin = false;
		MessaggioAdmin messaggioAdmin = messaggioAdminCustomService.findByCodTipMsg(ConstantsDefinition.COD_TIP_MSG_INV);
		if (null!=messaggioAdmin ) {
			messaggioAdmin.setTitMsg(ConstantsDefinition.TIT_MSG_ADMIN);
			model.addAttribute(MESSAGGIO_ADMIN, messaggioAdmin);
			isMessaggioAdmin = true;
		}
		
		model.addAttribute(IS_MESSAGGIO_ADMIN, isMessaggioAdmin);
		return isMessaggioAdmin;
	}
	
	//restituisce il messaggio da visualizzare e setta flag per bottoniera
	private Messaggio findMsgViewAndBottoniera(Model model, Integer idUte, int idFoglio) {
		
		//bottoneria
		boolean isScrivi = false;
		boolean isReply  = false;
		boolean isLeggiAltri  = true;
		boolean isPresenteRisposta = false;			
				
		//messaggio da visualizzare
		Messaggio messaggio = null;
		try {

			//messaggio utente connesso
			messaggio = messaggioCustomService.findMsgByAutoreAndIdFoglio(idUte, idFoglio);		
			if ( null==messaggio ) {				
				//////////////////MESSAGGIO ASSENTTE///////////////
				//azioni possibili: scrittura nuovo messaggio / rispondi messaggio
				isScrivi = true;
				isReply = true;
				return null;
			} 	
				
			//////////////////MESSAGGIO PRESENTE///////////////
			//se esiste risposta, LEGGI ALTRO non possibile
			isLeggiAltri = false;
			String desTitMsgTuo = ConstantsDefinition.TIT_MSG_TUO;
			if ( messaggio.isTipMsgPri() )
				desTitMsgTuo = ConstantsDefinition.TIT_MSG_TUO_PRIV;
			else if ( messaggio.isTipMsgPub() )
				desTitMsgTuo = ConstantsDefinition.TIT_MSG_TUO_PUB;
			
			messaggio.setTitMsg(desTitMsgTuo);
			
			//check esistenza risposta			
			if ( null==messaggio.getIdMsgReply() ) 
				return messaggio;

			//lettura risposta PRIVATA
			Messaggio msgRisposta = messaggioCustomService.findMsgPerConversazionePrivata(messaggio.getIdMsgReply()
																						 , messaggio.getIdUteReply()
																						 , messaggio.getIdUteAut()																						 
																						 , messaggio.getIdMsg());							
			if ( null==msgRisposta ) 
				return messaggio;
			
			//presenza risposta
			///msgRisposta.setTitMsg(ConstantsDefinition.TIT_MSG_ALTRI);
			msgRisposta.setTitMsg(null);
			
			//tipo messaggio originale
			String codTipMsg = messaggio.getCodTipMsg();		
			
			if ( null!=codTipMsg && codTipMsg.equals(ConstantsDefinition.CODMSG_PRI )) {
			
				//se risposta successiva a messaggio originale NO REPLY			
				if ( msgRisposta.getDatUltMov().compareTo(messaggio.getDatUltMov())>0 )	{						
					isReply = false;
					isPresenteRisposta = true;										
				}	
																		
			}//endif messaggio PRIVATO
			else if ( null!=codTipMsg && codTipMsg.equals(ConstantsDefinition.CODMSG_LET )) {
				
				//visualizza risposta se presente									
				isReply = true;	
				int idFoglioOrig = messaggio.getIdFoglio();
				messaggio = msgRisposta;
				msgRisposta.setTitMsg(ConstantsDefinition.RIS_MSG_ALTRI);
				
				//attenzione -> foglio del messaggio dal quale giung la risposta 
				messaggio.setIdFoglio( idFoglioOrig );
						
			}//endif messaggio LETTO
			
		}  catch(Exception e) {
			logger.error("******findMsgViewAndBottoniera: "+ getUserLog()+"errore: " + e.getMessage() );
		} finally {

			//flag bottoniera
			model.addAttribute(isLeggiAltriMsg, isLeggiAltri);
			model.addAttribute(isScriviNewMsg, isScrivi);
			model.addAttribute(isReplyMsg, isReply);						
		}
			
		messaggio.setPresenteRisposta(isPresenteRisposta);	
		
		return messaggio;
	}
	
	//lettura di un messaggio casuale senza risposta (autore diverso da utente connesso)
	private Messaggio findMsgRandomNoReply() {
						
		//lettura messaggio random (messaggio senza risposta)
		//String msgTitRandom = ConstantsDefinition.TIT_MSG_ALTRI; 
		String msgTitRandom = null;
		Messaggio msgRandom = messaggioCustomService.findMsgRandomNoReplyAutoreDiverso(SecurityHelper.getIdUser(), ConstantsDefinition.CODMSG_PUB);
		if ( null==msgRandom ) {
			msgRandom = new Messaggio();
			msgRandom.setDesMsg(ConstantsDefinition.MSG_SLOGAN);
			
			//non esistono messaggi RANDOM pubblici di altri utenti - non possibile RISPONDERE
			msgRandom.setFoundMsgPubRandom(false);
		} 
		msgRandom.setTitMsg(msgTitRandom);
		return msgRandom;
	}

	@RequestMapping( value = urltHomeReg+"/loadNewMsg")
	public @ResponseBody Messaggio loadNewMsg(Model model) {
		
  		//lettura nuovo messaggio random
  		Messaggio msgNew = findMsgRandomNoReply();
  		return msgNew;
  	}

	//risposta  messaggio
	@RequestMapping(value = urltHomeReg+"/replymsg"+"/{idFoglio}/{idMsg}", method = RequestMethod.GET) // GET or POST
	public String replymsg(HttpServletRequest request, Model model, RedirectAttributes redirectAttributes
				,@PathVariable("idFoglio") Integer idFoglio, @PathVariable("idMsg") Integer idMsg, Messaggio messaggio) throws Exception, ParseException {
		
		try {
			
			//check foglio valido (anche se gia utilizzato)
			if ( !checkIdFoglioIsValido(idFoglio, ConstantsDefinition.COD_TIP_OPERAZ_REPLY) ) {
				return JSP_PAGEACCESSDENIED;
			}
						
			//controllo e caricanento del messagio iniziale 
			Messaggio msgReply = isCheckConversazioneValida(redirectAttributes, idMsg, idFoglio);
			if ( null==msgReply ) {								
				//return redirectHome+"/"+(idFoglio);
				model.addAttribute("msg", "impossibile rispondere: conversazione strappata");
				return JSP_PAGEACCESSDENIED;
			}
						
			msgReply.setIdFoglioOrig( idFoglio );
			msgReply.setDesMsg(null);
			model.addAttribute(MAIN_ENTITY_NAME, msgReply);
			
			//lista fogli disponibili (con bottone Add Foglio disabilitato)
			loadListaFogliIndice(model, idFoglio, false);
			
			String msgPlaceHolder = tipInfoService.findELementRandom(ConstantsDefinition.COD_FRASI_REPLY);		
			model.addAttribute("msgPlaceHolder", msgPlaceHolder);
							
		} catch(Exception e) {
			logger.error("******replymsg:" + getUserLog()+" eccezione: "+e.getMessage() );
			messageHelper.addException(redirectAttributes, "messaggio.reply.geeric.ko", e);
		}
		
		//reply messaggio
		return "typewriter/replymsg";
	}
	
	private boolean isFoglioGiaUsato(List<Messaggio> listMsg, Integer idFoglio) {
		
		boolean isFoglioGiaUsato = false;
		if ( null==listMsg || listMsg.isEmpty() )
			return false;
		
		for (Messaggio messaggio : listMsg) {
			
			if ( null==messaggio || null==messaggio.getIdFoglio() )
				continue;
			
			if ( messaggio.getIdFoglio().intValue()==idFoglio.intValue() ) {
				isFoglioGiaUsato = true;
				break;
			}
							
		}//endfor
		
		return isFoglioGiaUsato;
	}
	
	
	@RequestMapping(value = urltHomeReg+"/savereply", method = RequestMethod.POST) // GET or POST
	public String savereply(RedirectAttributes redirectAttributes, Model model, Messaggio messaggio) {
			
		String urToBack = redirectHome;
		
		try {
			
			//url per tornare al foglio origine
			if ( null!=messaggio.getIdFoglioOrig() )
				urToBack += "/"+messaggio.getIdFoglioOrig();
			
			if ( null==messaggio || null==messaggio.getDesMsg() || messaggio.getDesMsg().isEmpty() ) {
				messageHelper.addMessage(redirectAttributes, new Message(MessageType.DANGER,"messaggio.desMsg.required"));
				return urToBack;				
			}				
			
			//identficativi del messaggio originale da replicare
			Integer idMsg = messaggio.getIdMsg();
		
			//controllo e caricamento del reply messaggio INUTILE TODO
			if (null==idMsg) {
				//errore				
				logger.error("******savereply: errore idMsg null"+ getUserLog());												
				return JSP_PAGEACCESSDENIED;
			}

			//utente autore del messaggio originale al quale rispondere
			Integer idUteAut = messaggio.getIdUteAut();
			
			//utente connesso autore della riposta
			Integer idUteConnesso = SecurityHelper.getIdUser();
			
			//descrizione messaggio risposta
			String desMsgReply = messaggio.getDesMsg();
			
			//check validita messaggio TODO
			/*************
			//ricerca del messaggio tra la lista messaggi autore connesso
			List<Messaggio> listMsg = messaggioCustomService.findMsgByAutore(idUteConnesso);
			boolean isMsgPresente = isMsgPresente(listMsg, idMsg);
			if ( !isMsgPresente ) {								
				logger.error("******savereply: errore idMsg non valido: "+idMsg + " per idAutore: "+idUteAut);
				return JSP_PAGEACCESSDENIED;
			} 
			***********/
			
			//inserimento risposta e aggiornamento msgReply														
			Messaggio msgCreated = messaggioCustomService.insertReplyMsg(idMsg, idUteAut, idUteConnesso, desMsgReply, messaggio.getIdFoglioOrig());
			if ( null==msgCreated ) {								
				logger.error("******savereply: errore dopo insertReplyMsg con msgCreated null "+ getUserLog());
				model.addAttribute("msg", "Ci dispiace: la conversazione è stata cancellata dall'altra persona ...");
				return JSP_PAGEACCESSDENIED;
			} 
			
			model.addAttribute(MAIN_ENTITY_NAME, msgCreated);
			
			//ricarica pagina lettura messaggio
			populateModel(model, messaggio.getIdFoglioOrig());			
				
		} catch(Exception e) {						
			messageHelper.addMessage(redirectAttributes, new Message(MessageType.DANGER,"messaggio.reply.ko"));
			logger.error("******savereply:" + getUserLog()+" eccezione: "+e.getMessage() );
			return JSP_PAGEACCESSDENIED;
		}
				
		messageHelper.addMessage(redirectAttributes, new Message(MessageType.SUCCESS,"messaggio.reply.ok"));		
		return  urToBack;
	}
	
	//check validita messaggio
	private Messaggio isCheckConversazioneValida(RedirectAttributes redirectAttributes, Integer idMsg, Integer idFoglio) {
		
		if (null==idMsg) {
			//errore
			//messageHelper.addMessage(redirectAttributes, new Message(MessageType.DANGER,"messaggio.read.ko"));
			logger.error("******isCheckConversazioneValida: idMsg null"+ getUserLog() );
			return null;			
		}
		
		Messaggio messaggio = messaggioService.findById(idMsg);		
		String idMsgLog = " - idMsg = "+idMsg;
		if ( null==messaggio) {
			//errore
			logger.error("******isCheckConversazioneValida: Messaggio non più presente: impossibile rispondere"+ idMsgLog+ getUserLog() );
			return null;
		}
		Integer idUteConnesso = SecurityHelper.getIdUser();		
		if ( null==messaggio.getIdUteAut() || messaggio.getIdUteAut().intValue()==idUteConnesso.intValue()) {
			//errore			
			logger.error("******isCheckConversazioneValida: messaggio con idAutore uguale a utente connesso"+ idMsgLog+ getUserLog() );
			return null;
		}
		
		if ( null==messaggio.getIdUteReply() ) {
		
			//messaggio deve essere pubblico
			if ( null==messaggio.getCodTipMsg() || !messaggio.getCodTipMsg().equalsIgnoreCase(ConstantsDefinition.CODMSG_PUB) ) {
				//errore			
				logger.error("******isCheckConversazioneValida: stato del messaggio non PUBBLICO"+ idMsgLog+ getUserLog() );
				return null;
			}
			
			//lista messaggi autore connesso
			List<Messaggio> listMsg = messaggioCustomService.findMsgByAutore(SecurityHelper.getIdUser());
			boolean isFoglioGiaUsato = isFoglioGiaUsato(listMsg, idFoglio);
			if ( isFoglioGiaUsato ) {
				//errore
				logger.error("******isCheckConversazioneValida: foglio "+idFoglio+" già usato"+ idMsgLog+ getUserLog() );
				return null;
			}			
			
		} else {
			
			//esistenza messaggio replica
			Messaggio messaggioDaReplicare = messaggioService.findById(messaggio.getIdMsgReply());
			if ( null==messaggioDaReplicare || null==messaggioDaReplicare.getIdUteAut() ) {
				logger.error("******isCheckConversazioneValida: messaggio REPLY null"+ idMsgLog+ getUserLog() );
				return null;
			}
			
			//check se utente connesso parteciipa alla conversazione			
			if ( idUteConnesso.intValue()!=messaggioDaReplicare.getIdUteAut().intValue() 
				&& idUteConnesso.intValue()!=messaggioDaReplicare.getIdUteReply().intValue()) {
				logger.error("******isCheckConversazioneValida: autore messaggio REPLY non valido"+ idMsgLog+ getUserLog() );
				return null;
			}		
			
			//check se idFoglio coincide con idFoglio del messaggio originale			
			if ( idFoglio.intValue()!=messaggioDaReplicare.getIdFoglio().intValue()) {
				logger.error("******isCheckConversazioneValida: idFoglio diverso da idFoglio messaggio iniziale"+ idMsgLog+ getUserLog() );
				return null;
			}					
		}		
		
		return messaggio;
	}
		
	@RequestMapping(value = urltHomeReg+"/viewreply"+"/{idFoglio}/{idMsg}", method = RequestMethod.GET) // GET or POST
	public String viewreply(HttpServletRequest request, Model model, RedirectAttributes redirectAttributes
				,@PathVariable("idFoglio") Integer idFoglio, @PathVariable("idMsg") Integer idMsg, Messaggio messaggio) throws Exception {
				
		try {

			//controlli idMsg e idFoglio presentano risposta per utente connesso
			if ( null==idMsg || null==idFoglio ) {
				return JSP_PAGEACCESSDENIED;
			}
			
			Messaggio msgDB = messaggioService.findById(idMsg);			
			if ( null==msgDB || null==msgDB.getIdMsg() || null==msgDB.getIdUteAut() || null==msgDB.getIdFoglio() || null==msgDB.getCodTipMsg()) {
				//model.addAttribute("msg", "Conversazione bloccata: risposta cancellata dall'altra persona");				
				messageHelper.addMessage(redirectAttributes, new Message(MessageType.DANGER,"messaggio.reply.ko"));				
				String urToBack = redirectHome+"/"+idFoglio;					
				return urToBack;								
			}
			
			if ( msgDB.getCodTipMsg().equals(ConstantsDefinition.CODMSG_PUB ) ) {
				logger.error("******viewreply: tipo messaggio pubblico non valido"+ getUserLog() );
				return JSP_PAGEACCESSDENIED;
			}
			
			if ( null==msgDB.getIdUteReply() || null==msgDB.getIdMsgReply()) {
				logger.error("******viewreply: dati msg reply non validi"+ getUserLog() );
				return JSP_PAGEACCESSDENIED;
			}
			
			int idUteAUt = SecurityHelper.getIdUser().intValue();
			if (  idFoglio.intValue()!=msgDB.getIdFoglio().intValue()  
				|| idUteAUt!= msgDB.getIdUteAut().intValue() ) {
				logger.error("******viewreply: dati input non validi"+ getUserLog() );
				return JSP_PAGEACCESSDENIED;
			}
			
			//check messaggio reply coerente
			Messaggio msgReply = messaggioService.findById(msgDB.getIdMsgReply());
			if ( null==msgReply || null==msgReply.getIdMsg() || null==msgReply.getIdUteAut() || null==msgReply.getCodTipMsg())
				return JSP_PAGEACCESSDENIED;
			
			if ( msgReply.getCodTipMsg().equals(ConstantsDefinition.CODMSG_PUB ) ) {
				logger.error("******viewreply: msgReply tipo messaggio pubblico non valido"+ getUserLog() );
				return JSP_PAGEACCESSDENIED;
			}
			
			if ( msgReply.getIdUteReply().intValue()!=idUteAUt ) {
				logger.error("******viewreply: idUteAut msg reply non valido"+ getUserLog() );
				return JSP_PAGEACCESSDENIED;
			}
			
			if ( null==msgReply.getIdMsgReply() || msgReply.getIdMsgReply().intValue()!=msgDB.getIdMsg() ) {
				logger.error("******viewreply: idMsgReply msg reply non valido"+ getUserLog() );
				return JSP_PAGEACCESSDENIED;
			}
			
			//check esistenza messaggio admin
			boolean isMessaggioAdmin = viewMsgAmind(model);
			if ( isMessaggioAdmin ) {
				//visualizza pagina con messaggio admin e caricamento messaggio da visualizzare
				populateModel(model, idFoglio);
				return urlReadNsgAdmin;
			}
			
			//aggiornamento MESSAGGIO ORIGINALE A LETTO e refresh foglio di provenieneza
			updateCodTipMsgAndPopulateModel(model, idMsg, idFoglio);
			
		} catch(Exception e) {
			logger.error("******viewreply: "+ getUserLog()+"errore: " + e.getMessage() );
			messageHelper.addException(redirectAttributes, "messaggio.reply.geeric.ko", e);
		}
		
		//ricarica pagina lettura messaggio						
		return urlReadNsg;
	}

	@RequestMapping(value = urltHomeReg+"/viewmsgute", method = RequestMethod.POST) // GET or POST
	public String viewmsgute(RedirectAttributes redirectAttributes, Model model, Messaggio messaggio) {
				
		try {
			
			//contorllo congruenza messaggi per autore
			int idUteAut = SecurityHelper.getIdUser().intValue();
			List<Messaggio> listMsg = messaggioCustomService.findMsgByAutore(idUteAut);
			if ( null==listMsg || listMsg.isEmpty() ) {
				logger.error("******viewmsgute: lista messaggi vuota per idUte " +idUteAut+ getUserLog() );
				model.addAttribute("msg", "converesazione cancellata");
				return JSP_PAGEACCESSDENIED;
				//messageHelper.addMessage(redirectAttributes, new Message(MessageType.DANGER,"messaggio.reply.ko"));				
				//return redirectHome+"/"+messaggio.getIdFoglio();
			}
			
			boolean isFound = false;
			for (Messaggio msg : listMsg) {
				if ( null==msg || null==msg.getIdUteAut() )
					continue;
				
				if ( idUteAut==msg.getIdUteAut().intValue() ) {
					
					if ( msg.getIdMsg().intValue()==messaggio.getIdMsg() 
						 && msg.getIdMsgReply().intValue()==messaggio.getIdMsgReply() 
						 && msg.getIdUteReply().intValue()==messaggio.getIdUteReply()
						 && msg.getIdFoglio().intValue()==messaggio.getIdFoglio() ) {
					
							isFound = true;
							break;
					}
				}//endif idUteAut
				
			}//endfor

			if ( !isFound ) {				
				logger.error("******viewmsgute: utente autore msg non valido"+ getUserLog());
				model.addAttribute("msg", "Ci dispiace: la conversazione non è più attiva (cancellata dall'altro autore) ...");
				return JSP_PAGEACCESSDENIED;								
			}
			
			//aggiornamento MESSAGGIO ORIGINALE A LETTO
			Messaggio msgRisposta = messaggioCustomService.updateCodTipMsgAndFindMsgReply(messaggio.getIdMsg(), ConstantsDefinition.CODMSG_LET);
			
		} catch(Exception e) {
			logger.error("******viewmsgute: "+ getUserLog()+"errore: " + e.getMessage() );
			messageHelper.addException(redirectAttributes, "messaggio.reply.geeric.ko", e);
		}
		
		//ricarica pagina lettura messaggio						
		return redirectHome+"/"+messaggio.getIdFoglio();
	}
	
	private void updateCodTipMsgAndPopulateModel(Model model, Integer idMsg, Integer idFoglio) {
		
		//aggiornamento MESSAGGIO ORIGINALE A LETTO
		Messaggio msgRisposta = messaggioCustomService.updateCodTipMsgAndFindMsgReply(idMsg, ConstantsDefinition.CODMSG_LET);		
		
		//refresh foglio di provenieneza
		populateModel(model, idFoglio);
	}
	
	@RequestMapping(value = urltHomeReg+"/addNewFoglio"+"/{idFoglio}", method = RequestMethod.GET)
	public String addNewFoglio(Model model, RedirectAttributes redirectAttributes, @PathVariable("idFoglio") Integer idFoglio) {

  		//aggiunta di un nuuovo foglio
		if ( null==idFoglio )
			idFoglio = new Integer(0);

		int numFoglioSucc = idFoglio.intValue()+1;
		if ( numFoglioSucc>ConstantsDefinition.NUM_MAX_FOGLI ) {
			messageHelper.addMessage(redirectAttributes, new Message(MessageType.DANGER,"messaggio.addfogli.max,ko"));
			return redirectHome+"/"+(idFoglio);
		}
		
		//check se possibile aggiungere nuovo foglio
		Integer idAut = SecurityHelper.getIdUser();
		int numFogliUsati = messaggioCustomService.countNumFogliUtilizzati(idAut);
		int numFogliDaAgg = numFoglioSucc - numFogliUsati;
		if ( numFogliDaAgg>1 ) {
			numFoglioSucc--;
			messageHelper.addMessage(redirectAttributes, new Message(MessageType.DANGER,"messaggio.addfogli.ko"));
		} 
				
		//check se sono stati utilizzati tutti i fogli disponibili
		int numMsgPubb = messaggioCustomService.countMsgByIdAutore(idAut);
		if ( numMsgPubb<numFogliUsati ) {
			numFoglioSucc--;
			messageHelper.addMessage(redirectAttributes, new Message(MessageType.DANGER,"messaggio.addfogli.ko.foglio.vuoto"));
		} 
		
		//per evitare controllo su buchi fogli nel caricamento pagina
		redirectAttributes.addFlashAttribute(ConstantsDefinition.FROM_TIP_OPERAZ, ConstantsDefinition.COD_TIP_OPERAZ_ADD_FOGLIO);
		return redirectHome+"/"+(numFoglioSucc);
	}
		
		
	@RequestMapping( value = urltHomeReg+"/searchmsgbyhashtag"+"/{hashtag}", method = RequestMethod.GET)
	public @ResponseBody Messaggio searchmsgbyhashtag(Model model, @PathVariable("hashtag") String hashtag) {
				
		String desErr = null;
		if ( UtilityFunction.isFieldBlank(hashtag) ) {			
			//errore		
			desErr = "Per la ricerca, inserire un hashtag";				
		} else if (hashtag.length()<3 ) {
			//errore						
			desErr = "Per la ricerca, inserire un hashtag di almeno tre caratteri";			
		}
		
		//output
		Messaggio msgHashTag = new Messaggio();
		msgHashTag.setDesErrHashTag(desErr);		
		if ( null==desErr ) {
  			//lettura nuovo messaggio per hashatag
  			List<Messaggio> listMsg = messaggioCustomService.findMsgPubByHashTagAndNotAutore(hashtag, SecurityHelper.getIdUser());  		
			if ( listMsg!=null && !listMsg.isEmpty() ) {
	
				int numMsg = listMsg.size();
				Random rand = new Random();					
				msgHashTag = listMsg.get(rand.nextInt(numMsg));
				msgHashTag.setDesSuccessHashTag("messaggio trovato per l'hashtag: "+hashtag);
			} else {
				msgHashTag.setDesErrHashTag("nessun messaggio trovato per l'hashtag: "+hashtag);
			}
			
		}//endif desErr
		  		
  		return msgHashTag;
  	}

	//pagina per segnalazione messaggio offensivo	
	@RequestMapping(value = urltHomeReg+"/segnalamsg"+"/{idFoglio}/{idMsg}", method = RequestMethod.GET) // GET or POST
	public String segnalamsg(HttpServletRequest request, Model model, RedirectAttributes redirectAttributes
				,@PathVariable("idFoglio") Integer idFoglio, @PathVariable("idMsg") Integer idMsg, Messaggio messaggio) throws Exception {
		
		//controlli idMsg e idFoglio 
		if ( null==idMsg || null==idFoglio ) {
			return JSP_PAGEACCESSDENIED;
		}
		
		//lettura messaggio offensivo
		Messaggio msgDB = messaggioService.findById(idMsg);			
		if ( null==msgDB || null==msgDB.getIdMsg() || null==msgDB.getIdUteAut() || null==msgDB.getIdFoglio() || null==msgDB.getCodTipMsg())
			return JSP_PAGEACCESSDENIED;
		
		if ( !msgDB.getCodTipMsg().equals(ConstantsDefinition.CODMSG_PUB ) ) {
			logger.error("******segnalamsg: tipo messaggio NON pubblico"+getUserLog() );
			return JSP_PAGEACCESSDENIED;
		}
		
		//load indice fogli
		loadListaFogliIndice(model, messaggio.getIdFoglio(), false);	
		
		msgDB.setTitMsg(ConstantsDefinition.TIT_MSG_SEGNALATO);		
		msgDB.setIdFoglioOrig(messaggio.getIdFoglio());
		model.addAttribute(MAIN_ENTITY_NAME, msgDB);		
		
		return "typewriter/segnalamsg";
	}

	//invio segnalazione messaggio offensivo
	@RequestMapping(value = urltHomeReg+"/inviasegnalazione", method = RequestMethod.POST) // GET or POST
	public String inviasegnalazione(HttpServletRequest request, Messaggio messaggio, Model model, RedirectAttributes redirectAttributes) throws Exception, ParseException {
		
		String idFoglioOrig = "1"; 
		if ( null!=messaggio || null!=messaggio.getIdFoglioOrig() )
			idFoglioOrig = String.valueOf(messaggio.getIdFoglioOrig());
					
		MessaggioSegnalato msg = messaggioSegnalatoCustomService.insertMsgSegnalato(messaggio.getIdMsg(), messaggio.getDesMot(), SecurityHelper.getIdUser());
		if ( null!=msg )
			messageHelper.addMessage(redirectAttributes, new Message(MessageType.SUCCESS,"messaggioSegnalato.invio.ok"));
		else
			messageHelper.addMessage(redirectAttributes, new Message(MessageType.DANGER,"save.ko"));
						
		return redirectHome+"/"+idFoglioOrig;
	}


}
