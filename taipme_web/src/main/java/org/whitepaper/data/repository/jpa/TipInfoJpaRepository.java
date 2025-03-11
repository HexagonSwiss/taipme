package org.whitepaper.data.repository.jpa;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.whitepaper.bean.jpa.TipInfoEntity;

/**
 * Repository : TipInfo.
 */
public interface TipInfoJpaRepository extends PagingAndSortingRepository<TipInfoEntity, Integer> {

	
		List<TipInfoEntity> findByCodInfo(String codInfo);
	
}
