<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="logInOutLink" value="${sessionScope.cu_id == null ? '/login':'/logout'}" /> <%-- login 되어있으면 /logout 컨트롤러로 아니라면 /login 컨트롤러로 값이 바뀜 --%>
<c:set var="logInOutTxt" value="${sessionScope.cu_id == null ? '로그인':'로그아웃'}" /> <%-- login 되어있으면 "logout" 텍스트로 아니라면 logout 컨트롤러로 값이 바뀜 --%>
<c:set var="customerId" value="${sessionScope.cu_id == null ? '':sessionScope.cu_id}" />
<c:set var="customerNickname" value="${sessionScope.cu_name = null ? '':sessionScope.cu_name}" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>sell</title>

    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script defer src="<c:url value="/js/ham_btn.js"/>"></script>

    <link rel="stylesheet" href="<c:url value='/css/sell.css'/> ">
    <link rel="stylesheet" href="<c:url value='/css/h_f.css'/> ">
</head>

<body>
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
<div id="wrap">

    <form action="" id="frm" >

        <div class="pro_title_box">
            <div class="pro_title_title title">■ 상품명</div>
            <input type="text" class="pro_title" name="pro_title" placeholder="상품명">
        </div>

        <div class="pro_area_box">
            <div class="pro_area_title title">■ 거래 희망지역</div>
            <input type="text" class="pro_area" name="pro_area" placeholder="거래 희망지역을 입력하십시오.">
        </div>

        <div class="pro_category_title_outer">
            <div class="pro_category_title title">■ 카테고리</div>
            <div class="pro_category_box">
                <div class="left_border"></div>

                <input type="radio" id="category_clothing" name="Pro_category" value="의류" style="display:none;">
                <label for="category_clothing" class="pro_category" onclick="highlight(this)">의류</label>

                <input type="radio" id="category_cosmetics" name="Pro_category" value="화장품" style="display:none;">
                <label for="category_cosmetics" class="pro_category" onclick="highlight(this)">화장품</label>

                <input type="radio" id="category_electronics" name="Pro_category" value="전자기기" style="display:none;">
                <label for="category_electronics" class="pro_category" onclick="highlight(this)">전자기기</label>

                <input type="radio" id="category_books" name="Pro_category" value="도서" style="display:none;">
                <label for="category_books" class="pro_category" onclick="highlight(this)">도서</label>

                <input type="radio" id="category_sports" name="Pro_category" value="스포츠" style="display:none;">
                <label for="category_sports" class="pro_category" onclick="highlight(this)">스포츠</label>

                <input type="radio" id="category_vehicles" name="Pro_category" value="차량" style="display:none;">
                <label for="category_vehicles" class="pro_category" onclick="highlight(this)">차량</label>

                <input type="radio" id="category_free" name="Pro_category" value="무료나눔" style="display:none;">
                <label for="category_free" class="pro_category" onclick="highlight(this)">무료나눔</label>

                <div class="right_border"></div>
            </div>
        </div>

        <div class="pro_price_box">
            <div class="pro_price_title title">■ 판매가격</div>
            <input type="text" class="pro_price" name="pro_price" placeholder="₩ 판매가격 - 숫자만 입력하십시오.">
        </div>

        <div class="pro_info_box">
            <div class="pro_info_box_title title">■ 상품정보</div>
            <textarea class="pro_info" name="pro_info" placeholder="
  - 상품명(브랜드)
  - 모델명
  - 구매 시기
  - 사용 기간
  * 실제 촬영한 사진과 함께 상세 정보를 입력해주세요.
  * 카카오톡 아이디 첨부 시, 게시물 삭제 및 이용제재 처리될 수 있어요.

  안전하고 건전한 거래환경을 위해, 과학기술정보통신부, 한국인터넷진흥원, 중고나라가 함께합니다.
                "></textarea>
        </div>

        <div class="img_upload">
            <input type="file" id="file_input" name="f_file" multiple="multiple">
        </div>

        <div class="submit_btn_box">
            <input type="submit" class="submit_btn" value="등록">
        </div>

    </form>

</div>
<footer class="footer">
    <div class="footer_box">

        <div class="top_footer">
            <div class="footer_font"><h4>(주)USED 사업자 정보</h4> </div>
            <div class="footer_font2">(주)USED 대표자 : 김정우</div>

            <div class="footer_font2">사업자 등록번호 697-59-77755</div>
            <div class="footer_font2">주소 : 경기도 구리시 토평동 상록아파트 501동 1202호  </div>
            <div class="footer_font2">대표번호 : 010-2814-8746  </div>
            <div class="footer_font2">메일 : JUNGWOO@USED.COM  </div>
            <div class="footer_font2">호스팅제공자 : 서한결웹서비스  </div>

            <div class="footer_font3_box">
                <div class="footer_font3">
                    이용약관<div class="linebar"></div>
                </div>
                <div class="footer_font3">
                    개인정보처리방침<div class="linebar"></div>
                </div>
                <div class="footer_font3">
                    분쟁처리절차<div class="linebar"></div>
                </div>
                <div class="footer_font3">
                    청소년 보호정책<div class="linebar"></div>
                </div>
            </div>

            <div class="footer_font4_box">
                <div class="footer_font3">
                    사업자정보확인<div class="linebar"></div>
                </div>
                <div class="footer_font3">
                    USED 고객센터
                </div>
            </div>


            <div class="footer_font5_box">
                “USED” 상점의 판매상품을 제외한 모든 상품들에 대하여, (주)USED는 통신판매중개자로서 거래 당사자가 아니며 판매 회원과 구매 회원 간의 상품거래 정보 및 거래에 관여하지 않고, 어떠한 의무와 책임도 부담하지 않습니다.
            </div>
        </div>
    </div>

