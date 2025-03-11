package org.whitepaper.data.repository.jpa;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.whitepaper.bean.jpa.CatMessaggioEntity;

/**
 * Repository : CatMessaggio.
 */
public interface CatMessaggioJpaRepository extends PagingAndSortingRepository<CatMessaggioEntity, String> {

}
