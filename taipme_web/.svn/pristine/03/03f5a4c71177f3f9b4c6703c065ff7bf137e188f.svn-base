package org.whitepaper.data.repository.jpa.custom;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.whitepaper.bean.jpa.MessaggioEntity;
import org.whitepaper.data.repository.jpa.MessaggioTagsJpaRepository;


public interface MessaggioCustomJpaRepository extends MessaggioTagsJpaRepository {

	//conta numero messaggi di autori diversi per tipo (senza risposta)
	@Query("select count(*) "
			+ "from MessaggioEntity m "			
			+ " where m.anaUtente.idUte != :idUteAut "
			+ " and m.tipMessaggio.codTipMsg = :codTipMsg "
			+ " and m.anaUtente2.idUte is null ")
	Integer countNumMsgNotIdAutoreAndCodTipMsgAndReplyNull(@Param("idUteAut") Integer idUteAut, @Param("codTipMsg") String codTipMsg);
	
	//leggi messaggi di autori diversi per tipo (senza risposta)
	@Query("select m "
			+ "from MessaggioEntity m "			
			+ " where m.anaUtente.idUte != :idUteAut "
			+ " and m.tipMessaggio.codTipMsg = :codTipMsg "
			+ " and m.anaUtente2.idUte is null "
			//+ " and  m.idMsg >= (SELECT MAX(idMsg) * RAND() FROM MessaggioEntity) "
			)
	List<MessaggioEntity> findByNotIdAutoreAndCodTipMsgAndReplyNull(@Param("idUteAut") Integer idUteAut, @Param("codTipMsg") String codTipMsg);
	
	//messaggi per autore 
	@Query("select m "
			+ "from MessaggioEntity m "			
			+ " where m.anaUtente.idUte = :idUteAut "
			+ " order by m.idFoglio")
	List<MessaggioEntity> findByIdAutore(@Param("idUteAut") Integer idUteAut);
	
	//numero di messaggi per autore 
	@Query("select count(*)  "
			+ "from MessaggioEntity m "			
			+ " where m.anaUtente.idUte = :idUteAut ")
	Long countMsgByIdAutore(@Param("idUteAut") Integer idUteAut);
	
	//messaggio per autore e foglio
	@Query("select m "
			+ "from MessaggioEntity m "			
			+ " where m.anaUtente.idUte = :idUteAut "			
			+ " and m.idFoglio = :idFoglio ")
	List<MessaggioEntity> findByIdAutoreAndIdFoglio(@Param("idUteAut") Integer idUteAut, @Param("idFoglio") Integer idFoglio);
	
	//messaggio per id, autore, utente reply, tipo messaggio e id utente reply
	@Query("select m "
			+ "from MessaggioEntity m "			
			+ " where m.idMsg = :idMsg "
			+ " and m.anaUtente.idUte = :idUteAut "
			+ " and m.anaUtente2.idUte = :idUteReply "
			+ " and m.tipMessaggio.codTipMsg = :codTipMsg "
			//+ " and m.idFoglio = :idFoglio "
			+ " and m.id.idMsgReply = :idMsgReply")
	List<MessaggioEntity> findMsgPerConversazione(@Param("idMsg") Integer idMsg
												 ,@Param("idUteAut") Integer idUteAut
												 ,@Param("idUteReply") Integer idUteReply
												 ,@Param("codTipMsg") String codTipMsg												 
												 ,@Param("idMsgReply") Integer idMsgReply);
	
	//messaggio per idMsg e foglio
	@Query("select m "
			+ "from MessaggioEntity m "			
			+ " where m.idMsg = :idMsg "			
			+ " and m.idFoglio = :idFoglio ")
	MessaggioEntity findByIdMsgAndIdFoglio(@Param("idMsg") Integer idMsg, @Param("idFoglio") Integer idFoglio);
		
	//numero di fogli utilizzati dall'utente
	@Query("select max(m.idFoglio) "
			+ "from MessaggioEntity m "						
			+ " where m.anaUtente.idUte = :idUteAut ")
	Integer countNumFogliUtilizzati(@Param("idUteAut") Integer idUteAut);
		
	//count messaggi per tipo
	@Query("select DISTINCT new org.whitepaper.data.repository.jpa.custom.AggregateMsgPerCatEntity "
			+  "(mes.tipMessaggio.codTipMsg, mes.tipMessaggio.desTipMsg, tm.colorTip, COUNT(mes.tipMessaggio.codTipMsg)) "
			+ " from MessaggioEntity mes, TipMessaggioEntity tm "			
			+ " where mes.tipMessaggio.codTipMsg = tm.codTipMsg "			
			+ " group by mes.tipMessaggio.codTipMsg ")
	List<AggregateMsgPerCatEntity> countNumMsgPerTipo();
	
	//ricerca per tag e autore diverso da autore corrente
	@Query("select m "
			+ "from MessaggioTagsEntity ta, MessaggioEntity m "			
			+ " where ta.messaggio.idMsg = m.idMsg "			
			+ " and ta.tag = :tag "
			+ " and m.anaUtente.idUte != :idUteAut "
			+ " and m.tipMessaggio.codTipMsg = 'PUB'")
	List<MessaggioEntity> findMsgPubByHashTagAndNotAutore(@Param("tag") String tag, @Param("idUteAut") Integer idUteAut);	
	
	//ricerca per tipo messaggio
	@Query("select m "
			+ "from MessaggioEntity m "			
			+ " where m.tipMessaggio.codTipMsg = :codTipMsg")
	List<MessaggioEntity> findByCodTipMsg(@Param("codTipMsg") String codTipMsg);
	
	//numero di messaggi pubblicati in una data in input
	@Query(value="SELECT DISTINCT new org.whitepaper.data.repository.jpa.custom.AggregateMsgPerDatPub "
			+ "(DATE(mess.dataPub), COUNT(mess.idMsg) ) "
			+ " from MessaggioEntity mess "			 
			+ " where DATE(mess.dataPub) >= :dataIn "
			+ " GROUP BY DATE(mess.dataPub) ")			
	List<AggregateMsgPerDatPub> countMsgPerDataPubAfterDataInput(@Param("dataIn") Date dataIn);
	
}
