/*
 * Created on 13 lug 2017 ( Time 12:07:28 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package org.whitepaper.business.service.impl.custom;

import java.util.Calendar;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.whitepaper.bean.Messaggio;
import org.whitepaper.bean.MessaggioSegnalato;
import org.whitepaper.business.service.MessaggioSegnalatoService;
import org.whitepaper.business.service.custom.MessaggioCustomService;
import org.whitepaper.business.service.custom.MessaggioSegnalatoCustomService;
import org.whitepaper.data.repository.jpa.MessaggioSegnalatoJpaRepository;
import org.whitepaper.utility.ConstantsDefinition;

/**
 * Implementation of AnaUtenteService
 */
@Component
@Transactional(rollbackFor = Exception.class)
public class MessaggioSegnalatoCustomServiceImpl implements MessaggioSegnalatoCustomService {

	private static Logger logger = LoggerFactory.getLogger(MessaggioSegnalatoCustomServiceImpl.class);

	@Resource
	private MessaggioSegnalatoService messaggioSegnalatoService;
	
	@Resource
	private MessaggioSegnalatoJpaRepository messaggioSegnalatoJpaRepository;
	
	@Resource
	private MessaggioCustomService messaggioCustomService;
	
	//save messaggio segnalato 	
	public MessaggioSegnalato insertMsgSegnalato(Integer idMsg, String desMot, Integer idUteSegnalatore) {
		
		MessaggioSegnalato msg = null;	
		try {			
			MessaggioSegnalato msgSegnalato = new MessaggioSegnalato();
			msgSegnalato.setIdMsg(idMsg);
			msgSegnalato.setDesMot(desMot);
			msgSegnalato.setIdUteSegn(idUteSegnalatore);
			msgSegnalato.setDatSegn(Calendar.getInstance().getTime());
			msgSegnalato.setDatUltMov(Calendar.getInstance().getTime());			
			msg = messaggioSegnalatoService.create(msgSegnalato);
			
		} catch (Exception ex) {
			logger.error("******insertMsgSegnalato: errore: " + ex.getMessage() );
		}		
		
		return msg;
	}
	
	//conferma messaggio segnalato come offensivo 	
	/*
	 * idMsgSegn: id della segnalazione
	 * idMsg: id del messaggio ritenuto offensivo
	 */
	public boolean confermaSegnalazione(Integer idMsgSegn, Integer idMsg) {
		
		boolean isOk = true;	
		try {			
			//aggiornamento del messaggio a stato OFFENSIVO
			Messaggio msgCCO = messaggioCustomService.updateCodTipMsgAndFindMsgReply(idMsg, ConstantsDefinition.CODMSG_CCO);
			if ( null!=msgCCO ) {
				//cancellazione segnalazione 
				messaggioSegnalatoService.delete(idMsgSegn);
			}
			
		} catch (Exception ex) {
			logger.error("******confermasegnalazione: errore: " + ex.getMessage() );
			isOk = false;
		}		
		
		return isOk;
	}
	
	//cancellazione per idMsg
	public int deleteMsgPerIdMsg(Integer idMsg) {

		int numDel = 0;	
		try {			
			numDel = messaggioSegnalatoJpaRepository.deleteByMessaggioIdMsg(idMsg);
			
		} catch (Exception ex) {
			logger.error("******deleteMsgPerIdMsg: errore: " + ex.getMessage() );
		}		
		
		return numDel;
	}
}
