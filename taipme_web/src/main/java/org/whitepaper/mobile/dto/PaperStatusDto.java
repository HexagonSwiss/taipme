package org.whitepaper.mobile.dto; 

public class PaperStatusDto {
    private int paperId; // idFoglio
    private boolean hasReply; // presenteRisposta
    private boolean isMyTurnToReply; // sendReply (derived from CODMSG_LET)

    public PaperStatusDto(int paperId, boolean hasReply, boolean isMyTurnToReply) {
        this.paperId = paperId;
        this.hasReply = hasReply;
        this.isMyTurnToReply = isMyTurnToReply;
    }

    // Getters and Setters
    public int getPaperId() { return paperId; }
    public void setPaperId(int paperId) { this.paperId = paperId; }
    public boolean isHasReply() { return hasReply; }
    public void setHasReply(boolean hasReply) { this.hasReply = hasReply; }
    public boolean isMyTurnToReply() { return isMyTurnToReply; }
    public void setMyTurnToReply(boolean isMyTurnToReply) { this.isMyTurnToReply = isMyTurnToReply; }
}
