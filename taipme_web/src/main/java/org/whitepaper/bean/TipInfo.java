/*
 * Created on 2023-12-11 ( Time 14:17:41 )
 * Generated by Telosys Tools Generator ( version 3.1.2 )
 */
package org.whitepaper.bean;

import java.io.Serializable;

import javax.validation.constraints.*;


public class TipInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    //----------------------------------------------------------------------
    // ENTITY PRIMARY KEY ( BASED ON A SINGLE FIELD )
    //----------------------------------------------------------------------
    @NotNull
    private Integer id;

    //----------------------------------------------------------------------
    // ENTITY DATA FIELDS 
    //----------------------------------------------------------------------    
    @NotNull
    @Size( min = 1, max = 10 )
    private String codInfo;

    @Size( max = 500 )
    private String desInfo;



    //----------------------------------------------------------------------
    // GETTER & SETTER FOR THE KEY FIELD
    //----------------------------------------------------------------------
    public void setId( Integer id ) {
        this.id = id ;
    }

    public Integer getId() {
        return this.id;
    }


    //----------------------------------------------------------------------
    // GETTERS & SETTERS FOR FIELDS
    //----------------------------------------------------------------------
    public void setCodInfo( String codInfo ) {
        this.codInfo = codInfo;
    }
    public String getCodInfo() {
        return this.codInfo;
    }

    public void setDesInfo( String desInfo ) {
        this.desInfo = desInfo;
    }
    public String getDesInfo() {
        return this.desInfo;
    }


    //----------------------------------------------------------------------
    // toString METHOD
    //----------------------------------------------------------------------
 
        public String toString() { 
        StringBuffer sb = new StringBuffer(); 
        sb.append(id);
        sb.append("|");
        sb.append(codInfo);
        sb.append("|");
        sb.append(desInfo);
        return sb.toString(); 
    } 


}
