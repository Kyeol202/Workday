package com.bno.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bno.dto.UserInfo;
import com.bno.dto.Approval;
import com.bno.service.ApprovalService;

@Controller
public class ApprovalController {
	
	private static Logger logger = LoggerFactory.getLogger(ApprovalController.class);
	
	@Autowired
	private ApprovalService service;
	
	
	//결재리스트화면
	@RequestMapping(value = "user/userStatus")
	public String userStatus() {
		
		
		
		return"work/userStatus";
	}
	
	//결재 정보 접수
	@RequestMapping(value = "user/approvalIn")
	public String userWorkIn(HttpSession session, Approval dto) {
	logger.info("this is a approvalIn method");
		UserInfo user = (UserInfo) session.getAttribute("loginUser");
		String path = "";
		
		if(user != null) {
			service.approvalIn(dto);
			path = "redirect:/user/userStatus";
		}
		else path = "redirect:/user/userlogin";
		
		
		
		return path;
	}
	
}//class end
