package com.bno.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bno.dto.UserInfo;
import com.bno.service.UserInfoService;

@Controller
public class UserInfoController {
	
	private static Logger logger = LoggerFactory.getLogger(UserInfoController.class);
	
	@Autowired
	private UserInfoService service;
	
	@RequestMapping(value = "userHome")
	public String userHome(Model model, HttpSession session) {
		logger.info("this is userHome method");
		
		
		
		
		return "user/userHome";
	}
	
	
	
	
}//class end
