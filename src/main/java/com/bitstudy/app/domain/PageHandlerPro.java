package com.bitstudy.app.domain;

/** 게시판 리스트 하단에 배치할 페이징 기능
 * */
public class PageHandlerPro {


//    private int page=1;
//    private int pageSize=10; // 한페이지 게시물: 10 개씩
//    private String keyword="";
//    private String  option="";
//    private Integer offset=0;

    private int Fk_pro_seqno;
    private int page; // 현재 페이지
    private int pageSize; // 한페이지 게시물: 10 개씩

    private int totalCount; // 전체 게시물: 221

    private int totalPage;// 전체 페이지수: 23페이지
    private int navPage = 10;// 페이지 nav: 10씩 표시하기
    private int startPage; // 네비게이션 첫번째 페이지
    private int endPage; // 네비게이션 마지막 페이지 

    private boolean showPrevBtn; // [이전] 버튼 보여지는 여부 결정
    private boolean showNextBtn; // [다음] 버튼 보여지는 여부 결정

    public PageHandlerPro() { }

    // 페이징 계산하는데 사용되는 메서드
    public PageHandlerPro(int totalCount, int page, int pageSize) {
        this.totalCount = totalCount; // 전체 게시글 수: 221
        this.page = page; // 현재 페이지
        this.pageSize = pageSize; // 한페이지당 10개씩

        // 전체 페이지 수 = 전제 게시물 / 한페이지 게시물 개수
        totalPage = (int) Math.ceil(totalCount / (double)pageSize);

        /*  네비게이션의 첫번째 페이지 구하기
               한번에 10개 nav를 보여준다고 쳤을때 내가 1페이지던 5페이지던 10페이지던 언제나 startPage는 1 이어야함

            - 시작 페이지 찾는법(공식 외울것) -
                (현재 페이지 - 1) / 15 * 15 + 1;
                (page - 1) / navPage * navPage + 1

                 1  2  3  4  5  6  7  8  9 10 11 12 13 14 15
                16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
                31 32 33 34 35 36 37 38 39 40 41 42 43 44 45
                46 47 48
                ---------------------------------------------
                (현재 페이지 - 1) / 10 * 10 + 1;
                 1  2  3  4  5  6  7  8  9 10
                11 12 13 14 15 16 17 18 19 20
                21 22 23 24 25 26 27 28 29 30
                31 32 33 34 35 36 37 38 39 40
                41 42 43 44 45 46 47 48
        */
        startPage = (page - 1) / navPage * navPage + 1;
//        endPage = startPage + navPage - 1;
//        if(endPage > totalPage) {
//            endPage = totalPage;
//        }

        endPage = Math.min((startPage+navPage-1), totalPage);

        showPrevBtn = startPage != 1;
        showNextBtn = endPage != totalPage;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
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

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
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


    public void print() {
//        if(showPrevBtn) {
//            System.out.print("[이전]");
//        }
        System.out.print(showPrevBtn?"[이전]":"");

        for(int i=startPage; i<=endPage; i++) {
            System.out.print(" " + i + " ");
        }

//        if(showNextBtn) {
//            System.out.print("[다음]");
//        }
        System.out.print(showNextBtn?"[다음]":"");
    }


    @Override
    public String toString() {
        return "Ex06_PageHandler{" +
                "totalCount=" + totalCount +
                ", pageSize=" + pageSize +
                ", totalPage=" + totalPage +
                ", navPage=" + navPage +
                ", startPage=" + startPage +
                ", endPage=" + endPage +
                ", page=" + page +
                ", showPrevBtn=" + showPrevBtn +
                ", showNextBtn=" + showNextBtn +
                '}';
    }
}