</footer>
    <script>

        // J쿼리 부분
        $(document).ready(function () {

            $('.submit_btn').on('click', function () {
                // 유효성 검사 - title, content 빈칸 체크
                if ($('.pro_title').val().trim() == "") {
                    alert("상품명을 입력하십시오.");
                    $('.pro_title').focus();
                    return false;
                } else if ($('.pro_area').val().trim() == "") {
                    alert("거래 희망지역을 입력하십시오.");
                    $('.pro_area').focus();
                    return false;
                } else if (!$('.pro_category').hasClass('category_selected')) {
                    alert("카테고리를 선택하십시오.");
                    return false;
                } else if ($('.pro_price').val().trim() == "") {
                    alert("판매가격을 입력하십시오.");
                    $('.pro_price').focus();
                    return false
                }  else if ($('.pro_info').val().trim() == "") {
                    alert("상품정보를 입력하십시오.");
                    $('.pro_info').focus();
                    return false
                }else if ($('#file_input').get(0).files.length === 0) {
                    alert("사진을 업로드하십시오.");
                    return false;
                } else {

                    let frm = $("#frm");
                    frm.attr("action", "<c:url value='/sell'/>")
                    frm.attr("method", "POST");
                    frm.attr('enctype','multipart/form-data');
                    if ($('.pro_category.category_selected').text().trim() === '무료나눔') {
                        $('.pro_price').val('0');
                    }
                    frm.submit();
                }
            });
        });

        // 선택된 버튼을 강조하는 함수
        function highlight(btn) {
            let buttons = document.querySelectorAll('.pro_category');
            buttons.forEach(function (button) {
                button.classList.remove('category_selected');
            });

            btn.classList.add('category_selected');

            let priceInput = document.querySelector('.pro_price');

            if (btn.textContent.trim() === '무료나눔') {
                priceInput.value = '무료나눔';
                priceInput.setAttribute('readonly', 'readonly');
            } else {
                priceInput.value = '';
                priceInput.removeAttribute('readonly');
            }

            $('.pro_price').focus(); // 가격 입력창으로 포커스
        }

        // Enter 키로 제출 방지
        let titleInputs = document.getElementsByClassName('pro_title');
        for (let i = 0; i < titleInputs.length; i++) {
            titleInputs[i].addEventListener('keydown', function (event) {
                if (event.keyCode === 13) {
                    event.preventDefault();
                    this.blur();
                    return false;
                }
            });
        }

        //pro_title에서 엔터를 누르면 pro_area가 포커스
        document.addEventListener('DOMContentLoaded', function () {
            let priceInput = document.querySelector('.pro_title');

            priceInput.addEventListener('keydown', function (event) {
                if (event.keyCode === 13) {
                    event.preventDefault();
                    $('.pro_area').focus();
                    return false;
                }
            });
        });

        //pro_area에서 엔터를 누르면 pro_price가 포커스
        document.addEventListener('DOMContentLoaded', function () {
            let priceInput = document.querySelector('.pro_area');

            priceInput.addEventListener('keydown', function (event) {
                if (event.keyCode === 13) {
                    event.preventDefault();
                    $('.pro_price').focus();
                    return false;
                }
            });
        });

        //pro_price에서 엔터를 누르면 pro_info가 포커스
        document.addEventListener('DOMContentLoaded', function () {
            let priceInput = document.querySelector('.pro_price');

            priceInput.addEventListener('keydown', function (event) {
                if (event.keyCode === 13) {
                    event.preventDefault();
                    $('.pro_info').focus();
                    return false;
                }
            });
        });

        // 숫자만 입력하도록 설정 및 10억 이상 입력 시 경고 알람
        $('.pro_price').on('input', function () {
            // 숫자 이외의 문자를 제거하고, 10억 이상이 입력되었는지 확인
            let price = this.value.replace(/[^0-9]/g, '');
            if (parseInt(price) >= 10000000000) {
                alert("판매가격은 10억 원을 초과할 수 없습니다.");
                this.value = ''; // 입력값 초기화
            } else {
                this.value = price;
            }
        });

    </script>

</body>
</html>