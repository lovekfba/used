package com.bitstudy.app.dao;

import com.bitstudy.app.domain.ProductDto;

import java.util.List;
import java.util.Map;

public interface CategoryDao {
    //    카테고리에 해당하는 상품들을 페이지에 전시
    List<ProductDto> categoryList(String pro_category);

    // category별 상품의 총 개수 구하기
    Integer categoryCount(String pro_category);

    // 카테고리: 낮은 가격순
    List<ProductDto> categoryMinPriceList(String pro_category);

    // 카테고리: 높은 가격순
    List<ProductDto> categoryMaxPriceList(String pro_category);

    // 카테고리: 최신순
    List<ProductDto> categoryRegDateList(String pro_category);

    // 카테고리별: 상품들의 가장 높은 가격을 뽑아오기
    int categoryMaxPrice(String pro_category);

    // 카테고리별: 상품들의 가장 낮은 가격을 뽑아오기
    int categoryMinPrice(String pro_category);

    // 카테고리별: 상품들의 평균 가격을 뽑아오기
    int categoryAvgPrice(String pro_category);

    List<ProductDto> categoryPagination(Map map);
}
