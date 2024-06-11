package com.bitstudy.app.domain;

public class CustomerLoginDto {
    private String cu_id;
    private String cu_pw;
    private String cu_name;
    private boolean rememberId;


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

    public boolean isRememberId() {
        return rememberId;
    }

    public void setRememberId(boolean rememberId) {
        this.rememberId = rememberId;
    }

    @Override
    public String toString() {
        return "CustomerLoginDto{" +
                "cu_id='" + cu_id + '\'' +
                ", cu_pw='" + cu_pw + '\'' +
                ", cu_name='" + cu_name + '\'' +
                ", rememberId=" + rememberId +
                '}';
    }
}
