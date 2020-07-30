package com.bno.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bno.dto.UserInfo;
import com.bno.service.UserService;

@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService service;
	
	
	@RequestMapping(value = "/userHome")
	public String userHome(Model model) {
			logger.info("this is a userHome Method");
		
		
		return "user/userHome";
	}
	
	//회원가입
	@RequestMapping(value = "user/userSignUp")
	public String userSignUp(Model model) {
			logger.info("this is a userSignUp Method");
			
		
		
		return "user/userSignUp";
	}
	
	//회원가입 결과
	@RequestMapping(value = "user/userSignUpResult")
	public String userSignUpResult(UserInfo user) throws Exception {
		
		service.insertUser(user);
		
		return "redirect:/user/userlogin";
	}
	
	//로그인 페이지
	@RequestMapping(value = "user/userlogin")
	public String userlogin() {
			logger.info("this is a userlogin Method");
		
			
			return "user/userlogin";
		
	}
	//이메일 중복체크
	@RequestMapping(value = "/user/idcheck", method = RequestMethod.GET)
	public String idcheck(@RequestParam("u_eamil") String u_email) throws Exception {
		
		int result = service.idcheck(u_email);
		String msg;
		if(result > 0) {
			msg = "1";
		} else {
			msg = "0";
		}
		
	return msg;	
	}
	
	//로그인 확인 후 Home페이지
	@RequestMapping(value = "user/userloginEnd")
	public String userloginEnd(Model model, UserInfo user, HttpSession session) {
		logger.info("this is a userloginEnd Method");
		
		UserInfo result = service.userSelectOne(user);
		
		String path = "";
		if(result != null) {
			if(user.getU_pwd().equals(result.getU_pwd())) {
				path = "redirect:/userHome";
				
				session.setAttribute("loginUser", result);
				session.setMaxInactiveInterval(1440*60);
			} 

		}
		
		return path;
	}
	
	//로그아웃
	@RequestMapping(value = "user/userlogout")
	public String userlogout(HttpSession session) {
			logger.info("this is a userlogout Method");
			
			if(session.getAttribute("loginUser")!=null) {
				session.removeAttribute("loginUser");
			}
		
		return "redirect:/userHome";
	}
	
	
	
}//class end