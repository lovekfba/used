package com.bitstudy.app.controller;

import com.bitstudy.app.domain.CustomerDto;
import com.bitstudy.app.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.net.http.HttpRequest;


@Controller
public class registerController {
    @Autowired
    CustomerService customerService;

    String msg;

    @GetMapping("/register/join")
    public String registerForm() {


        return "registerForm";
    }

    @PostMapping("/register/save")
    public String customerSave(CustomerDto customerDto) throws UnsupportedEncodingException {
        System.out.println("customerDto : " + customerDto);

//  유호성 검사. 받은 customerDto의 id가 DB에서 null이 아니라면 사용자가 적은 아이디가 존재한다는 뜻이니
        if(customerService.registerChk(customerDto.getCu_id().trim()) != null) {
            String msg = URLEncoder.encode("이미 사용중인 아이디 입니다.", "UTF-8");
            return "redirect:/register/join?msg="+msg;
        }

//        if(registerChk(customerDto)) {
//            return "redirect:/register/join?msg="+msg;
//        }
        // request로 받은 년, 월, 일을 customerDto의 cu_birth에 저장시킨다.
        customerDto.setCu_birth(customerDto.getCu_year()+"-"+customerDto.getCu_month()+"-"+customerDto.getCu_day());

        // 저장
        customerService.register(customerDto);

        return "redirect:/login";
    }

//    // 아이디 중복확인 버튼 만들어서 검사시킬거임
//    @PostMapping("/register/chk")
//    public boolean registerChk(CustomerDto customerDto) throws UnsupportedEncodingException {
//        if(customerService.registerChk(customerDto.getCu_id()) != null){
//            msg = URLEncoder.encode("이미 사용중인 아이디 입니다.", "UTF-8");
//            return true;
//        }
//        msg = "";
//        return false;
//    }
}
