package com.bno.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	
	
	@RequestMapping(value = "/userHome")
	public String userHome(Model model) {

		return "user/userHome";
	}
	
	
	@RequestMapping(value = "user/userSignUp")
	public String userSignUp(Model model) {
		
		
		
		return "user/userSignUp";
	}//회원가입
	
	
	
}
//class end