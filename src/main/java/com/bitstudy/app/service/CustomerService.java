package com.bitstudy.app.service;

import com.bitstudy.app.domain.CustomerDto;
import com.bitstudy.app.domain.CustomerLoginDto;

import java.util.Map;

public interface CustomerService {
    //    회원가입
    int register(CustomerDto customerDto);

    //    회원가입: 유호성 검사
    CustomerDto registerChk(String cu_id);

    //    로그인
    CustomerLoginDto login(Map map);

    //    아이디에 해당하는 닉네임 가져오기
    String Nickname(String cu_id);
}
