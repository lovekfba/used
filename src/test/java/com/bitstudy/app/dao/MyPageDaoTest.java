package com.bitstudy.app.dao;

import com.bitstudy.app.domain.CustomerDto;
import com.bitstudy.app.domain.MyPageDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class MyPageDaoTest {
    @Autowired
    MyPageDao myPageDao;
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
    public void delectCustomer() {
        MyPageDto myPageDto = new MyPageDto("asdf");

        int rowCount = myPageDao.deleteCustomer(myPageDto.getCu_id());

    }
}