package com.bno.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bno.dto.TAManagement;
import com.bno.dto.UserInfo;
import com.bno.service.TAManagementService;

@Controller
public class TAManagementController {
	
	@Autowired
	private TAManagementService service;
	
	
	@RequestMapping(value = "user/userGto")
	public String userGto() {
		
		
		
		return "work/userGto";
	}
	
	@RequestMapping(value = "/user/userGtoCheck")
	public String userGtoCheck(@RequestParam int u_id, TAManagement dto,
			HttpSession session) {
		
		UserInfo user = (UserInfo) session.getAttribute("loginUser");
		String path = "";
		
		
		if(user != null) {
		
		 service.insertGto(dto);
		 path = "redirect:/user/userGto";
			
		} else {
			path = "redirect:/user/userlogin";
		}
		
		return path;
	}
	
	
	
	
	
	
}//class end
