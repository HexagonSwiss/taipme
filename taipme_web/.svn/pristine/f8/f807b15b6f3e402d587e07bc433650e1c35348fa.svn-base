package org.whitepaper.data.repository.jpa;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.whitepaper.bean.jpa.MessaggioStatEntity;


public interface MessaggioStatJpaRepository extends PagingAndSortingRepository<MessaggioStatEntity, Integer> {
	
	@Query("select stat "			
			+ " from MessaggioStatEntity stat "			
			+ " where stat.codTipMsg = :codTipMsg "			  
			+ " and DATE(stat.dataUltMovMsg) >= :datIn"
			+ " order by stat.dataUltMovMsg")
	List<MessaggioStatEntity> findByCodTipMsgAfterDataIn(@Param("codTipMsg") String codTipMsg, @Param("datIn") Date datIn);
	
	
}
