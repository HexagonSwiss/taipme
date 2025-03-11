package org.whitepaper.data.repository.jpa;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.whitepaper.bean.jpa.TipProfiloEntity;

/**
 * Repository : TipProfilo.
 */
public interface TipProfiloJpaRepository extends PagingAndSortingRepository<TipProfiloEntity, String> {

}
