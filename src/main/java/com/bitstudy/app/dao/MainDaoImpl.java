package com.bitstudy.app.dao;

import com.bitstudy.app.domain.ProductDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;


@Repository
public class MainDaoImpl implements MainDao {
    @Autowired
    SqlSession session;

    String namespace="com.bitstudy.app.dao.mainMapper.";

//    메인화면에 해당 카테고리 상품들 나열
    @Override
    public List<ProductDto> mainList(String pro_category) {
        return session.selectList(namespace + "mainList", pro_category);
    }

}
