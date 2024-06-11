package com.bitstudy.app.service;

import com.bitstudy.app.domain.ProductDto;

import java.util.List;
import java.util.Map;

public interface CategoryService {
    //   카테고리 페이지당 맞는 카테고리를 가진 상품들을 모두 전시한다.
    List<ProductDto> catePageList(String pro_category);

    //    카테고리별로 전시된 상품들의 총 개수를 구한다.
    int cate_product_count(String pro_category);

    //    카테고리: 높은 가격순 list
    List<ProductDto> cate_page_max_price_list(String pro_category);

    //    카테고리: 낮은 가격순 list
    List<ProductDto> cate_page_min_price_list(String pro_category);

    //    카테고리: 최신순 list
    List<ProductDto> cate_page_reg_date_list(String pro_category);

    //    카테고리: 상품중 가장 높은 가격 가져오기
    int cate_page_max_price(String pro_category);

    //    카테고리: 상품중 가장 낮은 가격 가져오기
    int cate_page_min_price(String pro_category);

    //    카테고리: 상품들 평균 가격 가져오기
    int cate_page_avg_price(String pro_category);

    List<ProductDto> categoryPagination(Map map);
}
