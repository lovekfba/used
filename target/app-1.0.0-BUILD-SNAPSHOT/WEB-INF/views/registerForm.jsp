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
  <link rel="stylesheet" href="<c:url value='/css/h_f.css' /> ">
  <link rel="stylesheet" href="<c:url value='/css/register.css' /> ">
</head>
<body>
  <div id="wrap">
    <div class="header">
      <div class="top_banner">
        <img src="<c:url value='/img/top_banner.webp' /> " alt="중고나라">
      </div>
      <div class="content_area">
        <div class="h_top">

          <!-- 로고 -->
          <div class="logo">
            <a href="<c:url value="/" />" >
              <svg width="200" height="30" viewBox="0 0 735 120" fill="none" xmlns="http://www.w3.org/2000/svg">
                <g clip-path="url(#clip0_43_4)">
                <path d="M156.089 29.1153C138.066 29.1153 124.388 43.5282 124.388 61.5442C124.388 79.5603 138.066 94.3593 156.089 94.3593C174.111 94.3593 188.722 79.7534 188.722 61.7373C188.722 43.7212 174.111 29.1153 156.089 29.1153ZM156.089 79.3351C146.369 79.3351 138.484 71.4531 138.484 61.7373C138.484 52.0215 146.369 44.1394 156.089 44.1394C165.808 44.1394 173.693 52.0215 173.693 61.7373C173.693 71.4531 165.808 79.3351 156.089 79.3351Z" fill="black"/>
                <path d="M650.036 37.7051V29.9839H635.007V93.5228H650.069V61.126C650.069 55.3673 651.485 42.4343 666.096 43.303V29.1153C659.112 29.63 653.931 32.5577 650.036 37.7373V37.7051Z" fill="black"/>
                <path d="M446.51 29.1153C428.487 29.1153 413.876 43.7212 413.876 61.7373C413.876 79.7534 428.487 94.3593 446.51 94.3593C464.532 94.3593 479.144 79.7534 479.144 61.7373C479.144 43.7212 464.532 29.1153 446.51 29.1153ZM446.51 79.2386C436.855 79.2386 429.002 71.3888 429.002 61.7373C429.002 52.0858 436.855 44.2359 446.51 44.2359C456.165 44.2359 464.017 52.0858 464.017 61.7373C464.017 71.3888 456.165 79.2386 446.51 79.2386Z" fill="black"/>
                <path d="M622.874 29.9839H607.78V35.7105C602.727 31.4638 596.838 29.1475 589.049 29.1475C571.027 29.1475 556.094 43.7534 556.094 61.7694C556.094 79.7855 570.898 94.3914 588.92 94.3914C598.543 94.3914 604.787 90.1126 607.812 86.1233V93.555H622.874V30.0161V29.9839ZM589.5 79.9142C579.394 79.9142 571.187 71.7105 571.187 61.6086C571.187 51.5067 579.394 43.303 589.5 43.303C599.605 43.303 607.812 51.5067 607.812 61.6086C607.812 71.7105 599.605 79.9142 589.5 79.9142Z" fill="black"/>
                <path d="M735 29.9839H719.906V35.7105C714.853 31.4638 708.964 29.1475 701.175 29.1475C683.153 29.1475 668.22 43.7534 668.22 61.7694C668.22 79.7855 683.024 94.3914 701.047 94.3914C710.67 94.3914 716.913 90.1126 719.938 86.1233V93.555H735V30.0161V29.9839ZM701.626 79.9142C691.52 79.9142 683.314 71.7105 683.314 61.6086C683.314 51.5067 691.52 43.303 701.626 43.303C711.732 43.303 719.938 51.5067 719.938 61.6086C719.938 71.7105 711.732 79.9142 701.626 79.9142Z" fill="black"/>
                <path d="M85.1246 29.1153C67.102 29.1153 52.4908 43.7212 52.4908 61.7373C52.4908 79.7534 67.102 94.3593 85.1246 94.3593C103.147 94.3593 117.758 79.7534 117.758 61.7373C117.758 43.7212 103.147 29.1153 85.1246 29.1153ZM85.1246 79.3351C75.4053 79.3351 67.5204 71.4531 67.5204 61.7373C67.5204 52.0215 75.4053 44.1394 85.1246 44.1394C94.8439 44.1394 102.729 52.0215 102.729 61.7373C102.729 71.4531 94.8439 79.3351 85.1246 79.3351Z" fill="black"/>
                <path d="M241.31 93.5228V57.5872C241.31 51.9571 238.671 43.9786 228.951 43.3995C214.404 42.563 212.988 55.4317 212.988 61.1582V93.5228H197.927V29.9839H212.956V37.8338C217.237 32.1394 223.062 29.1475 231.14 29.1475C231.14 29.1475 256.371 28.4397 256.371 55.4638V93.4906H241.31V93.5228Z" fill="black"/>
                <path d="M531.731 93.5228V57.5872C531.731 51.9571 529.092 43.9786 519.373 43.3995C504.826 42.563 503.41 55.4317 503.41 61.1582V93.5228H488.348V29.9839H503.378V37.8338C507.658 32.1394 513.483 29.1475 521.561 29.1475C521.561 29.1475 546.793 28.4397 546.793 55.4638V93.4906H531.731V93.5228Z" fill="black"/>
                <path d="M315.492 60.4504C315.492 70.1019 307.671 77.9196 298.016 77.9196C288.362 77.9196 280.541 70.1019 280.541 60.4504C280.541 50.7989 288.362 42.9812 298.016 42.9812C307.671 42.9812 315.492 50.7989 315.492 60.4504ZM285.336 97.7373H268.762C268.762 97.7373 273.525 120.032 299.4 120.032C319.708 120.032 330.489 108.097 330.489 88.6005V29.9839H315.46V35.4531C310.986 31.689 305.837 29.5013 299.175 29.1796C284.049 28.4075 270.21 37.9303 266.541 52.6327C261.36 73.4477 277.226 92.0751 297.212 92.0751C306.513 92.0751 312.531 87.9249 315.46 84.0643C315.46 84.0643 319 102.981 304.872 106.81C297.18 108.901 288.458 106.231 285.304 97.7694L285.336 97.7373Z" fill="black"/>
                <path d="M389.61 60.4504C389.61 70.1019 381.789 77.9196 372.134 77.9196C362.479 77.9196 354.659 70.1019 354.659 60.4504C354.659 50.7989 362.479 42.9812 372.134 42.9812C381.789 42.9812 389.61 50.7989 389.61 60.4504ZM359.454 97.7373H342.88C342.88 97.7373 347.643 120.032 373.518 120.032C393.826 120.032 404.607 108.097 404.607 88.6005V29.9839H389.578V35.4531C385.104 31.689 379.955 29.5013 373.293 29.1796C358.167 28.4075 344.328 37.9303 340.659 52.6327C335.478 73.4477 351.344 92.0751 371.33 92.0751C380.631 92.0751 386.649 87.9249 389.578 84.0643C389.578 84.0643 393.118 102.981 378.989 106.81C371.298 108.901 362.576 106.231 359.422 97.7694L359.454 97.7373Z" fill="black"/>
                <path d="M28.2247 0V58.2306C28.2247 69.3941 19.1812 78.4343 8.01362 78.4343H0V93.4906H8.432C27.6776 93.4906 43.2864 77.8874 43.2864 58.6488V0H28.2247Z" fill="black"/>
                <path d="M28.2247 0V58.2306C28.2247 69.3941 19.1812 78.4343 8.01362 78.4343H0V93.4906H8.432C27.6776 93.4906 43.2864 77.8874 43.2864 58.6488V0H28.2247Z" fill="black"/>
                </g>
                <defs>
                <clipPath id="clip0_43_4">
                <rect width="735" height="120" fill="white"/>
                </clipPath>
                </defs>
              </svg>
            </a>
          </div>

          <!-- 검색바 -->
          <div class="search_box">
            <div class="search_icon_box">
              <img src="../img/search_icon.png" alt="검색">
            </div>
            <input type="text" name="keyword" id="search" placeholder="어떤 상품을 찾으시나요? 카페상품, 앱상품 모두 검색">
          </div>

          <!-- 헤더의 아이콘들 -->
          <div class="header_icon_box">
            <a href="<c:url value="/" />" class="sale_icon_box h_icon">
              <button class="sale_icon_button icon_bt">
                <svg id="판매하기" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M13.6859 20.6926H4.92323C3.88605 20.6926 3.08773 19.8241 3.20716 18.8409L4.49579 8.32142C4.5775 7.63983 5.18096 7.12109 5.89756 7.12109H15.8168C16.5334 7.12109 17.1369 7.6338 17.2186 8.32142L17.91 14.0701" stroke="currentColor" stroke-width="1.5"></path><path d="M8.35938 9.35156V9.5868C8.35938 10.7751 9.47828 11.7462 10.8486 11.7462C12.219 11.7462 13.3379 10.7751 13.3379 9.5868V9.35156" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path><path d="M7.35938 7.72983V6.25112C7.35938 4.34555 8.90414 2.80078 10.8097 2.80078V2.80078C12.7153 2.80078 14.26 4.34555 14.26 6.25112V7.72983" stroke="currentColor" stroke-width="1.5"></path><path d="M17.1179 22.4245C19.3694 22.4245 21.1968 20.5969 21.1968 18.347C21.1968 16.0972 19.3694 14.2695 17.1179 14.2695C14.8665 14.2695 13.0391 16.0972 13.0391 18.347C13.0391 20.5969 14.8665 22.4245 17.1179 22.4245Z" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path><path d="M17.1406 19.9298V16.7461" stroke="currentColor" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"></path><path d="M15.5312 18.3439H18.7149" stroke="currentColor" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"></path></svg>
              </button>
              <b>판매하기</b>
            </a>

            <a href="<c:url value='/login'/>" class="login_icon_box h_icon" methods="GET">
              <button class="login_icon_button icon_bt">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" size="24"><path stroke="#141313" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M16.775 7.716a3.619 3.619 0 1 1-7.238.005 3.619 3.619 0 0 1 7.238-.005M13.15 13.371c-4.026 0-7.298 3.184-7.4 7.145h14.8c-.102-3.961-3.374-7.145-7.4-7.145"></path></svg>
              </button>
              <b>로그인</b>
            </a>

            <a href="<c:url value='/mypage'/>" class="mypage_icon_box h_icon" methods="GET">
              <button class="mypage_icon_button icon_bt">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" size="24"><path stroke="#141313" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M16.775 7.716a3.619 3.619 0 1 1-7.238.005 3.619 3.619 0 0 1 7.238-.005M13.15 13.371c-4.026 0-7.298 3.184-7.4 7.145h14.8c-.102-3.961-3.374-7.145-7.4-7.145"></path></svg>
              </button>
              <b>마이페이지</b>
            </a>

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

        </div>
        <div class="h_bot">
          <div class="nav_txt">카테고리</div>
          <div class="nav_txt">이벤트</div>
          <div class="nav_txt">j쿠폰</div>
          <div class="nav_txt">사기조회</div>
          <div class="nav_txt">시세조회</div>
          <div class="nav_txt">출석체크</div>
          <div class="nav_txt">콘텐츠</div>
          <div class="nav_txt">찜한 상품</div>
          <div class="nav_txt">내 폰 팔기</div>
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