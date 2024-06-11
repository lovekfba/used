package com.bitstudy.app.dao;

import com.bitstudy.app.domain.ProductDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;


@Repository
public class CategoryDaoImpl implements CategoryDao {
    @Autowired
    SqlSession session;

    String namespace="com.bitstudy.app.dao.CategoryMapper.";

//    카테고리에 해당하는 상품들을 페이지에 전시
    @Override
    public List<ProductDto> categoryList(String pro_category) {
        return session.selectList(namespace + "categoryList", pro_category);
    }

// category별 상품의 총 개수 구하기
    public Integer categoryCount(String pro_category) {
        return session.selectOne(namespace + "categoryCount", pro_category);
    }

// 카테고리: 높은 가격순
    @Override
    public List<ProductDto> categoryMaxPriceList(String pro_category) {
        return session.selectList(namespace + "categoryMaxPriceList", pro_category);
    }

// 카테고리: 낮은 가격순
    @Override
    public List<ProductDto> categoryMinPriceList(String pro_category) {
        return session.selectList(namespace + "categoryMinPriceList", pro_category);
    }

// 카테고리: 최신순
    @Override
    public List<ProductDto> categoryRegDateList(String pro_category) {
        return session.selectList(namespace + "categoryRegDateList", pro_category);
    }

// 카테고리별: 상품들의 가장 높은 가격을 뽑아오기
    @Override
    public int categoryMaxPrice(String pro_category) {
        return session.selectOne(namespace + "categoryMaxPrice", pro_category);
    }

// 카테고리별: 상품들의 가장 낮은 가격을 뽑아오기
    @Override
    public int categoryMinPrice(String pro_category) {
        return session.selectOne(namespace + "categoryMinPrice", pro_category);
    }

// 카테고리별: 상품들의 평균 가격을 뽑아오기
    @Override
    public int categoryAvgPrice(String pro_category) {
        return session.selectOne(namespace + "categoryAvgPrice", pro_category);
    }

// 카테고리 페이지네이션 작업 명령어다. map에는 pro_category와 offset, pageSize가 들어간다.
    @Override
    public List<ProductDto> categoryPagination(Map map) {
        return session.selectList(namespace + "categoryPagination", map);
    }

/*

// 카테고리 가격범위내의 상품을 가지고오는 작업을 한다. map 안에는 pro_category와 가격의 시작점 pro_main_price, 범위의 끝 지점 pro_max_price 가 담겨있어야 한다.
    @Override
    public List<ProductDto> categoryPriceArea(Map map) {
        return session.selectList(namespace + "categoryPriceArea", map);
    }

// 카테고리 상품들 안에 내가 원하는 지역안에 있는 상품들을 가지고 오는 작업을 한다. map 안에는 pro_category와 pro_area가 들어가 있어야 한다.
    @Override
    public List<ProductDto> categoryArea(Map map) {
        return session.selectList(namespace + "categoryArea", map);
    }

*/
}
