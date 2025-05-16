package org.whitepaper.mobile.dto;

import org.whitepaper.bean.Messaggio; // We'll use the existing Messaggio bean for now

public class PaperContentDto {
    private Messaggio mainMessage; // The primary message for this paper (could be null if paper is empty before random load)
    private PaperActionFlagsDto actionFlags;
    private int currentPaperId;
    private String paperTitle; // e.g., "Your Public Message", "Conversation", "Reading Public Message"
    // We might not need to send the full UserPapersSummaryDto again if fetched separately

    public PaperContentDto(int currentPaperId) {
        this.currentPaperId = currentPaperId;
        this.actionFlags = new PaperActionFlagsDto();
    }

    // Getters and Setters
    public Messaggio getMainMessage() { return mainMessage; }
    public void setMainMessage(Messaggio mainMessage) { this.mainMessage = mainMessage; }
    public PaperActionFlagsDto getActionFlags() { return actionFlags; }
    public void setActionFlags(PaperActionFlagsDto actionFlags) { this.actionFlags = actionFlags; }
    public int getCurrentPaperId() { return currentPaperId; }
    public void setCurrentPaperId(int currentPaperId) { this.currentPaperId = currentPaperId; }
    public String getPaperTitle() { return paperTitle; }
    public void setPaperTitle(String paperTitle) { this.paperTitle = paperTitle; }
}
