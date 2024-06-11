package com.bitstudy.app.service;


import com.bitstudy.app.dao.CustomerDao;
import com.bitstudy.app.domain.CustomerDto;
import com.bitstudy.app.domain.CustomerLoginDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    CustomerDao customerDao;

//    회원가입
    @Override
    public int register(CustomerDto customerDto) {
        return customerDao.insertCustomer(customerDto);
    }

//    회원가입: 유호성 검사
    @Override
    public CustomerDto registerChk(String cu_id) {
        return customerDao.selectCustomer(cu_id);
    }

//    로그인
    @Override
    public CustomerLoginDto login(Map map) {
        return customerDao.selectLogin(map);
    }

//    아이디에 해당하는 닉네임 가져오기
    @Override
    public String Nickname(String cu_id) { return customerDao.customerName(cu_id);}

}
