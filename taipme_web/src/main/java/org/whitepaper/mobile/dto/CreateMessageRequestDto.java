package org.whitepaper.mobile.dto;

public class CreateMessageRequestDto {
    private String desMsg; 
    private String titMsg; 

    public CreateMessageRequestDto() {}

    public String getDesMsg() {
        return desMsg;
    }

    public void setDesMsg(String desMsg) {
        this.desMsg = desMsg;
    }

    public String getTitMsg() {
        return titMsg;
    }

    public void setTitMsg(String titMsg) {
        this.titMsg = titMsg;
    }
}

