package com.bitstudy.app.controller;

import com.bitstudy.app.domain.CustomerLoginDto;
import com.bitstudy.app.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;


@Controller
public class LoginController {
    @Autowired
    CustomerService customerService;

    @GetMapping("/login")
    public String loginForm() {
        return "loginForm";
    }


    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }


    @PostMapping("/login")
    public String login(CustomerLoginDto customerLoginDto, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

        // 유호성 검사 - 서버에 현재 받은 id, pw 가 있는지 확인
        String cu_id = customerLoginDto.getCu_id();
        String cu_pw = customerLoginDto.getCu_pw();
        boolean rememberId = customerLoginDto.isRememberId();

        if(!loginChk(cu_id, cu_pw)) {
            String msg = URLEncoder.encode("일치하는 회원정보가 없습니다.", "UTF-8");
            return "redirect:/login?msg=" + msg;
        }

        // 쿠키 생성
        Cookie cookie = new Cookie("cu_id", cu_id);
        if(!rememberId) { // '아이디 기억' 체크 안했을 때
            cookie.setMaxAge(0);
        }
        response.addCookie(cookie); // 사용자에게 보내기

        // 세션 생성하기
        HttpSession session = request.getSession();
        session.setAttribute("cu_id", cu_id);

        // 아이디에 해당하는 닉네임 만들기
        String cu_name =  customerService.Nickname(String.valueOf(session.getAttribute("cu_id")));
        session.setAttribute("cu_name", cu_name);

        return "redirect:/";
    }



//     ID, PW 보내서 해당 정보가 있냐 없냐 판별
    private boolean loginChk(String cu_id, String cu_pw) {
        Map map = new HashMap();
        map.put("cu_id", cu_id);
        map.put("cu_pw", cu_pw);

        CustomerLoginDto customerLoginDto = customerService.login(map);

        if(customerLoginDto == null) return false;

        return true;
    }
}
