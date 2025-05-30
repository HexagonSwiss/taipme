/*
 * Created on 19 gen 2023 ( Time 08:35:27 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
// This Bean has a basic Primary Key (not composite) 

package org.whitepaper.bean.jpa;

import java.io.Serializable;

//import javax.validation.constraints.* ;
//import org.hibernate.validator.constraints.* ;

import java.util.Date;

import javax.persistence.*;

/**
 * Persistent class for entity stored in table "messaggio_segnalato"
 *
 * @author Telosys Tools Generator
 *
 */

@Entity
@Table(name="messaggio_segnalato", catalog="fogliobianco" )
// Define named queries here
@NamedQueries ( {
  @NamedQuery ( name="MessaggioSegnalatoEntity.countAll", query="SELECT COUNT(x) FROM MessaggioSegnalatoEntity x" )
} )
public class MessaggioSegnalatoEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    //----------------------------------------------------------------------
    // ENTITY PRIMARY KEY ( BASED ON A SINGLE FIELD )
    //----------------------------------------------------------------------
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="id_msg_segn", nullable=false)
    private Integer    idMsgSegn    ;


    //----------------------------------------------------------------------
    // ENTITY DATA FIELDS 
    //----------------------------------------------------------------------    
    @Column(name="des_mot", length=250)
    private String     desMot       ;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="dat_segn", nullable=false)
    private Date       datSegn      ;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="dat_ult_mov", nullable=false)
    private Date       datUltMov    ;

	// "idMsg" (column "id_msg") is not defined by itself because used as FK in a link 
	// "idUteSegn" (column "id_ute_segn") is not defined by itself because used as FK in a link 


    //----------------------------------------------------------------------
    // ENTITY LINKS ( RELATIONSHIP )
    //----------------------------------------------------------------------
    @ManyToOne
    @JoinColumn(name="id_msg", referencedColumnName="id_msg")
    private MessaggioEntity messaggio   ;

    @ManyToOne
    @JoinColumn(name="id_ute_segn", referencedColumnName="ID_UTE")
    private AnaUtenteEntity anaUtente   ;


    //----------------------------------------------------------------------
    // CONSTRUCTOR(S)
    //----------------------------------------------------------------------
    public MessaggioSegnalatoEntity() {
		super();
    }
    
    //----------------------------------------------------------------------
    // GETTER & SETTER FOR THE KEY FIELD
    //----------------------------------------------------------------------
    public void setIdMsgSegn( Integer idMsgSegn ) {
        this.idMsgSegn = idMsgSegn ;
    }
    public Integer getIdMsgSegn() {
        return this.idMsgSegn;
    }

    //----------------------------------------------------------------------
    // GETTERS & SETTERS FOR FIELDS
    //----------------------------------------------------------------------
    //--- DATABASE MAPPING : des_mot ( VARCHAR ) 
    public void setDesMot( String desMot ) {
        this.desMot = desMot;
    }
    public String getDesMot() {
        return this.desMot;
    }

    //--- DATABASE MAPPING : dat_segn ( DATETIME ) 
    public void setDatSegn( Date datSegn ) {
        this.datSegn = datSegn;
    }
    public Date getDatSegn() {
        return this.datSegn;
    }

    //--- DATABASE MAPPING : dat_ult_mov ( DATETIME ) 
    public void setDatUltMov( Date datUltMov ) {
        this.datUltMov = datUltMov;
    }
    public Date getDatUltMov() {
        return this.datUltMov;
    }


    //----------------------------------------------------------------------
    // GETTERS & SETTERS FOR LINKS
    //----------------------------------------------------------------------
    public void setMessaggio( MessaggioEntity messaggio ) {
        this.messaggio = messaggio;
    }
    public MessaggioEntity getMessaggio() {
        return this.messaggio;
    }

    public void setAnaUtente( AnaUtenteEntity anaUtente ) {
        this.anaUtente = anaUtente;
    }
    public AnaUtenteEntity getAnaUtente() {
        return this.anaUtente;
    }


    //----------------------------------------------------------------------
    // toString METHOD
    //----------------------------------------------------------------------
    public String toString() { 
        StringBuffer sb = new StringBuffer(); 
        sb.append("["); 
        sb.append(idMsgSegn);
        sb.append("]:"); 
        sb.append(desMot);
        sb.append("|");
        sb.append(datSegn);
        sb.append("|");
        sb.append(datUltMov);
        return sb.toString(); 
    } 

}
