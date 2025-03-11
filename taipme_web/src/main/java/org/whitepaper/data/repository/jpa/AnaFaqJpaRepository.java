package org.whitepaper.data.repository.jpa;


import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.whitepaper.bean.jpa.AnaFaqEntity;

/**
 * Repository : AnaFaq.
 */
public interface AnaFaqJpaRepository extends PagingAndSortingRepository<AnaFaqEntity, Integer> {

	//faq per stato
	List<AnaFaqEntity> findByCodStaFaqOrderByIdFaq(String codStaFaq);
}
