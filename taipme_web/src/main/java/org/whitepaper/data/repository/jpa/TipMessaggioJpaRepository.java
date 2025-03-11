package org.whitepaper.data.repository.jpa;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.whitepaper.bean.jpa.TipMessaggioEntity;

/**
 * Repository : TipMessaggio.
 */
public interface TipMessaggioJpaRepository extends PagingAndSortingRepository<TipMessaggioEntity, String> {

}
