package com.bitstudy.app.dao;

import com.bitstudy.app.domain.ProductDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.*;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CategoryDaoImplTest {

    @Autowired
    CategoryDao categoryDao;

    @Test
    public void categoryList() {
        List<ProductDto> list = categoryDao.categoryList("의류");
        assertTrue(list.size() == 499);
    }

    @Test
    public void categoryCount() {
        int rowCount = categoryDao.categoryCount("의류");
        assertTrue(rowCount == 499);
    }

    @Test
    public void categoryMinPriceList() {
        List<ProductDto> list = categoryDao.categoryMinPriceList("의류");
        assertTrue(list.get(0).getPro_seqno() == 405);
    }

    @Test
    public void categoryMaxPriceList() {
        List<ProductDto> list = categoryDao.categoryMaxPriceList("의류");
        assertTrue(list.get(0).getPro_seqno() == 332);
    }

    @Test
    public void categoryRegDateList() {
        List<ProductDto> list = categoryDao.categoryRegDateList("의류");
        assertTrue(list.get(0).getPro_seqno() == 1);
    }

    @Test
    public void categoryMaxPrice() {
        int rowCount = categoryDao.categoryMaxPrice("의류");
        assertTrue(rowCount == 12345678);
    }

    @Test
    public void categoryMinPrice() {
        int rowCount = categoryDao.categoryMinPrice("의류");
        assertTrue(rowCount == 2000);
    }

    @Test
    public void categoryAvgPrice() {
        int rowCount = categoryDao.categoryAvgPrice("의류");
        assertTrue(rowCount == 127274);
    }

    @Test
    public void categoryPagination() {
        Map map = new HashMap();
        map.put("offset", 1);
        map.put("pageSize", 35);
        map.put("pro_category", "의류");

        List<ProductDto> list = categoryDao.categoryPagination(map);

        assertTrue( list.get(0).getPro_seqno() == 442);

    }



}





















