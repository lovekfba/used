package com.bitstudy.app.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageDaoImpl implements MyPageDao {
    @Autowired
    SqlSession session;

    String namespace="com.bitstudy.app.dao.MyPageMapper.";

    @Override
    public int deleteCustomer(String cu_id) {
        return session.delete(namespace + "deleteCustomer", cu_id);
    }


}
