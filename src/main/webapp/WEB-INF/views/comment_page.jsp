<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>댓글 게시판</title>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <link rel="stylesheet" href="<c:url value='/css/h_f.css'/> ">
    <link rel="stylesheet" href="<c:url value='/css/comment.css'/> ">
</head>
<body>
<div id="comment_area">
    <!-- 댓글 입력 폼 -->
    <div class="new_comment">
        <input type="text" id="txt_comment" name="comment" placeholder="새 글을 입력하십시오.">
        <button type="button" id="btn_submit_comment" class="comment_btn">등록</button>
    </div>

    <!-- 댓글 목록 -->
    <div id="list_comment"></div>
</div>

<%--페이지네이션 부분--%>
<div class="pagination">

    <c:if test="${ph.showPrevBtn}">
        <a href="<c:url value="/comments?Fk_pro_seqno=${param.Fk_pro_seqno}&page=${ph.startPage - 1}&pageSize=${ph.pageSize}"/>" class="startPage"><</a>
    </c:if>

    <c:forEach var="i" begin="${ph.startPage}" end="${ph.endPage}" step="1">
        <a href="<c:url value="/comments?Fk_pro_seqno=${param.Fk_pro_seqno}&page=${i}&pageSize=${ph.pageSize}"/>" class="${i==ph.page?"pageActive":""}" >${i}</a>
    </c:forEach>

    <c:if test="${ph.showNextBtn}">
        <a href="<c:url value="/comments?Fk_pro_seqno=${param.Fk_pro_seqno}&page=${ph.endPage + 1}&pageSize=${ph.pageSize}"/>" class="endPage">></a>
    </c:if>
</div>

