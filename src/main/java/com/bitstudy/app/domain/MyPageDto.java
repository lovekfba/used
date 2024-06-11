package com.bitstudy.app.domain;

public class MyPageDto {

    private String cu_id; // 회원탈퇴 할때 쓸 id, select ... id 해서 그 id 제거해야함
    private String cu_pw; // 개인정보 수정. 아마도?
    private String cu_name; // 개인정보 수정(사용하는 닉네임). 아마도?
    private String cu_phone; // 개인정보 수정(휴대폰 번호). 아마도?
    private String cu_email; // 개인정보 수정(이메일). 아마도?

    public MyPageDto() {}

    public MyPageDto(String cu_id) {
        this.cu_id = cu_id;
    }

    // 마이페이지에서 개인정보 수정할때 쓸 생성자. 근데 CstomerDto에서 생성자 하나 더 만드는게 나은지
    // 분리해서 쓰는게 나은지 모르겠어.
    public MyPageDto(String cu_id, String cu_pw, String cu_name, String cu_phone, String cu_email) {
        this.cu_id = cu_id;
        this.cu_pw = cu_pw;
        this.cu_name = cu_name;
        this.cu_phone = cu_phone;
        this.cu_email = cu_email;
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

    @Override
    public String toString() {
        return "MyPageDto{" +
                "cu_id='" + cu_id + '\'' +
                ", cu_pw='" + cu_pw + '\'' +
                ", cu_name='" + cu_name + '\'' +
                ", cu_phone='" + cu_phone + '\'' +
                ", cu_email='" + cu_email + '\'' +
                '}';
    }
}
