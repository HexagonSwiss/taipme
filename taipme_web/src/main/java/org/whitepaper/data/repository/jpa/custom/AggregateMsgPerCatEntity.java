package org.whitepaper.data.repository.jpa.custom;

public class AggregateMsgPerCatEntity {

	private String codCat;
	private String desCat;
	private String colCat;
	private Long  numMsg;
	
	public AggregateMsgPerCatEntity(String codCat, String desCat, String colCat, Long  numMsg) {
		this.codCat = codCat;
		this.desCat = desCat;
		this.colCat = colCat;
		this.numMsg = numMsg;
	}

	public String getCodCat() {
		return codCat;
	}

	public void setCodCat(String codCat) {
		this.codCat = codCat;
	}

	public String getDesCat() {
		return desCat;
	}

	public void setDesCat(String desCat) {
		this.desCat = desCat;
	}

	public Long  getNumMsg() {
		return numMsg;
	}

	public void setNumMsg(Long  numMsg) {
		this.numMsg = numMsg;
	}

	public String getColCat() {
		return colCat;
	}

	public void setColCat(String colCat) {
		this.colCat = colCat;
	}

	
	

}