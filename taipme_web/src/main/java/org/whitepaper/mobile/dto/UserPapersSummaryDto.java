package org.whitepaper.mobile.dto;

import java.util.List;

public class UserPapersSummaryDto {
    private List<PaperStatusDto> papers;
    private int maxPapersAllowed;
    private boolean canAddNewPaper; 

    public UserPapersSummaryDto(List<PaperStatusDto> papers, int maxPapersAllowed, boolean canAddNewPaper) {
        this.papers = papers;
        this.maxPapersAllowed = maxPapersAllowed;
        this.canAddNewPaper = canAddNewPaper;
    }

    public List<PaperStatusDto> getPapers() { return papers; }
    public void setPapers(List<PaperStatusDto> papers) { this.papers = papers; }
    public int getMaxPapersAllowed() { return maxPapersAllowed; }
    public void setMaxPapersAllowed(int maxPapersAllowed) { this.maxPapersAllowed = maxPapersAllowed; }
    public boolean isCanAddNewPaper() { return canAddNewPaper; }
    public void setCanAddNewPaper(boolean canAddNewPaper) { this.canAddNewPaper = canAddNewPaper; }
}
