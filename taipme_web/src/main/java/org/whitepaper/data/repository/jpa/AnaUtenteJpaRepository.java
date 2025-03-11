package org.whitepaper.data.repository.jpa;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.whitepaper.bean.jpa.AnaUtenteEntity;

/**
 * Repository : AnaUtente.
 */
public interface AnaUtenteJpaRepository extends PagingAndSortingRepository<AnaUtenteEntity, Integer> {

}
