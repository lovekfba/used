package com.bitstudy.app.dao;

import com.bitstudy.app.domain.ProductDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SellDAOImpl implements SellDAO {
    @Autowired
    SqlSession session;

    String namespace = "com.bitstudy.app.dao.SellMapper.";

    @Override
    public int proInsert(ProductDto DTO) {

        return session.insert(namespace+"proInsert", DTO);
    };
}
