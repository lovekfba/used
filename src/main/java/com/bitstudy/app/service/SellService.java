package com.bitstudy.app.service;

import com.bitstudy.app.dao.SellDAOImpl;
import com.bitstudy.app.domain.ProductDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SellService implements SellServiceImpl {
    @Autowired
    SellDAOImpl sellDAOImpl;

    @Override
    public int proInsert(ProductDto DTO) {
        return sellDAOImpl.proInsert(DTO);
    }
}
