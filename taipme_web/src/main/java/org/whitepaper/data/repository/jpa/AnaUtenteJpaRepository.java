package org.whitepaper.data.repository.jpa;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.whitepaper.bean.jpa.AnaUtenteEntity;

/**
 * Repository : AnaUtente.
 */
public interface AnaUtenteJpaRepository extends PagingAndSortingRepository<AnaUtenteEntity, Integer> {

        /**
     * Finds a user by their email.
     * @param email the email of the user
     * @return the user entity if found, otherwise null
     */
    @Query("SELECT u FROM AnaUtenteEntity u WHERE u.email = :email")
    AnaUtenteEntity findByEmail(@Param("email") String email);

}
