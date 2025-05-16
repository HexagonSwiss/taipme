package org.whitepaper.mobile.dto;

public class PaperActionFlagsDto {
    private boolean canWriteNewOnThisPaper;
    private boolean canReplyToMainMessage;
    private boolean canReadOtherRandomMessages; 
    private boolean canTearMainMessage;
    private boolean canReportMainMessage;

    public PaperActionFlagsDto() {}

    public boolean isCanWriteNewOnThisPaper() { return canWriteNewOnThisPaper; }
    public void setCanWriteNewOnThisPaper(boolean canWriteNewOnThisPaper) { this.canWriteNewOnThisPaper = canWriteNewOnThisPaper; }
    public boolean isCanReplyToMainMessage() { return canReplyToMainMessage; }
    public void setCanReplyToMainMessage(boolean canReplyToMainMessage) { this.canReplyToMainMessage = canReplyToMainMessage; }
    public boolean isCanReadOtherRandomMessages() { return canReadOtherRandomMessages; }
    public void setCanReadOtherRandomMessages(boolean canReadOtherRandomMessages) { this.canReadOtherRandomMessages = canReadOtherRandomMessages; }
    public boolean isCanTearMainMessage() { return canTearMainMessage; }
    public void setCanTearMainMessage(boolean canTearMainMessage) { this.canTearMainMessage = canTearMainMessage; }
    public boolean isCanReportMainMessage() { return canReportMainMessage; }
    public void setCanReportMainMessage(boolean canReportMainMessage) { this.canReportMainMessage = canReportMainMessage; }
}
