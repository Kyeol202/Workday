package com.bno.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bno.service.TAManagementService;

@Controller
public class TAManagementController {
	
	@Autowired
	private TAManagementService service;
	
	
	@RequestMapping(value = "user/userGto")
	public String userGto() {
		
		
		
		return "work/userGto";
	}
	
	
	
	
	
	
}//class end
