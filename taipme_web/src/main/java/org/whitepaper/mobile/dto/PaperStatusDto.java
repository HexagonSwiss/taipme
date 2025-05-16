package org.whitepaper.mobile.dto; 

import com.fasterxml.jackson.annotation.JsonProperty; // Import this

public class PaperStatusDto {
    private int paperId;
    private boolean hasReply; 
    private boolean isMyTurnToReply; 

    public PaperStatusDto(int paperId, boolean hasReply, boolean isMyTurnToReply) {
        this.paperId = paperId;
        this.hasReply = hasReply;
        this.isMyTurnToReply = isMyTurnToReply;
    }

    // Getters and Setters
    public int getPaperId() { return paperId; }
    public void setPaperId(int paperId) { this.paperId = paperId; }

    @JsonProperty("hasReply") // Ensures this field is serialized as "hasReply"
    public boolean isHasReply() { return hasReply; } 
    public void setHasReply(boolean hasReply) { this.hasReply = hasReply; }

    @JsonProperty("myTurnToReply") // Ensures this field is serialized as "myTurnToReply"
    public boolean isMyTurnToReply() { return isMyTurnToReply; } 
    public void setMyTurnToReply(boolean isMyTurnToReply) { this.isMyTurnToReply = isMyTurnToReply; }
}
