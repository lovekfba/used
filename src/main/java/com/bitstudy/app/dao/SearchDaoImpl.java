package com.bitstudy.app.dao;

import com.bitstudy.app.domain.ProductDto;
import com.bitstudy.app.domain.SearchDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public class SearchDaoImpl implements SearchDao {
    @Autowired
    SqlSession session;

    String namespace = "com.bitstudy.app.dao.SearchMapper.";

//    header 검색바에서 검색했을 시, 그리고 그 안에서 가격 범위와 지역을 조회했을 시 사용하는 명령어
    @Override
    public List<ProductDto> searchSelect(SearchDto sc) {
        return session.selectList(namespace + "searchSelect", sc);
    }

//    위에 실행한 결과물로 나오는 상품의 개수
    @Override
    public int searchSelectCount(SearchDto sc) {
        return session.selectOne(namespace + "searchSelectCount", sc);
    }

//    search로 실행한 결과물들의 최소가격이다.
    @Override
    public int searchSelectMinPrice(SearchDto sc) { return session.selectOne(namespace + "searchSelectMinPrice", sc); }
//    search로 실행한 결과물들의 최대가격이다.
    @Override
    public int searchSelectMaxPrice(SearchDto sc) { return session.selectOne(namespace + "searchSelectMaxPrice", sc); }
//    search로 실행한 결과물들의 평균가격이다.
    @Override
    public int searchSelectAvgPrice(SearchDto sc) { return session.selectOne(namespace + "searchSelectAvgPrice", sc); }



//    category 페이지 내에서 가격의 범위와 지역을 조회했을시 사용하는 명령어
    @Override
    public List<ProductDto> categorySelect(SearchDto sc) {
        System.out.println("scscsc:" + sc);
        return session.selectList(namespace + "categorySelect", sc);
    }
//    위에 실행한 결과물로 나오는 상품의 개수
    @Override
    public int categorySelectCount(SearchDto sc) {
        return session.selectOne(namespace + "categorySelectCount", sc);
    }

    //    category 페이지 내에서 검색한 상품들의 최소 가격이다.
    @Override
    public int categorySelectMinPrice(SearchDto sc) {
        return session.selectOne(namespace + "categorySelectMinPrice", sc);
    }
    //    category 페이지 내에서 검색한 상품들의 최대 가격이다.
    @Override
    public int categorySelectMaxPrice(SearchDto sc) {
        return session.selectOne(namespace + "categorySelectMaxPrice", sc);
    }
    //    category 페이지 내에서 검색한 상품들의 평균 가격이다.
    @Override
    public int categorySelectAvgPrice(SearchDto sc) {
        return session.selectOne(namespace + "categorySelectAvgPrice", sc);
    }

}
