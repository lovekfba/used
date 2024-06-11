package com.bitstudy.app.service;

import com.bitstudy.app.dao.MainDao;
import com.bitstudy.app.domain.ProductDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class MainServiceImpl implements MainService {
    @Autowired
    MainDao mainDao;

//    메인화면에서 각 카테고리 섹션에 넣을 자료들이다.
    @Override
    public List<ProductDto> main_list(String pro_category) {
        return mainDao.mainList(pro_category);
    }




}
