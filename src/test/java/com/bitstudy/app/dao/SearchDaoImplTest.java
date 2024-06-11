package com.bitstudy.app.dao;

import com.bitstudy.app.domain.ProductDto;
import com.bitstudy.app.domain.SearchDto;
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
public class SearchDaoImplTest {

    @Autowired
    SearchDao searchDao;

//    검색바
    @Test
    public void searchSelect() {
/*
    keyword = "미개봉"
    pro_min_price = 100
    pro_max_price = 20000000
    pro_area = null
    offset = 0
    pageSize = 35
*/
        SearchDto sc = new SearchDto("미개봉", null, 100, 20000, null ,0, 35);

        List<ProductDto> list = searchDao.searchSelect(sc);

        assertTrue(list.get(0).getPro_seqno() == 448);
    }

    @Test
    public void searchSelectCount() {
        SearchDto sc = new SearchDto("미개봉", null, 100, 20000000, null ,0, 35);

        int rowCount = searchDao.searchSelectCount(sc);


        assertTrue(rowCount == 247);
    }
    @Test
    public void searchSelectMinPrice(){
        SearchDto sc = new SearchDto("남자", null, 100, 20000000, null ,0, 35);

        int rowCount = searchDao.searchSelectMinPrice(sc);
        assertTrue(rowCount == 5000);
    }
    @Test
    public void searchSelectMaxPrice(){
        SearchDto sc = new SearchDto("미개봉", null, 100, 20000000, null ,0, 35);

        int rowCount = searchDao.searchSelectMaxPrice(sc);
        assertTrue(rowCount == 2200000);
    }
    @Test
    public void searchSelectAvgPrice(){
        SearchDto sc = new SearchDto("미개봉", null, 100, 20000000, null ,0, 35);

        int rowCount = searchDao.searchSelectAvgPrice(sc);
        assertTrue(rowCount == 124480);
    }




//    카테고리
    @Test
    public void categorySelect() {
        SearchDto sc = new SearchDto(null, "의류", 100, 20000000, null ,0, 35);

        List<ProductDto> list = searchDao.categorySelect(sc);
        assertTrue(list.get(0).getPro_seqno() == 1);
    }

    @Test
    public void categorySelectCount() {
        SearchDto sc = new SearchDto(null, "의류", 100, 20000000, null ,0, 35);

        int rowCount = searchDao.categorySelectCount(sc);

        assertTrue(rowCount == 499);
    }
    @Test
    public void categorySelectMinPrice() {
        SearchDto sc = new SearchDto(null, "의류", 100, 20000000, null ,0, 35);

        int rowCount = searchDao.categorySelectMinPrice(sc);

        assertTrue(rowCount == 2000);
    }
    @Test
    public void categorySelectMaxPrice() {
        SearchDto sc = new SearchDto(null, "의류", 100, 20000000, null ,0, 35);

        int rowCount = searchDao.categorySelectMaxPrice(sc);

        assertTrue(rowCount == 2000);
    }
    @Test
    public void categorySelectAvgPrice() {
        SearchDto sc = new SearchDto(null, "의류", 100, 20000000, null ,0, 35);

        int rowCount = searchDao.categorySelectAvgPrice(sc);

        assertTrue(rowCount == 127274);
    }
}