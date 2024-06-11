package com.bitstudy.app.service;

import com.bitstudy.app.dao.CategoryDao;
import com.bitstudy.app.domain.ProductDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    CategoryDao categoryDao;

//   카테고리 페이지당 맞는 카테고리를 가진 상품들을 모두 전시한다.
    @Override
    public List<ProductDto> catePageList(String pro_category) {
        return categoryDao.categoryList(pro_category);
    }

//    카테고리별로 전시된 상품들의 총 개수를 구한다.
    @Override
    public int cate_product_count(String pro_category) {
        return categoryDao.categoryCount(pro_category);
    }

//    카테고리: 높은 가격순 list
    @Override
    public List<ProductDto> cate_page_max_price_list(String pro_category) {
        return categoryDao.categoryMaxPriceList(pro_category);
    }

//    카테고리: 낮은 가격순 list
    @Override
    public List<ProductDto> cate_page_min_price_list(String pro_category) {
        return categoryDao.categoryMinPriceList(pro_category);
    }

//    카테고리: 최신순 list
    @Override
    public List<ProductDto> cate_page_reg_date_list(String pro_category) {
        return categoryDao.categoryRegDateList(pro_category);
    }

//    카테고리: 상품중 가장 높은 가격 가져오기
    @Override
    public int cate_page_max_price(String pro_category) {
        return categoryDao.categoryMaxPrice(pro_category);
    }

//    카테고리: 상품중 가장 낮은 가격 가져오기
    @Override
    public int cate_page_min_price(String pro_category) {
        return categoryDao.categoryMinPrice(pro_category);
    }

//    카테고리: 상품들 평균 가격 가져오기
    @Override
    public int cate_page_avg_price(String pro_category) {
        return categoryDao.categoryAvgPrice(pro_category);
    }

    @Override
    public List<ProductDto> categoryPagination(Map map) { return  categoryDao.categoryPagination(map); }

}
