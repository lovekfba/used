package com.bitstudy.app.dao;

import com.bitstudy.app.domain.CustomerDto;
import com.bitstudy.app.domain.CustomerLoginDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Map;


@Repository
public class CustomerDaoImpl implements CustomerDao {
    @Autowired
    SqlSession session;

    String namespace="com.bitstudy.app.dao.CustomerMapper.";

//    회원가입
    @Override
    public int insertCustomer(CustomerDto customerDto) { // 해당 변수들이 mapper에서 각자 알아서 이름이 같은 파라미터로 들어가는가.
        return session.insert(namespace + "insertCustomer", customerDto);
    }

//  회원가입: 유호성 검사
    @Override
    public CustomerDto selectCustomer(String cu_id) {
        return session.selectOne(namespace + "selectCustomer", cu_id);
    }

//    로그인
    @Override
    public CustomerLoginDto selectLogin(Map map){
        return session.selectOne(namespace + "selectLogin", map);
    }

//    해당 id가 가지고 있는 닉네임 가져오기
    @Override
    public String customerName(String cu_id) { return session.selectOne(namespace + "customerName", cu_id); }

//    전부 지우기
    @Override
    public int delectAll() {
        return session.delete(namespace + "deleteAll");
    }


}
