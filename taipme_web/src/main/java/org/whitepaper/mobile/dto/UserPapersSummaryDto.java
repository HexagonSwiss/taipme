package org.whitepaper.mobile.dto;

import java.util.List;

public class UserPapersSummaryDto {
    private List<PaperStatusDto> papers;
    private boolean canAddNewPaper; 

    public UserPapersSummaryDto(List<PaperStatusDto> papers, boolean canAddNewPaper) {
        this.papers = papers;
        this.canAddNewPaper = canAddNewPaper;
    }

    public List<PaperStatusDto> getPapers() { return papers; }
    public void setPapers(List<PaperStatusDto> papers) { this.papers = papers; }
    public boolean isCanAddNewPaper() { return canAddNewPaper; }
    public void setCanAddNewPaper(boolean canAddNewPaper) { this.canAddNewPaper = canAddNewPaper; }
}
