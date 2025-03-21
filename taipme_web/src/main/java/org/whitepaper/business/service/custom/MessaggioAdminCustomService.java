/*
 * Created on 13 lug 2017 ( Time 12:07:28 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package org.whitepaper.business.service.custom;

import java.util.List;

import org.whitepaper.bean.MessaggioAdmin;
import org.whitepaper.data.repository.jpa.custom.AggregateMsgPerCatEntity;

public interface MessaggioAdminCustomService { 
	
	//messaggio per codice (restituisce il piu recente)		
	MessaggioAdmin findByCodTipMsg(String codTipMsg);
	
	//numero di messaggi validi per codice
	int countNumMsgBybCodTipMsg(String codTipMsg);
	
	//numero di messaggi validi per ogni categoria
	List<AggregateMsgPerCatEntity> countNumMsgValidiPerCat(String codTipMsg);
	
}
