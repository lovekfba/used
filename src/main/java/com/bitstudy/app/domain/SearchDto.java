package com.bitstudy.app.domain;

import java.util.Map;

public class SearchDto {
    private String keyword;
    private String pro_category;
    private Integer pro_min_price;
    private Integer pro_max_price;
    private String pro_area;
    private Integer offset;
    private Integer pageSize;

    public SearchDto() {}

    public SearchDto(String keyword, String pro_category, Integer pro_min_price, Integer pro_max_price, String pro_area, Integer offset, Integer pageSize) {
        this.keyword = keyword;
        this.pro_category = pro_category;
        this.pro_min_price = pro_min_price;
        this.pro_max_price = pro_max_price;
        this.pro_area = pro_area;
        this.offset = offset;
        this.pageSize = pageSize;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getPro_category() {
        return pro_category;
    }

    public void setPro_category(String pro_category) {
        this.pro_category = pro_category;
    }

    public Integer getPro_min_price() {
        return pro_min_price;
    }

    public void setPro_min_price(Integer pro_min_price) {
        this.pro_min_price = pro_min_price;
    }

    public Integer getPro_max_price() {
        return pro_max_price;
    }

    public void setPro_max_price(Integer pro_max_price) {
        this.pro_max_price = pro_max_price;
    }

    public String getPro_area() {
        return pro_area;
    }

    public void setPro_area(String pro_area) {
        this.pro_area = pro_area;
    }

    public Integer getOffset() {
        return offset;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    @Override
    public String toString() {
        return "SearchDto{" +
                "keyword='" + keyword + '\'' +
                ", pro_category='" + pro_category + '\'' +
                ", pro_min_price=" + pro_min_price +
                ", pro_max_price=" + pro_max_price +
                ", pro_area='" + pro_area + '\'' +
                ", offset=" + offset +
                ", pageSize=" + pageSize +
                '}';
    }
}
