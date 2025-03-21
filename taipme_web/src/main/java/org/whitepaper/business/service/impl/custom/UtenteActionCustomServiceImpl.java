/*
 * Created on 13 lug 2017 ( Time 12:07:28 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package org.whitepaper.business.service.impl.custom;

import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.whitepaper.bean.jpa.UtenteActionEntity;
import org.whitepaper.business.service.custom.UtenteActionCustomService;
import org.whitepaper.data.repository.jpa.UtenteActionJpaRepository;
import org.whitepaper.utility.ConstantsDefinition;


@Component
@Transactional(rollbackFor = Exception.class)
public class UtenteActionCustomServiceImpl implements UtenteActionCustomService {

	private static Logger logger = LoggerFactory.getLogger(UtenteActionCustomServiceImpl.class);

	@Resource
	UtenteActionJpaRepository utenteActionJpaRepository;
	
	//check se numero di STRAPPA supera il max consentito per giornata
	public boolean checkNumStrappaGreaterMax(int idUte, Date dataIn) {
				
		try {			
		
			//check esistenza
			UtenteActionEntity entity = utenteActionJpaRepository.findByIdUteAndCodActionAndDatAction(idUte, ConstantsDefinition.COD_TIP_OPERAZ_STRAPPA, dataIn);
			if ( null!=entity && entity.getNumAction()>=ConstantsDefinition.NUM_MAX_OPERAZ_STRAPPA )
				return true;
			
		} catch (Exception ex) {
			logger.error("******checkNumStrappaGreaterMax: errore: " + ex.getMessage() );
			return false;
		}		
		
		return false;
	}
	
	
	//incrementa il numero di azionei dell'utente per data
	public boolean saveNumActionPerIdUteAndData(int idUte, String codAction, Date dataIn) {
		
		boolean isError = false;
		try {			
		
			//check esistenza
			UtenteActionEntity entity = utenteActionJpaRepository.findByIdUteAndCodActionAndDatAction(idUte, codAction, dataIn);
			if ( null==entity ) {
				//save
				entity = new UtenteActionEntity();
				entity.setIdUte(idUte);
				entity.setCodAction(codAction);
				entity.setDatAction(dataIn);
				entity.setDatUltMov( Calendar.getInstance().getTime() );
				entity.setNumAction(1);
				
			} else {
				//update
				int numAction = entity.getNumAction()+1;
				entity.setDatUltMov( Calendar.getInstance().getTime() );
				entity.setNumAction(numAction);
			}
			
			utenteActionJpaRepository.save(entity);			
			
		} catch (Exception ex) {
			logger.error("******saveNumActionPerIdUteAndData: errore: " + ex.getMessage() );
			isError = false;
		}		
		
		return isError;
	}
	
	

}
