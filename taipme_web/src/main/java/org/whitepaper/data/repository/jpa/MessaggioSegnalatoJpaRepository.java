package org.whitepaper.data.repository.jpa;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.whitepaper.bean.jpa.MessaggioSegnalatoEntity;

/**
 * Repository : MessaggioSegnalato.
 */
public interface MessaggioSegnalatoJpaRepository extends PagingAndSortingRepository<MessaggioSegnalatoEntity, Integer> {

	
	int deleteByMessaggioIdMsg(Integer idMsg);
}
