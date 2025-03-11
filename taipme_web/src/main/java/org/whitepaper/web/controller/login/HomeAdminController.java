package org.whitepaper.web.controller.login;


import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.whitepaper.business.service.MessaggioSegnalatoService;
import org.whitepaper.business.service.custom.GestUtenteService;
import org.whitepaper.business.service.custom.MessaggioAdminCustomService;
import org.whitepaper.business.service.custom.MessaggioCustomService;
import org.whitepaper.business.service.custom.MessaggioStatCustomService;
import org.whitepaper.data.repository.jpa.custom.AggregateMsgPerCatEntity;
import org.whitepaper.data.repository.jpa.custom.AggregateMsgPerDatPub;
import org.whitepaper.utility.ConstantsDefinition;
import org.whitepaper.web.controller.BaseController;

@Controller
public class HomeAdminController extends BaseController {

	private static final String urltHomeAdmin = "/admin";
	private static final String JSP_HOMEPAGEADMIN = "homepageadmin";
	
	@Resource
	private GestUtenteService gestUtenteService;
	
	@Resource
	private MessaggioAdminCustomService messaggioAdminCustomService;
	
	@Resource
	private MessaggioSegnalatoService messaggioSegnalatoService;

	@Resource
	private MessaggioCustomService messaggioCustomService;
	
	@Resource
	MessaggioStatCustomService messaggioStatCustomService;

	//homepage utente registrato
	@RequestMapping( value = urltHomeAdmin)
	public String goHomePageAdmin(HttpServletRequest request, Model model) throws Exception, ParseException {
		
		//sezione anagrafica utenti
		setAnagraficaUtenti(model);
		
		//grafico messaggi admin
		setGraficiMessaggiAdmin(model);
		
		//sezione messaggi utenti
		setMessaggiUtenti(model);
		
		//caricamento bacheca admin	
		return JSP_HOMEPAGEADMIN;
	}
	
	private void setAnagraficaUtenti(Model model) {
		
		long numUteReg = gestUtenteService.countUtentiPerCodPrf(ConstantsDefinition.CODPFL_UTEREG);
		model.addAttribute("numUteReg", numUteReg);
		long numUteNoReg = gestUtenteService.countUtentiPerCodPrf(ConstantsDefinition.CODPFL_UTEANY);
		model.addAttribute("numUteNoReg", numUteNoReg);
	}
	
	private void setGraficiMessaggiAdmin(Model model) {

		//data dalla quale partire per grafico
		Calendar cal = Calendar.getInstance();
        cal.add(Calendar.WEEK_OF_YEAR, -4);
        Date dataSettimanaFa = cal.getTime();
        
		//grafico utenti attivi per data pubblicazione
		setDatiGraficoNumUteAttPerDataPub(model, dataSettimanaFa);
		
		//grafico messaggi bozza/inviati		
		int numMsgInv = messaggioAdminCustomService.countNumMsgBybCodTipMsg(ConstantsDefinition.COD_TIP_MSG_INV); 
		int numMsgBoz = messaggioAdminCustomService.countNumMsgBybCodTipMsg(ConstantsDefinition.COD_TIP_MSG_BOZ);
		model.addAttribute("numMsgInvAdmin", numMsgInv);
		model.addAttribute("numMsgBozAdmin", numMsgBoz);
		
		//grafico numero messaggi validi per categoria
		List<AggregateMsgPerCatEntity> listNumMsg = messaggioAdminCustomService.countNumMsgValidiPerCat(ConstantsDefinition.COD_TIP_MSG_INV);
		setDatiGraficoDaListAggregateMsgPerCatEntity(model, listNumMsg, "datiGraficoMsgPerCat", "colorGraficoMsgPerCat", "labelGraficoMsgPerCat");

		//grafico numero TOTALE di NUOVI messaggi PUBBLICI per DATA PUB
		setDatiGraficoNumMsgPerDataPub(model, dataSettimanaFa);   	
		
	}

	//numero TOTALE di NUOVI messaggi per DATA PUB
	private void setDatiGraficoNumMsgPerDataPub(Model model, Date dataSettimanaFa) {

        //numero messaggi dopo una data X
		List<AggregateMsgPerDatPub> listNumMsg = messaggioStatCustomService.countNumMessaggiPerTipoAfterDataIn(ConstantsDefinition.COD_TIP_MSG_UTEACT_TOT, dataSettimanaFa);
		
		//grafico
		String datiGraficoMsg = getDatiGraficoNumMsg(listNumMsg);
		String labelGraficoMsg = getDatiGraficoLabelMsg(listNumMsg);					
		model.addAttribute("datiGraficoNumMsgPerDatPub", datiGraficoMsg);		
		model.addAttribute("labelGraficoNumMsgPerDatPub", labelGraficoMsg);
	}
	
