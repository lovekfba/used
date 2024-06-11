package com.bitstudy.app.dao;

import com.bitstudy.app.domain.ProductDto;

import java.util.List;
import java.util.Map;

public interface MainDao {
    List<ProductDto> mainList(String pro_category);

}
