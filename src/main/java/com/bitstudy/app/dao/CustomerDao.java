package com.bitstudy.app.dao;

import com.bitstudy.app.domain.CustomerDto;
import com.bitstudy.app.domain.CustomerLoginDto;

import java.util.Map;

public interface CustomerDao {
    //    회원가입
    int insertCustomer(CustomerDto customerDto);

    //  회원가입: 유호성 검사
    CustomerDto selectCustomer(String cu_id);


    //    로그인
    CustomerLoginDto selectLogin(Map map);

    //    해당 id가 가지고 있는 닉네임 가져오기
    String customerName(String cu_id);

    //    전부 지우기
    int delectAll();
}
