package org.whitepaper.data.repository.jpa.custom;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.whitepaper.bean.jpa.AnaUtenteEntity;
import org.whitepaper.data.repository.jpa.AnaUtenteJpaRepository;


public interface AnaUtenteCustomJpaRepository extends AnaUtenteJpaRepository {

	@Query("select a "
			+ "from AnaUtenteEntity a "			
			+ "where a.email = :email ")
	AnaUtenteEntity findByEmail(@Param("email") String email);

	AnaUtenteEntity findByConUid(String conUid);
	
	//count per codice tipo profilo
	Long countByTipProfiloCodTipPrf(String codTipPrf);	
}
