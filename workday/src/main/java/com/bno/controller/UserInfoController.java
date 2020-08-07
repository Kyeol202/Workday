package com.bno.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bno.dto.UserInfo;
import com.bno.service.UserInfoService;

@Controller
public class UserInfoController {
	
	private static Logger logger = LoggerFactory.getLogger(UserInfoController.class);
	
	@Autowired
	private UserInfoService service;
	
	
	//사용자 홈 화면
	@RequestMapping(value = "userHome")
	public String userHome(Model model, HttpSession session) {
		logger.info("this is userHome method");

		return "user/userHome";
	}
	
	//사용자 로그인 화면
	@RequestMapping(value = "user/userlogin")
	public String userlogin(Model model) {
		logger.info("this is userlogin method");
		
		
		
		return "user/user_login";
	}
	
	//사용자 로그인
	@RequestMapping(value = "user/userloginEnd")
	public String userloginEnd(Model model, UserInfo user, HttpSession session) {
		logger.info("this is a userloginEnd method");
		
		UserInfo result = service.userSelectOne(user);
		String path = "";
		
		if(result !=null) {
			if(user.getU_pwd().equals(result.getU_pwd())) {
				path = "redirect:/userHome";
				
				session.setAttribute("loginUser", result);
				
			}
		}
		
		return path;
	}
	
	//로그아웃
	@RequestMapping(value = "user/userlogout")
	public String userlogOut(HttpSession session) {
		
		logger.info("this is a userlogOut method");
		if(session.getAttribute("loginUser") !=null) {
			session.removeAttribute("loginUser");
		}
		
		return "redirect:/userHome";
	}
	
	//사용자 등록 화면
	@RequestMapping(value ="user/userSignUp")
	public String userSignUp() {
		
		return "user/user_SignUp";
	}
	
	//이메일 중복체크
	@RequestMapping(value = "user/emailCheck")
	public String emailCheck(@RequestParam("u_email") String u_email) {
		
		int result = service.emailCheck(u_email);
		String msg;
		if(result > 0) {
			msg = "1";
		}
		else msg = "0";
		
		return msg;
	}

	
	//사용자 등록
	@RequestMapping(value = "user/userSignUpResult")
	public String userSignUpResult(UserInfo user) {
		logger.info("this is a userSignUpResult method");
		
		service.userInsert(user);
		
		return "redirect:/user/userSignUp";
	}
	
	
	
	
}//class end
