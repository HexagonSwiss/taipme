package org.whitepaper.data.repository.jpa.custom;

import java.util.Date;

import org.whitepaper.utility.UtilityFunction;

public class AggregateMsgPerDatPub {

	private Date datPub;
	private Long  numMsg;
	private String dataPubView;
	
	//nel caso UTEATT contiene il numero di utenti registrati
	private String desNotMsg;
	
	public AggregateMsgPerDatPub(Date datPub, Long  numMsg) {
		this.datPub = datPub;
		this.numMsg = numMsg;
	}

	public Date getDatPub() {
		return datPub;
	}

	public void setDatPub(Date datPub) {
		this.datPub = datPub;
	}

	public Long	 getNumMsg() {
		return numMsg;
	}

	public void setNumMsg(Long numMsg) {
		this.numMsg = numMsg;
	}

	public String getDataPubView() {
		
		if ( null==this.datPub )
			return null;
		
		this.dataPubView = UtilityFunction.getDataViewNoOra(this.datPub);	
		return dataPubView;
	}

	public void setDataPubView(String dataPubView) {
		this.dataPubView = dataPubView;
	}

	public String getDesNotMsg() {
		return desNotMsg;
	}

	public void setDesNotMsg(String desNotMsg) {
		this.desNotMsg = desNotMsg;
	}

	
	
	

}