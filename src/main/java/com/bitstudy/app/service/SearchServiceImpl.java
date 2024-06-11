package com.bitstudy.app.service;

import com.bitstudy.app.dao.SearchDao;
import com.bitstudy.app.domain.ProductDto;
import com.bitstudy.app.domain.SearchDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class SearchServiceImpl implements SearchService {
    @Autowired
    SearchDao searchDao;

    @Override
    public List<ProductDto> searchSelect(SearchDto sc) {
        return searchDao.searchSelect(sc);
    }
    @Override
    public int searhSelectCount(SearchDto sc) {
        return searchDao.searchSelectCount(sc);
    }

    @Override
    public int searhSelectMinPrice(SearchDto sc) {
        return searchDao.searchSelectMinPrice(sc);
    }
    @Override
    public int searhSelectMaxPrice(SearchDto sc) {
        return searchDao.searchSelectMaxPrice(sc);
    }
    @Override
    public int searhSelectAvgPrice(SearchDto sc) {
        return searchDao.searchSelectAvgPrice(sc);
    }


    @Override
    public List<ProductDto> categorySelect(SearchDto sc) {
        System.out.println("asdfasdf: " + sc);
        return searchDao.categorySelect(sc);
    }
    @Override
    public int categorySelectCount(SearchDto sc) {
        return searchDao.categorySelectCount(sc);
    }

    @Override
    public int categorySelectMinPrice(SearchDto sc) {
        return searchDao.categorySelectMinPrice(sc);
    }
    @Override
    public int categorySelectMaxPrice(SearchDto sc) {
        return searchDao.categorySelectMaxPrice(sc);
    }
    @Override
    public int categorySelectAvgPrice(SearchDto sc) {
        return searchDao.categorySelectAvgPrice(sc);
    }

}
