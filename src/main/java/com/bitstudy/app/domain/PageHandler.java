package com.bitstudy.app.domain;

public class PageHandler {

    private int page; // 현재 페이지
    private int pageSize; // 한페이지 게시물: 10개씩
    private int totalCount; // 전체 게시물: 221
    private int totalPage; // 전체 페이지수
    private int navPage = 10; // 페이지 nav: 10개씩 강제잡기
    private int startPage; // 혀네비게이션 첫번째 페이지
    private int endPage; // 네비게이션 마지막 페이지

    private boolean showPrevBtn; // [이전] 버튼 보여지는 여부 결정
    private boolean showNextBtn; // [다음] 버튼 보여지는 여부 결정


    public PageHandler() {}

    public PageHandler(int page, int pageSize, int totalCount) {
        this.page = page;
        this.pageSize = pageSize;
        this.totalCount = totalCount;

        // 전체 페이지수
        totalPage = (int) Math.ceil(totalCount / (double)pageSize);

        startPage = (page - 1) / navPage * navPage + 1;
        endPage = Math.min(startPage + navPage -1, totalPage);

        showPrevBtn = startPage != 1;
        showNextBtn = endPage != totalPage;
    }




    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getNavPage() {
        return navPage;
    }

    public void setNavPage(int navPage) {
        this.navPage = navPage;
    }

    public int getStartPage() {
        return startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public boolean isShowPrevBtn() {
        return showPrevBtn;
    }

    public void setShowPrevBtn(boolean showPrevBtn) {
        this.showPrevBtn = showPrevBtn;
    }

    public boolean isShowNextBtn() {
        return showNextBtn;
    }

    public void setShowNextBtn(boolean showNextBtn) {
        this.showNextBtn = showNextBtn;
    }



    @Override
    public String toString() {
        return "PageHandler{" +
                "page=" + page +
                ", pageSize=" + pageSize +
                ", totalCount=" + totalCount +
                ", totalPage=" + totalPage +
                ", navPage=" + navPage +
                ", startPage=" + startPage +
                ", endPage=" + endPage +
                ", showPrevBtn=" + showPrevBtn +
                ", showNextBtn=" + showNextBtn +
                '}';
    }
}
