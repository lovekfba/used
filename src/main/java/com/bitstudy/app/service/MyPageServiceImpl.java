package com.bitstudy.app.service;

import com.bitstudy.app.dao.MyPageDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;




@Service
public class MyPageServiceImpl implements MyPageService {
    @Autowired
    MyPageDao myPageDao;

//    마이 페이지에서 회원정보 지우기
    @Override
    public int deleteCustomer(String cu_id) {
        return myPageDao.deleteCustomer(cu_id);
    }

}
