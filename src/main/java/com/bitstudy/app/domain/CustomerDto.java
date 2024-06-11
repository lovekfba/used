package com.bitstudy.app.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class CustomerDto {
    private Integer cu_seqno;
    private String cu_id;
    private String cu_pw;
    private String cu_name;
    private String cu_phone;
    private String cu_email;
    private String cu_year;
    private String cu_month;
    private String cu_day;
    private String cu_birth;
    private String cu_gender;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date reg_date;

    public CustomerDto() {
        this("","","","","","","","","");
    }

    public CustomerDto(String cu_id, String cu_pw, String cu_name, String cu_phone, String cu_email, String cu_year, String cu_month, String cu_day ) {
        this.cu_id = cu_id;
        this.cu_pw = cu_pw;
        this.cu_name = cu_name;
        this.cu_phone = cu_phone;
        this.cu_email = cu_email;
        this.cu_year = cu_year;
        this.cu_month = cu_month;
        this.cu_day = cu_day;

        this.cu_birth= cu_year+"-"+cu_month+"-"+cu_day;
    }
    public CustomerDto(String cu_id, String cu_pw, String cu_name, String cu_phone, String cu_email, String cu_year, String cu_month, String cu_day, String cu_gender) {
        this.cu_id = cu_id;
        this.cu_pw = cu_pw;
        this.cu_name = cu_name;
        this.cu_phone = cu_phone;
        this.cu_email = cu_email;
        this.cu_year = cu_year;
        this.cu_month = cu_month;
        this.cu_day = cu_day;
        this.cu_gender = cu_gender;

        this.cu_birth= cu_year+"-"+cu_month+"-"+cu_day;
    }

    public Integer getCu_seqno() {
        return cu_seqno;
    }

    public void setCu_seqno(Integer cu_seqno) {
        this.cu_seqno = cu_seqno;
    }

    public String getCu_id() {
        return cu_id;
    }

    public void setCu_id(String cu_id) {
        this.cu_id = cu_id;
    }

    public String getCu_pw() {
        return cu_pw;
    }

    public void setCu_pw(String cu_pw) {
        this.cu_pw = cu_pw;
    }

    public String getCu_name() {
        return cu_name;
    }

    public void setCu_name(String cu_name) {
        this.cu_name = cu_name;
    }

    public String getCu_phone() {
        return cu_phone;
    }

    public void setCu_phone(String cu_phone) {
        this.cu_phone = cu_phone;
    }

    public String getCu_email() {
        return cu_email;
    }

    public void setCu_email(String cu_email) {
        this.cu_email = cu_email;
    }

    public String getCu_year() {
        return cu_year;
    }

    public void setCu_year(String cu_year) {
        this.cu_year = cu_year;
    }

    public String getCu_month() {
        return cu_month;
    }

    public void setCu_month(String cu_month) {
        this.cu_month = cu_month;
    }

    public String getCu_day() {
        return cu_day;
    }

    public void setCu_day(String cu_day) {
        this.cu_day = cu_day;
    }

    public String getCu_birth() {
        return cu_birth;
    }

    public void setCu_birth(String cu_birth) {
        this.cu_birth = cu_birth;
    }

    public String getCu_gender() {
        return cu_gender;
    }

    public void setCu_gender(String cu_gender) {
        this.cu_gender = cu_gender;
    }

    public Date getReg_date() {
        return reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }

    @Override
    public String toString() {
        return "CustomerDto{" +
                "cu_seqno=" + cu_seqno +
                ", cu_id='" + cu_id + '\'' +
                ", cu_pw='" + cu_pw + '\'' +
                ", cu_name='" + cu_name + '\'' +
                ", cu_phone='" + cu_phone + '\'' +
                ", cu_email='" + cu_email + '\'' +
                ", cu_year='" + cu_year + '\'' +
                ", cu_month='" + cu_month + '\'' +
                ", cu_day='" + cu_day + '\'' +
                ", cu_birth='" + cu_birth + '\'' +
                ", cu_gender='" + cu_gender + '\'' +
                ", reg_date=" + reg_date +
                '}';
    }
}
