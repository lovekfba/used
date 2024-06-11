package com.bitstudy.app.controller;

import com.bitstudy.app.domain.PageHandlerPro;
import com.bitstudy.app.service.PagenationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class PagenationController {
    @Autowired
    PagenationService pagenationService;

    @GetMapping("/123")
    public String list(Integer Fk_pro_seqno, Integer page, Integer pageSize, Model m, HttpServletRequest request) {
        /* - 순서
            1) 일단 사용자가 게시판 페이지로 들어올때 '현재 페이지'와 '한페이지당 보여줄 페이지 개수' 를 컨트롤러에서
                받아야 하기 때문에 GetMapping 부분에서 매개변수로 page, pageSize를 받아야 함
            2) page, pageSize 받아서 map 에 담고
            3) 그 map을 model에 담아서 view에 보내준다
        * */
//        HttpSession session = request.getSession(); - 회원가입 및 로그인 이후 가능

        try {
            if(page == null) page=1;
            if(pageSize == null) pageSize=10;

            // 총 게시글 수 구하기 (221개)
            int totalCount = pagenationService.getCount(Fk_pro_seqno);

            // 페이징 계산 (221 / (double)10)
            PageHandlerPro pageHandlerPro = new PageHandlerPro(totalCount, page, pageSize);

            /*
                 int totalCount = 221;
                 int pageSize = 10;
                 int totalPage = 0;
                 int navPage = 10;
                 int startPage = 0;
                 int endPage = 0;
                 int page = 1;
                 boolean showPrevBtn = false;
                 boolean showNextBtn = true;

                 1 2 3 4 5 6 7 8 9 10 [다음]

*/

//            // boardMapper.xml 의 <select id="selectPage" 부분에 값 보내기
//            // (몇번째 글부터 몇번째 글까지 가져올지 결정)
//            Map map = new HashMap();
//            map.put("offset", (page - 1) * pageSize);
//            map.put("pageSize", pageSize);
//
//            // 이렇게 하면 글 10개 가져옴
//            List<Ex02_BoardDto> list = boardService.getPage(map);
//
//            m.addAttribute("list", list);


            m.addAttribute("ph", pageHandlerPro);


            return "pagenation";
        } catch (Exception e) {
            System.out.println("에러났슈");
            throw new RuntimeException(e);
        }
    }
}
