<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="frm" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="logInOutLink" value="${sessionScope.cu_id == null ? '/login':'/logout'}" /> <%-- login 되어있으면 /logout 컨트롤러로 아니라면 /login 컨트롤러로 값이 바뀜 --%>
<c:set var="logInOutTxt" value="${sessionScope.cu_id == null ? '로그인':'로그아웃'}" /> <%-- login 되어있으면 "logout" 텍스트로 아니라면 logout 컨트롤러로 값이 바뀜 --%>
<c:set var="customerId" value="${sessionScope.cu_id == null ? '':sessionScope.cu_id}" />
<c:set var="customerNickname" value="${sessionScope.cu_name = null ? '':sessionScope.cu_name}" />


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>error</title>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <link rel="stylesheet" href="<c:url value="/css/h_f.css" />"/>

    <style>
        .ttt {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
    </style>
</head>
<body>
<div id="wrap">
    <!-- header -->
    <div class="header">
        <div class="top_banner">
            <img src="<c:url value='/img/top_banner.webp'/>" alt="중고나라">
        </div>
        <div class="content_area">
            <div class="h_top">


                <!-- 로고 -->

                <div class="logo logo_1">
                    <a href="<c:url value="/" />" > <!-- <c:url value="/" /> -->
                        USED
                    </a>
                </div>


                <!-- 검색바 -->
                <form action="<c:url value="/search"/>" method="get" class="form_search">

                    <input type="hidden" name="pro_category">

                    <div class="search_box">
                        <div class="search_icon_box">
                            <img src="<c:url value='/img/search_icon.png'/>" alt="중고나라">
                        </div>
                        <input type="text" name="keyword" id="search" placeholder="어떤 상품을 찾으시나요?" autocomplete="off">
                    </div>
                </form>

                <!-- 헤더의 아이콘들 -->
                <div class="header_icon_box">
                    <!-- 총합본에는 href="/sell"로 되어있네? 왜지? -->
                    <a href="<c:url value="/sell"/>" class="sale_icon_box h_icon">
                        <button class="sale_icon_button icon_bt">
                            <svg id="판매하기" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M13.6859 20.6926H4.92323C3.88605 20.6926 3.08773 19.8241 3.20716 18.8409L4.49579 8.32142C4.5775 7.63983 5.18096 7.12109 5.89756 7.12109H15.8168C16.5334 7.12109 17.1369 7.6338 17.2186 8.32142L17.91 14.0701" stroke="currentColor" stroke-width="1.5"></path><path d="M8.35938 9.35156V9.5868C8.35938 10.7751 9.47828 11.7462 10.8486 11.7462C12.219 11.7462 13.3379 10.7751 13.3379 9.5868V9.35156" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path><path d="M7.35938 7.72983V6.25112C7.35938 4.34555 8.90414 2.80078 10.8097 2.80078V2.80078C12.7153 2.80078 14.26 4.34555 14.26 6.25112V7.72983" stroke="currentColor" stroke-width="1.5"></path><path d="M17.1179 22.4245C19.3694 22.4245 21.1968 20.5969 21.1968 18.347C21.1968 16.0972 19.3694 14.2695 17.1179 14.2695C14.8665 14.2695 13.0391 16.0972 13.0391 18.347C13.0391 20.5969 14.8665 22.4245 17.1179 22.4245Z" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path><path d="M17.1406 19.9298V16.7461" stroke="currentColor" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"></path><path d="M15.5312 18.3439H18.7149" stroke="currentColor" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"></path></svg>
                        </button>
                        <b>판매하기</b>
                    </a>

                    <a href="<c:url value='${logInOutLink}'/>" methods="POST" class="login_icon_box h_icon">
                        <button class="login_icon_button icon_bt">
                            <%--                <div class="login_icon"></div>--%>
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" size="24"><path stroke="#141313" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M16.775 7.716a3.619 3.619 0 1 1-7.238.005 3.619 3.619 0 0 1 7.238-.005M13.15 13.371c-4.026 0-7.298 3.184-7.4 7.145h14.8c-.102-3.961-3.374-7.145-7.4-7.145"></path></svg>
                        </button>
                        <b class="">${logInOutTxt}</b>
                    </a>

                    <%--            <a href="<c:url value="/mypage"/>" class="mypage_icon_box h_icon"> <!-- <c:url value="??" /> -->--%>
                    <%--              <button class="mypage_icon_button icon_bt">--%>
                    <%--                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" size="24"><path stroke="#141313" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M16.775 7.716a3.619 3.619 0 1 1-7.238.005 3.619 3.619 0 0 1 7.238-.005M13.15 13.371c-4.026 0-7.298 3.184-7.4 7.145h14.8c-.102-3.961-3.374-7.145-7.4-7.145"></path></svg>--%>
                    <%--              </button>--%>
                    <%--              <b>마이페이지</b>--%>
                    <%--            </a>--%>


                    <c:choose>
                        <c:when test="${empty customerId}">
                            <a href="<c:url value='/register/join' />" class="signUp_icon_box h_icon">
                                <button class="signUp_icon_button icon_bt">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" size="24"><path stroke="#141313" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M16.775 7.716a3.619 3.619 0 1 1-7.238.005 3.619 3.619 0 0 1 7.238-.005M13.15 13.371c-4.026 0-7.298 3.184-7.4 7.145h14.8c-.102-3.961-3.374-7.145-7.4-7.145"></path></svg>
                                </button>
                                <b>회원가입</b>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <div class="nickname_box">
                                <b class="nickname">${customerNickname}님 환영합니다.</b>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>


                <%--          이건 뭐지? --%>
                <div class="btn_ham">
                    <div class="btn_line"></div>
                    <div class="btn_line"></div>
                    <div class="btn_line"></div>
                </div>

            </div>

            <div class="h_bot">
                <a href="<c:url value='/category?pro_category=${"의류"}' />" class="nav_txt">의류</a>
                <a href="<c:url value='/category?pro_category=${"화장품"}' />" class="nav_txt">화장품</a>
                <a href="<c:url value='/category?pro_category=${"전자기기"}' />" class="nav_txt">전자기기</a>
                <a href="<c:url value='/category?pro_category=${"도서"}' />" class="nav_txt">도서</a>
                <a href="<c:url value='/category?pro_category=${"스포츠"}' />" class="nav_txt">스포츠</a>
                <a href="<c:url value='/category?pro_category=${"차량"}' />" class="nav_txt">차량</a>
                <a href="<c:url value='/category?pro_category=${"무료나눔"}' />" class="nav_txt">무료나눔</a>
            </div>
        </div>

        <div class="draw_per"></div>
        <%--    ham 버튼에 부속 글귀들은 고민좀 해봐야할듯--%>
        <div class="ham_pan">
            <div class="searchbar_box">
                <div class="serch_txt">USED</div>
                <!-- <input class="search_box" type="text" placeholder="검색할 정보를 입력해주세요" >
                <div class="search">search</div> -->
                <div class="ham_close"></div>
            </div>



            <div class="ham_box ham1">
                <a href="<c:url value='/category?pro_category=${"의류"}' />">
                    <div class="ham_txt">의류</div>
                </a>
            </div>

            <div class="ham_box">
                <a href="<c:url value='/category?pro_category=${"화장품"}' />">
                    <div class="ham_txt">화장품</div>
                </a>
            </div>

            <div class="ham_box">
                <a href="<c:url value='/category?pro_category=${"전자기기"}' />">
                    <div class="ham_txt">전자기기</div>
                </a>
            </div>

            <div class="ham_box">
                <a href="<c:url value='/category?pro_category=${"도서"}' />">
                    <div class="ham_txt">도서</div>
                </a>
            </div>

            <div class="ham_box">
                <a href="<c:url value='/category?pro_category=${"스포츠"}' />">
                    <div class="ham_txt">스포츠</div>
                </a>
            </div>

            <div class="ham_box">
                <a href="<c:url value='/category?pro_category=${"차량"}' />">
                    <div class="ham_txt">차량</div>
                </a>
            </div>

            <div class="ham_box">
                <a href="<c:url value='/category?pro_category=${"무료나눔"}' />">
                    <div class="ham_txt">무료나눔</div>
                </a>
            </div>


            <div class="ham_box">
                <a href="<c:url value="/sell"/>" methods="get">
                    <div class="ham_txt">판매하기</div>
                </a>
            </div>

            <div class="ham_box">
                <a href="<c:url value="/login"/>" methods="get">
                    <div class="ham_txt">로그인</div>
                </a>
            </div>

            <%--      <div class="ham_box">--%>
            <%--        <a href="<c:url value="/category?pro_category="/>">--%>
            <%--          <div class="ham_txt">마이 페이지</div>--%>
            <%--        </a>--%>
            <%--      </div>--%>

            <div class="ham_box">
                <a href="<c:url value="/register/join"/>" methods="get">
                    <div class="ham_txt">회원가입</div>
                </a>
            </div>
        </div>

    </div> <!-- haeder -->

    <h1 class="ttt">해당하는 상품이 없습니다.</h1>


</div>
<script>

</script>
</body>
</html>
