package com.bitstudy.app.service;

import com.bitstudy.app.domain.ProductDto;
import com.bitstudy.app.domain.SearchDto;

import java.util.List;

public interface SearchService {
    List<ProductDto> searchSelect(SearchDto sc);

    int searhSelectCount(SearchDto sc);

    int searhSelectMinPrice(SearchDto sc);

    int searhSelectMaxPrice(SearchDto sc);

    int searhSelectAvgPrice(SearchDto sc);

    List<ProductDto> categorySelect(SearchDto sc);

    int categorySelectCount(SearchDto sc);

    int categorySelectMinPrice(SearchDto sc);

    int categorySelectMaxPrice(SearchDto sc);

    int categorySelectAvgPrice(SearchDto sc);
}
