package com.bno.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bno.dto.UserInfoDto;
import com.bno.service.UserInfoService;

@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserInfoService service;
	
	
	@RequestMapping(value = "/userHome")
	public String userHome(Model model) {
			logger.info("this is a userHome Method");
		
		
		return "user/userHome";
	}
	
	
	@RequestMapping(value = "user/userSignUp")
	public String userSignUp(Model model) {
			logger.info("this is a userSignUp Method");
			
		
		
		return "user/userSignUp";
	}//회원가입
	
	@RequestMapping(value = "user/userSignUpResult")
	public String userSignUpResult(UserInfoDto user) throws Exception {
		
		service.insertUser(user);
		
		return "redirect:/user/userlogin";
	}
	
	
	@RequestMapping(value = "user/userlogin")
	public String userlogin() {
			logger.info("this is a userlogin Method");
		return "user/userlogin";
		
	}
	
	
	
	
	
	
}//class end