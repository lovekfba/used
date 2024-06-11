<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="logInOutLink" value="${sessionScope.cu_id == null ? '/login':'/logout'}" /> <%-- login 되어있으면 /logout 컨트롤러로 아니라면 /login 컨트롤러로 값이 바뀜 --%>
<c:set var="logInOutTxt" value="${sessionScope.cu_id == null ? '로그인':'로그아웃'}" /> <%-- login 되어있으면 "logout" 텍스트로 아니라면 logout 컨트롤러로 값이 바뀜 --%>
<c:set var="customerId" value="${sessionScope.cu_id == null ? '':sessionScope.cu_id}" />



<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원가입</title>
  <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
  <script defer src="<c:url value="/js/ham_btn.js"/>"></script>
  <link rel="stylesheet" href="<c:url value='/css/h_f.css' /> ">
  <link rel="stylesheet" href="<c:url value='/css/register.css' /> ">
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

    <div class="main">
      <div class="content_area main_content_area">
        <div class="main">

          <div class="mainbox">
            <div class="loginbox">회원가입</div>
            <div class="line"></div>
            <div class="login1">
              <form action="<c:url value='/register/save'/>" method="POST" id="frm" onsubmit="return checkform()">
                <input type="radio" name="rd" id="rd1" value="male" checked>
                <input type="radio" name="rd" id="rd2" value="female">
                <div class="form_box">
                  <div class="font2 font_area">아이디</div>
                  <input type="text" class="txt_f cu_id" name="cu_id" minlength="8" maxlength="12" placeholder="8~12 자리의 영대소문자와 숫자 조합" required>
                  <div class="warnningbox">${param.msg}</div>
                  <div class="font2">비밀번호</div>
                  <input type="password" class="txt_f cu_pw" name="cu_pw" inlength="8" maxlength="12"placeholder="8~12 자리의 영대소문자와 숫자" id="password1" required>
                  <div class="font2" id="pwbox">비밀번호 확인</div>
                  <input type="password" class="txt_f cu_pw_chk" placeholder="비밀번호 확인" id="password2"required>

                  <div class="font2">이름</div>
                  <input type="text" class="txt_f cu_name" name="cu_name" placeholder="이름을 입력해주세요" required>

                  <div class="font2" id="emailbox" >이메일</div>
                  <input type="text" class="txt_f cu_email" name="cu_email" id="cu_email" placeholder="이메일을 입력해주세요" required>
                  <div class="font2">생일</div>
                  <div class="birth">
                    <select class="year sel" name="year">
                    </select>
                    <div class="ymd"> &nbsp;년&nbsp; </div>

                    <select class="mon sel" name="month">
                    </select>
                    <div class="ymd"> &nbsp;월&nbsp; </div>

                    <select class="day sel" name="day">
                    </select>
                    <div class="ymd"> &nbsp;일&nbsp; </div>
                  </div>

                  <div class="font2">전화번호</div>
                  <input type="text" class="txt_f uid" name="unum" placeholder="010-1234-5678" required>
                  <div class="font2">성별</div>
                  <div class="btn_box">
                    <label for="rd1" class="label_left" name="male">남자</label>
                    <label for="rd2" class="label_right" name="female">여자</label>
                  </div>
                  <input type="submit" value="회원가입" class="btn_submit">
                </div>

              </form>
            </div>
          </div>

      </div>
    </div>

  </div>

    <div class="footer">

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
    </div>

  </div>
  <script>

    $(document).ready(function(){


      for(let i=0; i<=100; i++) {
        let year = `<option value="${'${2024 - i}'}">${'${2024 - i}'}</option>`;
        console.log(year)
        $('.year').append(year);

      }

      for(let i=1; i<= 12; i++) {
        let month = `<option value="${'${i}'}">${'${i}'}</option> `;
        console.log(month);
        console.log(i);
        $('.mon').append(month);
      }
      getDate()

      $(document).on('change', '.mon', function(){
        console.log("year:" + $('.year').val())
        console.log("mon:"+$('.mon').val())
        getDate()

      })
      function getDate() {
        $('.day').empty();


        let year = $('.year').val();
        let mon = $('.mon').val();

        let dt = new Date(year, mon, 0);
        let lastDate = dt.getDate(); // getDate가 해당 년월에서 마지막 일을 뽑아내는 메서드인듯.
        console.log("lastDate: " + lastDate)

        for(let i=1; i<=lastDate; i++) {
          let day = `<option value="${'${i}'}">&nbsp;&nbsp;${'${i}'}</option>`;
          console.log(day);
          console.log(i)
          $('.day').append(day);
        }
      }


    })
    let check1 = false
    let check2 = false
    document.getElementById('password2').addEventListener(`change`,function(){
      let pw1 = document.getElementById('password1').value;
      let pw2 = document.getElementById('password2').value;
      if (pw1 === pw2){
        check1 = true
        document.getElementById(`password2`).style.setProperty(`border-color`,`green`)
        document.getElementById(`pwbox`).style.setProperty(`color`,`green`)
        return check1
      }
      else{
        document.getElementById(`password2`).style.setProperty(`border-color`,`red`)
        document.getElementById(`pwbox`).style.setProperty(`color`,`red`)
        check1 = false
        return check1
      }
    })







    document.getElementById('cu_email').addEventListener(`change`,function(){
      var input =document.getElementById('cu_email').value
      const pattern = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

      if(pattern.test(input)==false){
        console.log(`1`)
        document.getElementById(`cu_email`).style.setProperty(`border-color`,`red`)
        document.getElementById(`emailbox`).style.setProperty(`color`,`red`)
      }
      else{
        console.log("5")
        check2 = true
        document.getElementById(`cu_email`).style.setProperty(`border-color`,`green`)
        document.getElementById(`emailbox`).style.setProperty(`color`,`green`)
        return check2
      }
    })













    function checkform(){
      if(check1 == false){
        alert('비밀번호를 확인 해주세요 ')
        return false
      }
      else if(check2 == false){
        alert('이메일을 다시 입력해주세요 ')
        return false
      }
      return true
    }











    <%--function formCheck(frm) {--%>
    <%--  var msg = '';--%>

    <%--  if (frm.id.value.length < 3) {--%>
    <%--    setMessage('id의 길이는 3이상이어야 합니다.', frm.id);--%>
    <%--    return false;--%>
    <%--  }--%>
    <%--  //if (frm.pp.value.length < 3) {--%>
    <%--  if (frm.pw.value.length < 3) {--%>
    <%--    setMessage('pw의 길이는 3이상이어야 합니다.', frm.pw);--%>
    <%--    return false;--%>
    <%--  }--%>

    <%--  return true;--%>
    <%--}--%>

    <%--function setMessage(msg, element) {--%>
    <%--  document.getElementById("msg").innerHTML = `<b class="fa"> ${'${msg}'} </b>`;--%>

    <%--  if (element) {--%>
    <%--    // 해당 요소로 focus--%>
    <%--    element.select();--%>
    <%--  }--%>
    <%--}--%>
    </script>
  </body>
</html>