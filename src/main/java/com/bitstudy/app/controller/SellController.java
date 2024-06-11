package com.bitstudy.app.controller;

import com.bitstudy.app.domain.ProductDto;
import com.bitstudy.app.service.SellService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;

@Controller
public class SellController {
    @Autowired
    SellService sellService;

    @GetMapping("/sell")
    public String show(HttpServletRequest request, HttpSession session) {

        if(session.getAttribute("cu_id") == null){
            session.setAttribute("prevPage", request.getServletPath());
            return "redirect:/login";
        }
    return "sell";
    }

    private static final String F_PATH = "C:/Users/user1/Desktop/used/src/main/webapp/resources/img/";
    @PostMapping("/sell")
    public String pro_insert(@RequestParam(value="f_file", required = false) MultipartFile mf, ProductDto DTO, HttpSession session) {

        /***************** 주의 *************/
//        FK_cu_id를 세션의 값으로 저장한다. 맵퍼 참조

        String originalFileName = mf.getOriginalFilename();
        long currentTimeMillis = System.currentTimeMillis();
        String safeFile = F_PATH + currentTimeMillis + originalFileName;
        String finalSafeFile = "img/" + currentTimeMillis + originalFileName;

        String FK_cu_id = (String) session.getAttribute("cu_id");
        DTO.setFK_cu_id(FK_cu_id);
        DTO.setPro_img(finalSafeFile);

        sellService.proInsert(DTO);

        try {
            mf.transferTo(new File(safeFile));
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/";
    }

}