	//numero TOTALE di UTENTI ATTIVI per DATA PUB
	private void setDatiGraficoNumUteAttPerDataPub(Model model, Date dataSettimanaFa) {

        //numero utenti attivi dopo una data X
		List<AggregateMsgPerDatPub> listNumUteAtt = messaggioStatCustomService.countNumMessaggiPerTipoAfterDataIn(ConstantsDefinition.COD_TIP_MSG_UTEACT_UTEATT, dataSettimanaFa);
		
		//grafico
		String labelGraficoMsg = getDatiGraficoLabelMsg(listNumUteAtt);
		String datiGraficoMsg = getDatiGraficoNumMsg(listNumUteAtt);		
		String datiGraficoUteReg = getDatiGraficoDesNotMsg(listNumUteAtt);
		
		model.addAttribute("labelGraficoNumUteAttPerDatPub", labelGraficoMsg);
		model.addAttribute("datiGraficoNumUteAttPerDatPub", datiGraficoMsg);
		model.addAttribute("datiGraficoUteReg", datiGraficoUteReg);		
	}
	
	
	private String getDatiGraficoNumMsg(List<AggregateMsgPerDatPub> listNumMsg) {
		
		String datiGraficoNumMsg = "";
		if ( null==listNumMsg || listNumMsg.isEmpty() )
			return datiGraficoNumMsg;
				
		for (AggregateMsgPerDatPub aggregateMsgPerDatPub : listNumMsg) {
				if ( null==aggregateMsgPerDatPub )
					continue;
				
				datiGraficoNumMsg += "'"+aggregateMsgPerDatPub.getNumMsg()+"', ";				
												
		}//endfor
			
		if ( null!=datiGraficoNumMsg && datiGraficoNumMsg.length()>1 )
			datiGraficoNumMsg = datiGraficoNumMsg.substring(0, datiGraficoNumMsg.length()-2);
					
		return datiGraficoNumMsg;
	}
	
	private String getDatiGraficoLabelMsg(List<AggregateMsgPerDatPub> listNumMsg) {
		
		String labelGraficoMsg = "";
		if ( null==listNumMsg || listNumMsg.isEmpty() )
			return labelGraficoMsg;
		
		for (AggregateMsgPerDatPub aggregateMsgPerDatPub : listNumMsg) {
				if ( null==aggregateMsgPerDatPub )
					continue;
				
				labelGraficoMsg += "'"+aggregateMsgPerDatPub.getDataPubView()+"', ";				
												
		}//endfor
			
		if ( null!=labelGraficoMsg && labelGraficoMsg.length()>1 )
			labelGraficoMsg = labelGraficoMsg.substring(0, labelGraficoMsg.length()-2);
					
		return labelGraficoMsg;
	}
	
	private String getDatiGraficoDesNotMsg(List<AggregateMsgPerDatPub> listNumMsg) {
		
		String datiGraficoDesNotMsg = "";
		if ( null==listNumMsg || listNumMsg.isEmpty() )
			return datiGraficoDesNotMsg;
				
		for (AggregateMsgPerDatPub aggregateMsgPerDatPub : listNumMsg) {
				if ( null==aggregateMsgPerDatPub )
					continue;
				
				datiGraficoDesNotMsg += "'"+aggregateMsgPerDatPub.getDesNotMsg()+"', ";				
												
		}//endfor
			
		if ( null!=datiGraficoDesNotMsg && datiGraficoDesNotMsg.length()>1 )
			datiGraficoDesNotMsg = datiGraficoDesNotMsg.substring(0, datiGraficoDesNotMsg.length()-2);
					
		return datiGraficoDesNotMsg;
	}
	
	private void setMessaggiUtenti(Model model) {
		
		//numero di messaggi reputati offensivi
		long numMsgSegn = messaggioSegnalatoService.coutAll();
		model.addAttribute("numMsgSegn", numMsgSegn);
		
		//numero di messaggi per tipologia
		List<AggregateMsgPerCatEntity> listMsg = messaggioCustomService.countNumMsgPerTipo();
		setDatiGraficoDaListAggregateMsgPerCatEntity(model, listMsg, "datiGraficoMsgUtePerTipo", "colorGraficoMsgUtePerTipo", "labelGraficoMsgUtePerTipo");
	}
	
	//trasformazione di una lista di dati aggregati in stringe per struttur json grafico
	private void setDatiGraficoDaListAggregateMsgPerCatEntity(Model model, List<AggregateMsgPerCatEntity> listNumMsg
			,String datiGrafico, String coloriGrafico, String labelGrafico) {

		String datiGraficoMsg = "";
		String labelGraficoMsg = "";
		String colorGraficoMsg = "";
		if ( null==listNumMsg || listNumMsg.isEmpty() ) 
			return;
		
		for (AggregateMsgPerCatEntity aggregateMsgPerCatEntity : listNumMsg) {
				if ( null==aggregateMsgPerCatEntity )
					continue;
				datiGraficoMsg += "'"+aggregateMsgPerCatEntity.getNumMsg()+"', ";
				colorGraficoMsg += "'"+aggregateMsgPerCatEntity.getColCat()+"', ";
				labelGraficoMsg += "'"+aggregateMsgPerCatEntity.getDesCat()+"', ";									
		}//endfor
			
		if ( null!=datiGraficoMsg && datiGraficoMsg.length()>1 )
			datiGraficoMsg = datiGraficoMsg.substring(0, datiGraficoMsg.length()-2);
			
		if ( null!=colorGraficoMsg && colorGraficoMsg.length()>1 )
			colorGraficoMsg = colorGraficoMsg.substring(0, colorGraficoMsg.length()-2);
			
		if ( null!=labelGraficoMsg && labelGraficoMsg.length()>1 )
			labelGraficoMsg = labelGraficoMsg.substring(0, labelGraficoMsg.length()-2);
			
		model.addAttribute(datiGrafico, datiGraficoMsg);
		model.addAttribute(coloriGrafico, colorGraficoMsg);
		model.addAttribute(labelGrafico, labelGraficoMsg);
	}
	
}
