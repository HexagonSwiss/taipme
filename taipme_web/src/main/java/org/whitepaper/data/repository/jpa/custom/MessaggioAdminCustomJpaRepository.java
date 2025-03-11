package org.whitepaper.data.repository.jpa.custom;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.whitepaper.bean.jpa.MessaggioAdminEntity;
import org.whitepaper.data.repository.jpa.MessaggioTagsJpaRepository;


public interface MessaggioAdminCustomJpaRepository extends MessaggioTagsJpaRepository {
	
	//messaggio per codice e data valida
	@Query("select ma "
			+ " from MessaggioAdminEntity ma "			
			+ " where ma.tipMessaggio.codTipMsg = :codTipMsg "
			+ " and (ma.datInizioVal is null or sysdate() > ma.datInizioVal  ) "  
			+ " and (ma.datFineVal is null or sysdate() < ma.datFineVal )")
	List<MessaggioAdminEntity> findByCodTipMsg(@Param("codTipMsg") String codTipMsg);
	

	//count messaggi validi per codice e data valida
	@Query("select count(*) "
			+ " from MessaggioAdminEntity ma "			
			+ " where ma.tipMessaggio.codTipMsg = :codTipMsg "
			+ " and (ma.datInizioVal is null or sysdate() > ma.datInizioVal  ) "  
			+ " and (ma.datFineVal is null or sysdate() < ma.datFineVal )")
	Integer countByCodTipMsg(@Param("codTipMsg") String codTipMsg);
	
	/*	 
		 select count(*) as numMsg, ma.cat_msg, cm.color_cat, cm.des_cat_msg
		from fogliobianco.messaggio_admin ma, fogliobianco.cat_messaggio cm
		where ma.cod_tip_msg = 'INV' 
		and ma.cat_msg = cm.cat_msg
		and (ma.dat_inizio_val is null or sysdate() > ma.dat_inizio_val  )   
		and (ma.dat_fine_val is null or sysdate() < ma.dat_fine_val )
		group by ma.cat_msg
		order by numMsg desc	 
	 */
	//count messaggi validi per ogni categoria
	@Query("select DISTINCT new org.whitepaper.data.repository.jpa.custom.AggregateMsgPerCatEntity "
			+  "(ma.catMessaggio.catMsg, cm.desCatMsg, cm.colorCat, COUNT(ma.catMessaggio.catMsg)) "
			+ " from MessaggioAdminEntity ma, CatMessaggioEntity cm "			
			+ " where ma.tipMessaggio.codTipMsg = :codTipMsg "
			+ " and ma.catMessaggio.catMsg = cm.catMsg "
			+ " and (ma.datInizioVal is null or sysdate() > ma.datInizioVal  ) "  
			+ " and (ma.datFineVal is null or sysdate() < ma.datFineVal )"
			+ " group by ma.catMessaggio.catMsg ")
	List<AggregateMsgPerCatEntity> countNumMsgValidiPerCat(@Param("codTipMsg") String codTipMsg);
	
	
}
