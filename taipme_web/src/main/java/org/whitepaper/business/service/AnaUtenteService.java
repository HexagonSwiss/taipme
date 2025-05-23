/*
 * Created on 2022-11-03 ( Time 15:19:59 )
 * Generated by Telosys Tools Generator ( version 3.1.2 )
 */
package org.whitepaper.business.service;

import java.util.List;

import org.whitepaper.bean.AnaUtente;

/**
 * Business Service Interface for entity AnaUtente.
 */
public interface AnaUtenteService { 

	/**
	 * Loads an entity from the database using its Primary Key
	 * @param idUte
	 * @return entity
	 */
	AnaUtente findById( Integer idUte  ) ;

	/**
	 * Finds a user by their email for authentication purposes.
	 * 
	 * @param email the email of the user
	 * @return the user entity if found, otherwise null
	 */
	AnaUtente findUtenteByEmail(String email);

	/**
	 * Loads all entities.
	 * @return all entities
	 */
	List<AnaUtente> findAll();

	/**
	 * Saves the given entity in the database (create or update)
	 * @param entity
	 * @return entity
	 */
	AnaUtente save(AnaUtente entity);

	/**
	 * Updates the given entity in the database
	 * @param entity
	 * @return
	 */
	AnaUtente update(AnaUtente entity);

	/**
	 * Creates the given entity in the database
	 * @param entity
	 * @return
	 */
	AnaUtente create(AnaUtente entity);

	/**
	 * Deletes an entity using its Primary Key
	 * @param idUte
	 */
	void delete( Integer idUte );


}
