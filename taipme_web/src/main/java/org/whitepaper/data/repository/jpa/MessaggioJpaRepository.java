package org.whitepaper.data.repository.jpa;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.whitepaper.bean.jpa.MessaggioEntity;

/**
 * Repository : Messaggio.
 */
public interface MessaggioJpaRepository extends PagingAndSortingRepository<MessaggioEntity, Integer> {

}
