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
import org.whitepaper.bean.AnaUtente;
import org.whitepaper.bean.jpa.AnaUtenteEntity;
import org.whitepaper.business.service.AnaUtenteService;
import org.whitepaper.business.service.custom.GestUtenteService;
import org.whitepaper.business.service.mapping.AnaUtenteServiceMapper;
import org.whitepaper.data.repository.jpa.AnaUtenteJpaRepository;
import org.whitepaper.data.repository.jpa.custom.AnaUtenteCustomJpaRepository;
import org.whitepaper.utility.ConstantsDefinition;
import org.whitepaper.utility.EncoderGenerator;

/**
 * Implementation of AnaUtenteService
 */
@Component
@Transactional(rollbackFor = Exception.class)
public class GestUtenteServiceImpl implements GestUtenteService {

	private static Logger logger = LoggerFactory.getLogger(GestUtenteServiceImpl.class);
	
	@Resource
	private AnaUtenteJpaRepository anaUtenteJpaRepository;
	
	@Resource
	private AnaUtenteCustomJpaRepository anaUtenteCusotmJpaRepository;
		
	@Resource
	private AnaUtenteServiceMapper anaUtenteServiceMapper;
		
	@Resource
	private AnaUtenteService anaUtenteService;
	
	@Resource
	private SendEmailService sendEmailService;
	
	public String checkUsernameMail(String email){
		AnaUtente anaUtenteExisting = findUtenteByMail(email);
		if (anaUtenteExisting != null)
			return "reg.mailesistente";
							
		return null;
	}
	
	
	public AnaUtente insertUtente(AnaUtente anaUtente, String linkConferma) throws Exception {
							
		//registrazione utente
		AnaUtenteEntity anaUtenteEntity = 	new AnaUtenteEntity();
		anaUtenteServiceMapper.mapAnaUtenteToAnaUtenteEntity(anaUtente, anaUtenteEntity);
		AnaUtenteEntity anaUtenteEntitySaved = anaUtenteJpaRepository.save(anaUtenteEntity);
		AnaUtente user =  anaUtenteServiceMapper.mapAnaUtenteEntityToAnaUtente(anaUtenteEntitySaved);			
				
		try {
			//email conferma
			sendEmailService.sendConfUtenzaMail(user.getEmail(), linkConferma);
		} catch (Exception ex) {
			logger.error("******insertUtente: errore invio email conferma - email:"+anaUtente.getEmail()+" - STACK TRACE: ", ex );
			throw ex;
		}
		
		
		return user;
	}

	

	public AnaUtenteJpaRepository getAnaUtenteJpaRepository() {
		return anaUtenteJpaRepository;
	}

	

	public AnaUtenteServiceMapper getAnaUtenteServiceMapper() {
		return anaUtenteServiceMapper;
	}

	public void setAnaUtenteServiceMapper(AnaUtenteServiceMapper anaUtenteServiceMapper) {
		this.anaUtenteServiceMapper = anaUtenteServiceMapper;
	}
	
	
	public AnaUtente findUtenteByConUid(String conUid){	
		
		AnaUtenteEntity anaUtenteEntity = anaUtenteCusotmJpaRepository.findByConUid(conUid);
		return anaUtenteServiceMapper.mapAnaUtenteEntityToAnaUtente(anaUtenteEntity);		
	}
	
	
	public AnaUtente findUtenteByMail(String email){	
		AnaUtenteEntity anaUtenteEntity = anaUtenteCusotmJpaRepository.findByEmail(email);
		return anaUtenteServiceMapper.mapAnaUtenteEntityToAnaUtente(anaUtenteEntity);	
	}

	//conferma registrazione utente da ANY a REG
	public String confermaUtente(AnaUtente anaUtente){				
		if (anaUtente == null){
			// uid non trovato dare errore
			return "conf.linkKO";
		}
		
		if ( null==anaUtente.getCodTipPrf() || !anaUtente.getCodTipPrf().equalsIgnoreCase(ConstantsDefinition.CODPFL_UTEANY ) ) {
			return "conf.link_ute.KO";
		}
					
		anaUtente.setConUid(null);
		anaUtente.setCodTipPrf(ConstantsDefinition.CODPFL_UTEREG);
		anaUtente.setDatCreUte( Calendar.getInstance().getTime() );
		anaUtente.setDatUltMov(Calendar.getInstance().getTime());
		
		anaUtenteService.save(anaUtente);

		//output			
		return null;
	}


		
	
	public AnaUtente updatePassword(AnaUtente anaUtente) {
		AnaUtenteEntity anaUtenteEntity = anaUtenteJpaRepository.findOne(anaUtente.getIdUte());
		anaUtenteEntity.setPwd(EncoderGenerator.encode(anaUtente.getPwd()));
		AnaUtenteEntity anaUtenteEntitySaved = anaUtenteJpaRepository.save(anaUtenteEntity);
		return anaUtenteServiceMapper.mapAnaUtenteEntityToAnaUtente(anaUtenteEntitySaved);
	}
	
	public AnaUtente updateUserNoPassword(AnaUtente anaUtente) {
		AnaUtenteEntity anaUtenteEntity = anaUtenteJpaRepository.findOne(anaUtente.getIdUte());
		String oldPwd = anaUtenteEntity.getPwd();
		anaUtenteServiceMapper.mapAnaUtenteToAnaUtenteEntity(anaUtente, anaUtenteEntity);
		if (anaUtenteEntity.getPwd() == null)
			anaUtenteEntity.setPwd(oldPwd);
		AnaUtenteEntity anaUtenteEntitySaved = anaUtenteJpaRepository.save(anaUtenteEntity);
		return anaUtenteServiceMapper.mapAnaUtenteEntityToAnaUtente(anaUtenteEntitySaved);
	}
	
	public AnaUtente updateRecuperoPassword(AnaUtente anaUtente, String linkRecupero){
		AnaUtenteEntity anaUtenteEntity = anaUtenteJpaRepository.findOne(anaUtente.getIdUte());
		anaUtenteServiceMapper.mapAnaUtenteToAnaUtenteEntity(anaUtente, anaUtenteEntity);

		AnaUtenteEntity anaUtenteEntitySaved = anaUtenteJpaRepository.save(anaUtenteEntity);
		
		// invio mail
		sendEmailService.sendForgotPasswordMail(anaUtenteEntity.getEmail(), linkRecupero);	
		return anaUtenteServiceMapper.mapAnaUtenteEntityToAnaUtente(anaUtenteEntitySaved);
	}
		

	public AnaUtente updatePasswordByLinkRecupero(AnaUtente anaUtente) {
		AnaUtenteEntity anaUtenteEntity = anaUtenteJpaRepository.findOne(anaUtente.getIdUte());
		anaUtenteEntity.setPwd(EncoderGenerator.encode(anaUtente.getPwd()));
		anaUtenteEntity.setConUid(null);
		AnaUtenteEntity anaUtenteEntitySaved = anaUtenteJpaRepository.save(anaUtenteEntity);
		return anaUtenteServiceMapper.mapAnaUtenteEntityToAnaUtente(anaUtenteEntitySaved);
	}
	
	
	public AnaUtente findUtentePerIdUte(Integer idUte) {
		return anaUtenteService.findById(idUte);
	}


	public long countUtentiPerCodPrf(String codTipPrf) {
		return anaUtenteCusotmJpaRepository.countByTipProfiloCodTipPrf(codTipPrf);
	}
    
}
