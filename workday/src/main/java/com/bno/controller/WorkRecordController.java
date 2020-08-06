package com.bno.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bno.dto.WorkRecord;
import com.bno.service.WorkRecordService;

@Controller
public class WorkRecordController {
	
	private static Logger logger = LoggerFactory.getLogger(WorkRecordController.class);
	
	@Autowired
	private WorkRecordService service;
	
	
	
	//출근리스트화면
	@RequestMapping(value = "user/userWorkList")
	public String userWorkList() {
		
		
		
		return"work/userWorkList";
	}
	
	//사용자 출근
	@RequestMapping(value = "user/userWorkIn")
	public String userWorkIn(WorkRecord dto) {
		
		service.userWorkIn(dto);
		
		return "work/userWorkList";
	}
	
	//근태관리 리스트
	@RequestMapping(value = "user/userworkListAjax")
	public String userworkListAjax() {
		
		
		
		return "";
	}
	
	
	
}//class end
