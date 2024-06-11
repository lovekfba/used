package com.bitstudy.app.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class ProductDto {

    private Integer pro_seqno;
    private String FK_cu_id;
    private String pro_consumer_id;
    private String pro_title;
    private String pro_img;
    private Integer pro_price;
    private String pro_area;
    private Integer pro_sold_out;
    private String pro_info;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date pro_reg_date;
    private Date pro_sale_date;
    private String pro_category;

    public ProductDto() {
    }

    public ProductDto(String pro_title, String pro_img, Integer pro_price, String pro_area, String pro_info, String pro_category) {
        this.pro_title = pro_title;
        this.pro_img = pro_img;
        this.pro_price = pro_price;
        this.pro_area = pro_area;
        this.pro_info = pro_info;
        this.pro_category = pro_category;
    }

    public ProductDto(String FK_cu_id, String pro_title, String pro_img, Integer pro_price, String pro_area, String pro_info, String pro_category) {
        this.FK_cu_id = FK_cu_id;
        this.pro_title = pro_title;
        this.pro_img = pro_img;
        this.pro_price = pro_price;
        this.pro_area = pro_area;
        this.pro_info = pro_info;
        this.pro_category = pro_category;
    }

    public Integer getPro_seqno() {
        return pro_seqno;
    }

    public void setPro_seqno(Integer pro_seqno) {
        this.pro_seqno = pro_seqno;
    }

    public String getFK_cu_id() {
        return FK_cu_id;
    }

    public void setFK_cu_id(String FK_cu_id) {
        this.FK_cu_id = FK_cu_id;
    }

    public String getPro_consumer_id() {
        return pro_consumer_id;
    }

    public void setPro_consumer_id(String pro_consumer_id) {
        this.pro_consumer_id = pro_consumer_id;
    }

    public String getPro_title() {
        return pro_title;
    }

    public void setPro_title(String pro_title) {
        this.pro_title = pro_title;
    }

    public String getPro_img() {
        return pro_img;
    }

    public void setPro_img(String pro_img) {
        this.pro_img = pro_img;
    }

    public Integer getPro_price() {
        return pro_price;
    }

    public void setPro_price(Integer pro_price) {
        this.pro_price = pro_price;
    }

    public String getPro_area() {
        return pro_area;
    }

    public void setPro_area(String pro_area) {
        this.pro_area = pro_area;
    }

    public Integer getPro_sold_out() {
        return pro_sold_out;
    }

    public void setPro_sold_out(Integer pro_sold_out) {
        this.pro_sold_out = pro_sold_out;
    }

    public String getPro_info() {
        return pro_info;
    }

    public void setPro_info(String pro_info) {
        this.pro_info = pro_info;
    }

    public Date getPro_reg_date() {
        return pro_reg_date;
    }

    public void setPro_reg_date(Date pro_reg_date) {
        this.pro_reg_date = pro_reg_date;
    }

    public Date getPro_sale_date() {
        return pro_sale_date;
    }

    public void setPro_sale_date(Date pro_sale_date) {
        this.pro_sale_date = pro_sale_date;
    }

    public String getPro_category() {
        return pro_category;
    }

    public void setPro_category(String pro_category) {
        this.pro_category = pro_category;
    }

    @Override
    public String toString() {
        return "ProductDTO{" +
                "pro_seqno=" + pro_seqno +
                ", FK_cu_id='" + FK_cu_id + '\'' +
                ", pro_consumer_id='" + pro_consumer_id + '\'' +
                ", pro_title='" + pro_title + '\'' +
                ", pro_img='" + pro_img + '\'' +
                ", pro_price=" + pro_price +
                ", pro_area='" + pro_area + '\'' +
                ", pro_sold_out=" + pro_sold_out +
                ", pro_info='" + pro_info + '\'' +
                ", pro_reg_date=" + pro_reg_date +
                ", pro_sale_date=" + pro_sale_date +
                ", pro_category='" + pro_category + '\'' +
                '}';
    }
}