<script>
    $(document).ready(function () {
        // 0을 붙여주는 함수
        function zero(num) {

            if (num < 10) {
                return "0" + num;
            }
            return num;
        }

        /* 부모글 쓰기(엔터 누르면 등록하기) */
        $('#txt_comment').on('keydown', function (enter) {
            let comment = $('#txt_comment').val().trim();

            if (enter.keyCode == 13 && $('#txt_comment').val().trim().length > 0) {
                $('#btn_submit_comment').trigger('click');
            } else if (enter.keyCode == 13 && comment == "") {
                alert("댓글을 작성하여 주십시오.");
                $('#txt_comment').val("");
                showList();
                return;
            }
        })

        // 댓글을 등록하는 함수
        $('#btn_submit_comment').on('click', function () {
            let comment = $('#txt_comment').val().trim();

            if (comment == "") {
                alert("댓글을 작성하여 주십시오.");
                $('#btn_submit_comment').focus();
                return;
            }

            // 댓글 등록 AJAX 요청
            $.ajax({
                type: 'POST',
                url: "/parent",
                headers: {"content-type": "application/json"},
                data: JSON.stringify({
                    co_comment: comment,
                    Fk_pro_seqno: "${param.Fk_pro_seqno}"
                }),
                success: function (result) {
                    $('#txt_comment').val("");
                    showList();
                    alert("댓글이 등록되었습니다.");
                },
                error: function () {
                    alert("등록 실패 - 관리자에게 문의하십시오.");
                }
            });
        });

        // 댓글 목록을 불러오는 함수
        let showList = function () {
            $.ajax({
                url: '/comments',
                type: 'POST',
                data: {
                    Fk_pro_seqno: ${param.Fk_pro_seqno},
                    page: ${ph.page},
                    pageSize: 10 // 페이지 크기는 필요에 따라 지정
                },
                success: function (result) {
                    let tmp = "";
                    // 부모글과 해당 부모글에 속하는 답글들을 함께 표시
                    result.forEach(function (rowResult) {
                        // 댓글 등록일을 포맷팅
                        let dt = new Date(rowResult.co_reg_date);
                        let year = dt.getFullYear();
                        let month = dt.getMonth() + 1;
                        let date = dt.getDate();
                        let hour = dt.getHours();
                        let min = dt.getMinutes();
                        let sec = dt.getSeconds();
                        let uid = "<%= session.getAttribute("cu_id") %>";  //유저
                        // 아이디 여기서바꿀수있음
                        let seller = "${list[0].FK_cu_id}";

                        // 댓글 HTML 생성
                        tmp += `<div class="list_item">
                                    <div class=" ${'${rowResult.co_depth}'} ` ;

                                //``백틱안에서 삼항연산자가 제대로 작동하지않아서 class 도중에 백틱 닫고 삼항연산자 적용 119줄부터  121줄까지
                                tmp +=   rowResult.co_depth == 0 ? " item_box" : ""+ rowResult.co_depth == 1 ? " item_box2" : "" +rowResult.co_depth == 2 ? " item_box3" : ""+rowResult.co_depth == 3 ? " item_box4 " : "" +rowResult.co_depth >= 4 ? " item_box5" : ""
                                    tmp += `">
                                        <div class="item_head">
                                            <div>
                                                <%-- 게시글번호 표시 지금은 비활성화 활성화 하면 다시게시글번호 보여짐--%>
                                                <%--<span class="span_seqno">${"${rowResult.co_seqno}"} &nbsp&nbsp&nbsp&nbsp </span>--%>
                                                <span class="span_commenter" data-commenter="${'${rowResult.co_commenter}'}"> &nbsp&nbsp ${"${rowResult.co_commenter}"}</span>
                                            </div>
                                            <span >${'${year}'}-${'${zero(month)}'}-${'${zero(date)}'} ${'${zero(hour)}'}:${'${zero(min)}'}:${'${zero(sec)}'}</span>
                                        </div>
                                        <div class="item_body">
                                            <div class="option_disflex">
                                            <input type="text" class="comment_title" name="comment_title" value="${'${rowResult.co_comment}'}" readonly >`;
                                            //판매자와 유저아이디가 같고 작성자와 판매자가 다르다면 판매하기 버튼 추가 135줄부터 139줄까지
                                            if(uid == seller){
                                                if(seller != rowResult.co_commenter ){
                                                    tmp+=`<button class="comment_btn sale_btn">판매하기</button>`
                                                }
                                            }
                                                tmp += `</div>
                                                <div class="btn_flex">
                                                <button type="button" class="comment_btn btn_comment_reply mazbot" data-parentSeqno="${'${rowResult.co_seqno}'}">답글 쓰기</button>`;
                                                //유저아이디가 지정한 사람일때만 수정, 삭제 버튼 추가 139줄부터 146줄까지
                                                if (uid == rowResult.co_commenter) {
                                                                tmp += `<div class="modifydel" data-co_seqno="${'${rowResult.co_seqno}'}" data-co_commenter="${'${rowResult.co_commenter}'}">`;
                                                                tmp += `<button type="button" class="comment_btn btn_comment btn_comment_modify">수정</button>
                                                                        <button type="button" class="comment_btn btn_comment btn_comment_del">삭제</button>
                                                                        <button type="button" class="comment_btn btn_comment btn_comment_edit_submit displayNone">등록</button>
                                                                        <button type="button" class="comment_btn btn_comment btn_comment_edit_cancel displayNone">취소</button>`;
                                                                tmp += `</div>`;
                                                            }
                                                tmp += `</div>
                                            </div>
                                        </div>`;
                            tmp += `</div>`;
                        });

                    // 댓글 목록을 화면에 표시
                    $('#list_comment').html(tmp);
                },
                error: function () {
                    alert("댓글 가져오기 실패");
                }
            });
        };
        showList();

        // 댓글 삭제
        $(document).on('click', '.btn_comment_del', function () {
            let co_seqno = $(this).parent().attr("data-co_seqno");
            let co_commenter = $(this).parent().attr("data-co_commenter");

            if (confirm("정말로 삭제하시겠습니까?")) {
                $.ajax({
                    type: "DELETE",
                    url: "/comments",
                    headers: {"content-type": "application/json"},
                    data: JSON.stringify({co_seqno: co_seqno, co_commenter: co_commenter}),
                    success: function () {
                        showList();
                        alert("댓글이 삭제되었습니다.");
                    },
                    error: function () {
                        alert("댓글 삭제 실패");
                    }
                });
            }
        });

        // 댓글 수정 기능 활성화
        $(document).on('click', '.btn_comment_modify', function () {
            let el = $(this).parent().parent().prev().find('.comment_title');

            currComment = el.val();
            el.attr("readonly", false);
            el.addClass('active_comment_edit');
            el.select();
            $(this).parent().children('.btn_comment').toggleClass('displayNone');
            el.focus(); // 수정 필드에 포커스를 주어 수정할 수 있도록 함
        });

        // 수정 취소 버튼
        $(document).on('click', '.btn_comment_edit_cancel', function () {
            let el = $(this).parent().parent().prev().find('.comment_title');
            el.attr("readonly", true);
            el.removeClass('active_comment_edit');
            el.val(currComment); // 원래 값으로 복원
            el.blur();
            $(this).parent().children('.btn_comment').toggleClass('displayNone');
        });

        /* 댓글 수정(엔터 누르면 등록하기) */
        $(document).on('keydown', '.comment_title', function (enter) {
            let comment = $(this).val().trim();

            if (enter.keyCode == 13) {
                if (comment != "") {
                    $(this).closest('.list_item').find('.btn_comment_edit_submit').trigger('click');
                } else {
                    alert("댓글을 작성하여 주십시오.");
                    $(this).val(currComment);
                    showList();
                    return;
                }
            }
        });

        // 댓글 수정 완료 버튼
        $(document).on('click', '.btn_comment_edit_submit', function () {
            let el = $(this).parent().parent().prev().find('.comment_title');
            let co_comment = el.val();
            let co_seqno = $(this).parent().attr("data-co_seqno");
            let co_commenter = $(this).parent().attr("data-co_commenter");


            $.ajax({
                type: 'PATCH',
                url: '/comments',
                headers: {"content-type": "application/json"},
                data: JSON.stringify({co_comment: co_comment, co_seqno: co_seqno, co_commenter: co_commenter}),
                success: function (result) {
                    showList();
                    alert("댓글이 수정되었습니다.");
                },
                error: function () {
                    alert("댓글 수정 실패")
                }
            });
        });

        // 댓글에 대한 답글 기능 추가
        $(document).on('click', '.btn_comment_reply', function () {
            let replyContainer = $(this).parent().parent().find('.reply_container');

            // 답글 입력 창이 이미 존재하면 삭제
            if (replyContainer.length > 0) {
                replyContainer.remove();
            } else {
                let co_seqno = $(this).attr("data-parentSeqno");

                // 답글을 작성하는 입력 필드를 추가
                let replyInput =

                    `<div class="reply_container option_disflex" >
                            <input type="text" class="reply_comment " placeholder="답글을 입력하십시오.">

                            <button type="button" class="btn_submit_reply btn_size" data-co_seqno="${co_seqno}">등록</button>
                            </div>`;

                // Append the reply input field
                $(this).parent().parent().append(replyInput);

                $(this).parent().parent().find('.reply_comment').focus();
            }
        });

        /* 답글 쓰기(엔터 누르면 등록하기) */
        $(document).on('keydown', '.reply_comment', function (enter) {
            let comment = $('.reply_comment').val().trim();

            if (enter.keyCode == 13 && $('.reply_comment').val().trim().length > 0) {
                $('.btn_submit_reply').trigger('click');
            } else if (enter.keyCode == 13 && comment == "") {
                alert("댓글을 작성하여 주십시오.");
                $('.reply_comment').val("");
                showList();
                return;
            }
        })

        // 답글 등록 기능
        $(document).on('click', '.btn_submit_reply', function () {
            let replyInput = $(this).prev('.reply_comment');
            let comment = replyInput.val().trim();
            let co_seqno = $(this).closest('.reply_container').prev().find('.btn_comment_reply').attr("data-parentSeqno");

            if (comment == "") {
                alert("답글을 작성하여 주십시오.");
                replyInput.focus();
                return;
            }
            let co_commenter = "<%= session.getAttribute("cu_id") %>"; // 답글 작성자

            $.ajax({
                type: 'POST',
                url: "/child",
                headers: {"content-type": "application/json"},
                data: JSON.stringify({co_comment: comment, co_seqno: co_seqno, co_commenter: co_commenter, Fk_pro_seqno: ${param.Fk_pro_seqno}}),
                success: function (result) {
                    showList();
                    alert("답글이 등록되었습니다.");
                },
                error: function () {
                    alert("등록 실패 - 관리자에게 문의하십시오.");
                }
            });
            // 답글 작성 후 입력 필드를 초기화
            replyInput.val("");
            $(this).parent().remove();
        });

        // 판매버튼 누를시 작성글의 작성자 정보 추출
        $(document).on('click', '.sale_btn', function () {
            let pro_consumer_id =$(this).parent().parent().prev().children().find(`.span_commenter`).attr("data-commenter");

            console.log(pro_consumer_id);

            $.ajax({
                type: 'POST',
                url: "/sale",
                headers: {"content-type": "application/json"},
                data: JSON.stringify({pro_seqno: ${param.Fk_pro_seqno}, pro_consumer_id: pro_consumer_id}),
                success: function (result) {
                    if("${list[0].pro_sold_out}" == 0){
                        alert("판매가 이미 완료된 상품입니다.");
                    }
                    else {
                        alert("판매를 완료하였습니다.");
                    }
                },
                error: function () {
                    alert("판매 실패 - 관리자에게 문의하십시오.");
                }
            });
        });
    })
</script>
</body>
</html>
