/*
 * Created on 19 gen 2023 ( Time 08:35:45 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package org.whitepaper.business.service.mapping;

import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.stereotype.Component;
import org.whitepaper.bean.MessaggioSegnalato;
import org.whitepaper.bean.jpa.AnaUtenteEntity;
import org.whitepaper.bean.jpa.MessaggioEntity;
import org.whitepaper.bean.jpa.MessaggioSegnalatoEntity;

/**
 * Mapping between entity beans and display beans.
 */
@Component
public class MessaggioSegnalatoServiceMapper extends AbstractServiceMapper {

	/**
	 * ModelMapper : bean to bean mapping library.
	 */
	private ModelMapper modelMapper;
	
	/**
	 * Constructor.
	 */
	public MessaggioSegnalatoServiceMapper() {
		modelMapper = new ModelMapper();
		modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);
	}

	/**
	 * Mapping from 'MessaggioSegnalatoEntity' to 'MessaggioSegnalato'
	 * @param messaggioSegnalatoEntity
	 */
	public MessaggioSegnalato mapMessaggioSegnalatoEntityToMessaggioSegnalato(MessaggioSegnalatoEntity messaggioSegnalatoEntity) {
		if(messaggioSegnalatoEntity == null) {
			return null;
		}

		//--- Generic mapping 
		MessaggioSegnalato messaggioSegnalato = map(messaggioSegnalatoEntity, MessaggioSegnalato.class);

		//--- Link mapping ( link to Messaggio )
		if(messaggioSegnalatoEntity.getMessaggio() != null) {
			messaggioSegnalato.setIdMsg(messaggioSegnalatoEntity.getMessaggio().getIdMsg());
			messaggioSegnalato.setDesMsg(messaggioSegnalatoEntity.getMessaggio().getDesMsg());
			if ( null!=messaggioSegnalatoEntity.getMessaggio().getAnaUtente() ) 
				messaggioSegnalato.setEmailUteAut( messaggioSegnalatoEntity.getMessaggio().getAnaUtente().getEmail() );
		}
		//--- Link mapping ( link to AnaUtente )
		if(messaggioSegnalatoEntity.getAnaUtente() != null) {
			messaggioSegnalato.setIdUteSegn(messaggioSegnalatoEntity.getAnaUtente().getIdUte());
			messaggioSegnalato.setEmailUteSegn(messaggioSegnalatoEntity.getAnaUtente().getEmail());
		}
		return messaggioSegnalato;
	}
	
	/**
	 * Mapping from 'MessaggioSegnalato' to 'MessaggioSegnalatoEntity'
	 * @param messaggioSegnalato
	 * @param messaggioSegnalatoEntity
	 */
	public void mapMessaggioSegnalatoToMessaggioSegnalatoEntity(MessaggioSegnalato messaggioSegnalato, MessaggioSegnalatoEntity messaggioSegnalatoEntity) {
		if(messaggioSegnalato == null) {
			return;
		}

		//--- Generic mapping 
		map(messaggioSegnalato, messaggioSegnalatoEntity);

		//--- Link mapping ( link : messaggioSegnalato )
		if( hasLinkToMessaggio(messaggioSegnalato) ) {
			MessaggioEntity messaggio1 = new MessaggioEntity();
			messaggio1.setIdMsg( messaggioSegnalato.getIdMsg() );
			messaggioSegnalatoEntity.setMessaggio( messaggio1 );
		} else {
			messaggioSegnalatoEntity.setMessaggio( null );
		}

		//--- Link mapping ( link : messaggioSegnalato )
		if( hasLinkToAnaUtente(messaggioSegnalato) ) {
			AnaUtenteEntity anaUtente2 = new AnaUtenteEntity();
			anaUtente2.setIdUte( messaggioSegnalato.getIdUteSegn() );
			messaggioSegnalatoEntity.setAnaUtente( anaUtente2 );
		} else {
			messaggioSegnalatoEntity.setAnaUtente( null );
		}

	}
	
	/**
	 * Verify that Messaggio id is valid.
	 * @param Messaggio Messaggio
	 * @return boolean
	 */
	private boolean hasLinkToMessaggio(MessaggioSegnalato messaggioSegnalato) {
		if(messaggioSegnalato.getIdMsg() != null) {
			return true;
		}
		return false;
	}

	/**
	 * Verify that AnaUtente id is valid.
	 * @param AnaUtente AnaUtente
	 * @return boolean
	 */
	private boolean hasLinkToAnaUtente(MessaggioSegnalato messaggioSegnalato) {
		if(messaggioSegnalato.getIdUteSegn() != null) {
			return true;
		}
		return false;
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	protected ModelMapper getModelMapper() {
		return modelMapper;
	}

	protected void setModelMapper(ModelMapper modelMapper) {
		this.modelMapper = modelMapper;
	}

}