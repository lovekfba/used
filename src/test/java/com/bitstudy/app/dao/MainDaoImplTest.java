package com.bitstudy.app.dao;

import com.bitstudy.app.domain.ProductDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.*;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class MainDaoImplTest {
    @Autowired
    MainDao mainDao;


    @Test
    public void mainList() {
//        ArrayList<ProductDto> pro_list = new ArrayList<>();
//        pro_list.add(mainDao.mainList("의류"));
//        mainDao.mainList("의류");
//        assertTrue(pro_list.get(1).getPro_price() == 120000);


        List<ProductDto> list = mainDao.mainList("의류");

        System.out.println(list);

        assertTrue(list.size() == 30);
    }
}