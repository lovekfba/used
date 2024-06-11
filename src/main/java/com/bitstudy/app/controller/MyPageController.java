package com.bitstudy.app.controller;


import com.bitstudy.app.service.MyPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;


@Controller
public class MyPageController {

    @Autowired
    MyPageService myPageService;

    @GetMapping("/mypage")
    public String mypage() {

        return "mypageForm";
    }

    @GetMapping("/mypageRemove")
    public String mypageDrop(HttpSession session) {

        String cu_id = String.valueOf(session.getAttribute("cu_id"));
        myPageService.deleteCustomer(cu_id);

        session.invalidate();

        return "/";
    }



}
