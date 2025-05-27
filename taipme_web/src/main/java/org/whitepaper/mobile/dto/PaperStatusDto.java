package org.whitepaper.mobile.dto; 

import com.fasterxml.jackson.annotation.JsonProperty; 

public class PaperStatusDto {
    private int paperId;
    private boolean hasReply; 
    private boolean isMyTurnToReply; 
    private boolean isUserAuthoredSlot; 

    public PaperStatusDto(int paperId, boolean hasReply, boolean isMyTurnToReply, boolean isUserAuthoredSlot) {
        this.paperId = paperId;
        this.hasReply = hasReply;
        this.isMyTurnToReply = isMyTurnToReply;
        this.isUserAuthoredSlot = isUserAuthoredSlot;
    }

    // Getters and Setters
    public int getPaperId() { return paperId; }
    public void setPaperId(int paperId) { this.paperId = paperId; }

    @JsonProperty("hasReply") 
    public boolean isHasReply() { return hasReply; } 
    public void setHasReply(boolean hasReply) { this.hasReply = hasReply; }

    @JsonProperty("myTurnToReply") 
    public boolean isMyTurnToReply() { return isMyTurnToReply; } 
    public void setMyTurnToReply(boolean isMyTurnToReply) { this.isMyTurnToReply = isMyTurnToReply; }

    @JsonProperty("isUserAuthoredSlot") 
    public boolean isUserAuthoredSlot() { return isUserAuthoredSlot; }
    public void setUserAuthoredSlot(boolean userAuthoredSlot) { isUserAuthoredSlot = userAuthoredSlot; }
}
