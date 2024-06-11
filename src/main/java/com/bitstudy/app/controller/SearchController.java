package com.bitstudy.app.controller;

import com.bitstudy.app.domain.PageHandler;
import com.bitstudy.app.domain.ProductDto;
import com.bitstudy.app.domain.SearchDto;
import com.bitstudy.app.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.net.URLEncoder;
import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class SearchController {

    @Autowired
    SearchService searchService;


    @GetMapping("/search")
    public String search(SearchDto sc, Integer page, Model m) {
System.out.println("search 컨트롤러 테스트 시작");
        try {
            List<ProductDto> pro_list = new ArrayList<>();
            int totalCount = 0;

            Integer pageSize = sc.getPageSize();
            Integer offset = sc.getOffset();
            Integer max_price = 0;
            Integer min_price = 0;
            Integer avg_price = 0;

            if(page == null) page = 1;
            if(pageSize == null) pageSize = 35; sc.setPageSize(35);
            if(offset == null) offset = (page - 1) * 35; sc.setOffset((page - 1) * 35);

System.out.println("111111:" + sc);
            // 만약 keyword가 없을시 pro_category로 검색한 것과 같으니 조건문을 pro_category값이 null이 아니거나 keyword가 null값이거나 빈값일때 실행하도록 한다.
            if(sc.getPro_category() != null && (sc.getKeyword() == null || sc.getKeyword().isEmpty())) {
System.out.println("aaaaaaaaa: " + sc.getPro_category());
                pro_list = searchService.categorySelect(sc);
                totalCount = searchService.categorySelectCount(sc);
                max_price = searchService.categorySelectMaxPrice(sc);
                min_price = searchService.categorySelectMinPrice(sc);
                avg_price = searchService.categorySelectAvgPrice(sc);
            }
            // 만약 pro_category가 없을시 키워드로 검색한 것과 같으니 조건문을 keyword가 null이 아니고 pro_category 들이 null값이거나 빈값일때 실행하도록 한다.
System.out.println("222222:" + sc);
            if(sc.getKeyword() != null && (sc.getPro_category() == null || sc.getPro_category().isEmpty())) {
                pro_list = searchService.searchSelect(sc);
                totalCount = searchService.searhSelectCount(sc);
                max_price = searchService.searhSelectMaxPrice(sc);
                min_price = searchService.searhSelectMinPrice(sc);
                avg_price = searchService.searhSelectAvgPrice(sc);
            }



            PageHandler ph = new PageHandler(page, sc.getPageSize(), totalCount);
            System.out.println("totalCount: " + totalCount);
            m.addAttribute("pro_list", pro_list);
            m.addAttribute("ph", ph);
            m.addAttribute("sc", sc);
            m.addAttribute("max_price", max_price);
            m.addAttribute("min_price", min_price);
            m.addAttribute("avg_price", avg_price);



            return "searchForm";
        } catch (Exception e) {
            return "test";
        }
    }
}
