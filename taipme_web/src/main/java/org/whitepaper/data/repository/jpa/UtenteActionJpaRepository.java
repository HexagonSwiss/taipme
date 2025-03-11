package org.whitepaper.data.repository.jpa;

import java.util.Date;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.whitepaper.bean.jpa.UtenteActionEntity;

/**
 * Repository : AnaUtente.
 */
public interface UtenteActionJpaRepository extends PagingAndSortingRepository<UtenteActionEntity, Integer> {

	@Query("select ute "			
			+ " from UtenteActionEntity ute "			
			+ " where ute.idUte = :idUte "			  
			+ " and ute.codAction = :codAction "
			+ " and DATE(ute.datAction) = :datAction")
	UtenteActionEntity findByIdUteAndCodActionAndDatAction(@Param("idUte") Integer idUte, @Param("codAction") String codAction, @Param("datAction") Date datAction);
	
	
}
