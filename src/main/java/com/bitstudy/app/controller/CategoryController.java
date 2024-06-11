package com.bitstudy.app.controller;

import com.bitstudy.app.domain.PageHandler;
import com.bitstudy.app.domain.ProductDto;
import com.bitstudy.app.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.net.URLEncoder;
import java.util.*;


@Controller
public class CategoryController {
    @Autowired
    CategoryService categoryService;


    @GetMapping("/category")
//    우선 페이징까지 포함해 매개변수를 짰다.
    public String category(Integer page, Integer pageSize, String pro_category, Model m) {
        // session을 만든 이유는 loginCkh 때문 session에 저장되어있는 id를 검사하기 위해서는 session이 필요할테니까.

        try {
            if(page == null) page = 1;
            if(pageSize == null) pageSize = 35;

            // 총 게시물 숫자 구하기
            int totalCount = categoryService.cate_product_count(pro_category);

            PageHandler ph = new PageHandler(page, pageSize, totalCount);

            Map map = new HashMap();
            map.put("offset", (page - 1) * pageSize);
            map.put("pageSize", pageSize);
            map.put("pro_category", pro_category);

            List<ProductDto> pro_list = categoryService.categoryPagination(map);
            m.addAttribute("ph", ph);
            m.addAttribute("pro_list", pro_list); // 선택한 카테고리별 상품들을 모델에 저장하고 view파일에 넣어준다.


            // 해당 상품들의 최대값, 최소값, 평균값 구하기
            int max_price = categoryService.cate_page_max_price(pro_category);
            int min_price = categoryService.cate_page_min_price(pro_category);
            int avg_price = categoryService.cate_page_avg_price(pro_category);

            // 테스트용 list
//            List<ProductDto> pro_list = categoryService.catePageList(pro_category);
//            System.out.println(pro_list);

            m.addAttribute("pro_category", pro_category); // 선택한 카테고리 키워드를 모델에 저장하고 view파일에 넣어준다.

            m.addAttribute("max_price", max_price);
            m.addAttribute("min_price", min_price);
            m.addAttribute("avg_price", avg_price);


            return "categoryForm";

        } catch (Exception e) {
            return "";
        }
    }

}
