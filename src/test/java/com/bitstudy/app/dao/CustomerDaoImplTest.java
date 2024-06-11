package com.bitstudy.app.dao;

import com.bitstudy.app.domain.CustomerDto;
import com.bitstudy.app.domain.CustomerLoginDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.Map;

import static org.junit.Assert.*;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CustomerDaoImplTest {
    @Autowired
    CustomerDao customerDao;

    @Test
    public void delectAll() {
        int rowCount = customerDao.delectAll();
    }


    @Test
    public void insertCustomer() {
        delectAll();

        CustomerDto customerDto = new CustomerDto( "asdf", "1234", "전우치", "010-2345-6543", "wjs@naver.com", "1560","06","21", "남자");

        int rowCount = customerDao.insertCustomer(customerDto);

        assertTrue(rowCount == 1);
    }

    @Test
    public void selectCustomer() {
        delectAll();

        CustomerDto customerDto = new CustomerDto( "asdf", "1234", "전우치", "010-2345-6543", "wjs@naver.com", "1560","06","21", "남자");

        customerDao.insertCustomer(customerDto);
System.out.println(customerDto);

        CustomerDto ttt = customerDao.selectCustomer("asdf");

        assertTrue(ttt.getCu_seqno() == 1);
    }

    @Test
    public void selectLogin() {
        delectAll();

        CustomerDto customerDto = new CustomerDto( "asdf", "1234", "전우치", "010-2345-6543", "wjs@naver.com", "1560","06","21", "남자");
System.out.println("111111111111");
        customerDao.insertCustomer(customerDto);

        Map map = new HashMap();
        map.put("cu_id", "asdf");
        map.put("cu_pw", "1234");

        CustomerLoginDto ttt = customerDao.selectLogin(map);
System.out.println("222222222222222");
        assertTrue(true);

    }

}