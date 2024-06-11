package com.bitstudy.app.controller;

import com.bitstudy.app.domain.CommentDTO;
import com.bitstudy.app.domain.PageHandlerPro;
import com.bitstudy.app.domain.ProductDto;
import com.bitstudy.app.service.CommentService;
import com.bitstudy.app.service.PagenationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CommentController {
    @Autowired CommentService service;
    @Autowired PagenationService pagenationService;

    @GetMapping("/comments")
    public String commentShow (Integer Fk_pro_seqno, Integer page, Integer pageSize, Model m) {

        if(Fk_pro_seqno == null) Fk_pro_seqno=1;
        if(page == null) page=1;
        if(pageSize == null) pageSize=10;

        int totalCount = pagenationService.getCount(Fk_pro_seqno);

        PageHandlerPro pageHandlerPro = new PageHandlerPro(totalCount, page, pageSize);

        Map map = new HashMap();
        map.put("offset", (page - 1) * pageSize);
        map.put("pageSize", pageSize);

        List<ProductDto> list = service.selectProduct(Fk_pro_seqno);

        m.addAttribute("ph", pageHandlerPro);
        m.addAttribute("list", list);

        return "product";
    }

    @PostMapping("/comments")
    @ResponseBody
    public ResponseEntity<List<CommentDTO>> limitInsert(Integer Fk_pro_seqno, Integer page, Integer pageSize, HttpSession session) {

//        특정 개수의 댓글을 넣는다.
        try {
            if(Fk_pro_seqno == null) Fk_pro_seqno=1;
            if(page == null) page=1;
            if(pageSize == null) pageSize=10;

            // 총 게시글 수 구하기
            int totalCount = pagenationService.getCount(Fk_pro_seqno);

            // 페이징 계산
            PageHandlerPro pageHandlerPro = new PageHandlerPro(totalCount, page, pageSize);

            // (몇번째 글부터 몇번째 글까지 가져올지 결정)
            Map map = new HashMap();
            map.put("Fk_pro_seqno", Fk_pro_seqno);
            map.put("offset", (page - 1) * pageSize);
            map.put("pageSize", pageSize);

            int offset = (page - 1) * pageSize;

            // 이렇게 하면 글 10개 가져옴
            List<CommentDTO> list = pagenationService.selectPage(map);

            return new ResponseEntity<List<CommentDTO>>(list, HttpStatus.OK);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

////    댓글 전부 보이기
//    @GetMapping("/comments")
//    @ResponseBody
//    public ResponseEntity<List<CommentDTO>> selectAll() {
//        try {
//            List<CommentDTO> list = service.selectAll();
//            return new ResponseEntity<List<CommentDTO>>(list, HttpStatus.OK);
//
//        } catch (Exception e) {
////            throw new RuntimeException(e);
//            e.printStackTrace();
//            return new ResponseEntity<List<CommentDTO>>(HttpStatus.BAD_REQUEST);
//        }
//    }

    //    부모글 DB에 저장
    @PostMapping("/parent")
    public ResponseEntity<String> parentInsert(@RequestBody CommentDTO CommentDTO, HttpSession session) {
        try {

            String commenter = (String) session.getAttribute("cu_id");
            CommentDTO.setCo_commenter(commenter);

            if (service.parentInsert(CommentDTO) != 1) {
                throw new Exception("글 등록 실패");
            }

            HttpHeaders responseHeader = new HttpHeaders();
            responseHeader.add("content-type", "text/html; charset=UTF-8");

            return new ResponseEntity<String>("글 등록 성공", responseHeader, HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }
    }

    /* 글 삭제 */
    @DeleteMapping("/comments")
    public ResponseEntity<String> delete(@RequestBody CommentDTO CommentDTO, HttpSession session) {
        try {

//            나중에 사용할 것
//            String commenter = (String) session.getAttribute("id");

            if(service.delete(CommentDTO.getCo_seqno(), CommentDTO.getCo_commenter()) != 1) {
                throw new Exception("글 삭제 실패");
            }

            HttpHeaders responseHeader = new HttpHeaders();
            responseHeader.add("content-type","text/html; charset=UTF-8");

            return new ResponseEntity<String> ("글 삭제 성공", responseHeader, HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String> (HttpStatus.BAD_REQUEST);
        }
    }

    /* 글 수정  */
    @PatchMapping("/comments")
    public ResponseEntity<String> modify(@RequestBody CommentDTO CommentDTO, HttpSession session) {
        try {

//            String commenter = (String) session.getAttribute("id");

//            commentDto.setCommenter(commenter);
//            commentDto.setCno(cno);

            if(service.update(CommentDTO) != 1) {
                throw new Exception("실패");
            }

            HttpHeaders responseHeader = new HttpHeaders();
            responseHeader.add("content-type","text/html; charset=UTF-8");

            return new ResponseEntity<String> ("댓글 수정 성공", responseHeader, HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String> (HttpStatus.BAD_REQUEST);
        }
    }

//    답글 등록
@PostMapping("/child")
public ResponseEntity<String> childInsert(@RequestBody CommentDTO DTO) {
    try {
//          String commenter = (String) session.getAttribute("id");

        if(service.childInsert(DTO)!= 1) {
            throw new Exception("글 등록 실패");
        }

        HttpHeaders responseHeader = new HttpHeaders();
        responseHeader.add("content-type", "text/html; charset=UTF-8");

        return new ResponseEntity<String>("글 등록 성공", responseHeader, HttpStatus.OK);

    } catch (Exception e) {
        e.printStackTrace();
        return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
    }
}

    @PostMapping("/sale")
    public ResponseEntity<String> saleUpdate(@RequestBody ProductDto DTO) {
        System.out.println(DTO.getPro_consumer_id());
        try {

            if(service.saleUpdate(DTO)!= 1) {
                throw new Exception("판매 실패");
            }

            HttpHeaders responseHeader = new HttpHeaders();
            responseHeader.add("content-type", "text/html; charset=UTF-8");

            return new ResponseEntity<String>("판매 성공", responseHeader, HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }
    }
}