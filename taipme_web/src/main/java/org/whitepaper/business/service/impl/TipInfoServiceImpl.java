/*
 * Created on 2023-12-11 ( Time 14:18:11 )
 * Generated by Telosys Tools Generator ( version 3.1.2 )
 */
package org.whitepaper.business.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;

import org.modelmapper.internal.util.Strings;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.whitepaper.bean.TipInfo;
import org.whitepaper.bean.jpa.TipInfoEntity;
import org.whitepaper.business.service.TipInfoService;
import org.whitepaper.business.service.mapping.TipInfoServiceMapper;
import org.whitepaper.data.repository.jpa.TipInfoJpaRepository;
import org.whitepaper.utility.ConstantsDefinition;
import org.whitepaper.utility.UtilityFunction;

/**
 * Implementation of TipInfoService
 */
@Component
@Transactional
public class TipInfoServiceImpl implements TipInfoService {

	@Resource
	private TipInfoJpaRepository tipInfoJpaRepository;

	@Resource
	private TipInfoServiceMapper tipInfoServiceMapper;
	
	@Override
	public TipInfo findById(Integer id) {
		TipInfoEntity tipInfoEntity = tipInfoJpaRepository.findOne(id);
		return tipInfoServiceMapper.mapTipInfoEntityToTipInfo(tipInfoEntity);
	}

	@Override
	public List<TipInfo> findAll() {
		Iterable<TipInfoEntity> entities = tipInfoJpaRepository.findAll();
		List<TipInfo> beans = new ArrayList<TipInfo>();
		for(TipInfoEntity tipInfoEntity : entities) {
			beans.add(tipInfoServiceMapper.mapTipInfoEntityToTipInfo(tipInfoEntity));
		}
		return beans;
	}

	@Override
	public TipInfo save(TipInfo tipInfo) {
		return update(tipInfo) ;
	}

	@Override
	public TipInfo create(TipInfo tipInfo) {
		
		TipInfoEntity tipInfoEntity = null;
		if ( null!=tipInfo.getId() ) 					
			tipInfoEntity = tipInfoJpaRepository.findOne(tipInfo.getId());
		
		if( tipInfoEntity != null ) {
			throw new IllegalStateException("already.exists");
		}
		tipInfoEntity = new TipInfoEntity();
		tipInfoServiceMapper.mapTipInfoToTipInfoEntity(tipInfo, tipInfoEntity);
		TipInfoEntity tipInfoEntitySaved = tipInfoJpaRepository.save(tipInfoEntity);
		return tipInfoServiceMapper.mapTipInfoEntityToTipInfo(tipInfoEntitySaved);
	}

	@Override
	public TipInfo update(TipInfo tipInfo) {
		TipInfoEntity tipInfoEntity = tipInfoJpaRepository.findOne(tipInfo.getId());
		tipInfoServiceMapper.mapTipInfoToTipInfoEntity(tipInfo, tipInfoEntity);
		TipInfoEntity tipInfoEntitySaved = tipInfoJpaRepository.save(tipInfoEntity);
		return tipInfoServiceMapper.mapTipInfoEntityToTipInfo(tipInfoEntitySaved);
	}

	@Override
	public void delete(Integer id) {
		tipInfoJpaRepository.delete(id);
	}

	public TipInfoJpaRepository getTipInfoJpaRepository() {
		return tipInfoJpaRepository;
	}

	public void setTipInfoJpaRepository(TipInfoJpaRepository tipInfoJpaRepository) {
		this.tipInfoJpaRepository = tipInfoJpaRepository;
	}

	public TipInfoServiceMapper getTipInfoServiceMapper() {
		return tipInfoServiceMapper;
	}

	public void setTipInfoServiceMapper(TipInfoServiceMapper tipInfoServiceMapper) {
		this.tipInfoServiceMapper = tipInfoServiceMapper;
	}
	
	public String findELementRandom(String codInfo) {
		
		String msgOut = ConstantsDefinition.MSG_SLOGAN;
		List<TipInfoEntity> listMsg = tipInfoJpaRepository.findByCodInfo(codInfo);
		if ( null==listMsg || listMsg.isEmpty() )
			return msgOut;
		
		Random random = new Random();
	    int indiceCasuale = random.nextInt(listMsg.size());
	    TipInfoEntity entity = listMsg.get(indiceCasuale);
	    msgOut = entity.getDesInfo();
	    if ( UtilityFunction.isFieldBlank(msgOut))
	    	msgOut = ConstantsDefinition.MSG_SLOGAN;	    
	    
	    msgOut = msgOut.replace("'", "\\'");		
		return msgOut;				
	}

}
