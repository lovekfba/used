package com.bitstudy.app.dao;

import com.bitstudy.app.domain.ProductDto;
import com.bitstudy.app.domain.SearchDto;

import java.util.List;
import java.util.Map;

public interface SearchDao {
    //    header 검색바에서 검색했을 시, 그리고 그 안에서 가격 범위와 지역을 조회했을 시 사용하는 명령어
    List<ProductDto> searchSelect(SearchDto sc);

    //    위에 실행한 결과물로 나오는 상품의 개수
    int searchSelectCount(SearchDto sc);

    //    search로 실행한 결과물들의 최소가격이다.
    int searchSelectMinPrice(SearchDto sc);

    //    search로 실행한 결과물들의 최대가격이다.
    int searchSelectMaxPrice(SearchDto sc);

    //    search로 실행한 결과물들의 평균가격이다.
    int searchSelectAvgPrice(SearchDto sc);

    //    category 페이지 내에서 가격의 범위와 지역을 조회했을시 사용하는 명령어
    List<ProductDto> categorySelect(SearchDto sc);

    //    위에 실행한 결과물로 나오는 상품의 개수
    int categorySelectCount(SearchDto sc);

    //    category 페이지 내에서 검색한 상품들의 최소 가격이다.
    int categorySelectMinPrice(SearchDto sc);

    //    category 페이지 내에서 검색한 상품들의 최대 가격이다.
    int categorySelectMaxPrice(SearchDto sc);

    //    category 페이지 내에서 검색한 상품들의 평균 가격이다.
    int categorySelectAvgPrice(SearchDto sc);
}
