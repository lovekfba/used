package com.bitstudy.app.controller;


import com.bitstudy.app.domain.PageHandler;
import com.bitstudy.app.domain.ProductDto;
import com.bitstudy.app.service.MainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.*;

@Controller
public class MainController {
    @Autowired
    MainService mainService;



    @GetMapping("/")
    public String mainPage(Model m) {
        try {
            List<ProductDto> main_list0 = mainService.main_list("의류"); // 화장품 카테고리를 가진 상품들이 30개
            List<ProductDto> main_list1 = mainService.main_list("화장품"); // 의류 카테고리를 가진 상품들이 30개
            List<ProductDto> main_list2 = mainService.main_list("전자기기"); // 전자기기 카테고리를 가진 상품들이 30개
            List<ProductDto> main_list3 = mainService.main_list("도서"); // 도서 카테고리를 가진 상품들이 30개
            List<ProductDto> main_list4 = mainService.main_list("스포츠"); // 스포츠 카테고리를 가진 상품들이 30개
            List<ProductDto> main_list5 = mainService.main_list("차량"); // 차량 카테고리를 가진 상품들이 30개
            List<ProductDto> main_list6 = mainService.main_list("무료나눔"); // 무료나눔 카테고리를 가진 상품들이 30개

//System.out.println("main_list1: " + main_list1);
//
//            List<List<ProductDto>>[] list = new ArrayList[7];
//            System.out.println("listlist11111111: " + Arrays.toString(list));
//
//            for(int i=0; i<7;i++) {
//                list[i]=new ArrayList<List<ProductDto>>();
//            }
//
//            list[0].add(main_list0);
//            list[1].add(main_list1);
//            list[2].add(main_list2);
//            list[3].add(main_list3);
//            list[4].add(main_list4);
//            list[5].add(main_list5);
//            list[6].add(main_list6);

//            System.out.println("listlist: " + Arrays.toString(list));
//
//            m.addAttribute("list",list);

            m.addAttribute("main_list0",main_list0);
            m.addAttribute("main_list1",main_list1);
            m.addAttribute("main_list2",main_list2);
            m.addAttribute("main_list3",main_list3);
            m.addAttribute("main_list4",main_list4);
            m.addAttribute("main_list5",main_list5);
            m.addAttribute("main_list6",main_list6);


            return "index";
        } catch (Exception e) {
            System.out.println("오류났습니다!");
            return ""; // 나중에 에러페이지 하나 만들고 달까?
        }
    }


}
