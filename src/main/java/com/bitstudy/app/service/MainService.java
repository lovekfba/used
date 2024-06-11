package com.bitstudy.app.service;

import com.bitstudy.app.domain.ProductDto;

import java.util.List;
import java.util.Map;

public interface MainService {
    List<ProductDto> main_list(String pro_category);

}
