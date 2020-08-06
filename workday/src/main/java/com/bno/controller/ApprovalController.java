package com.bno.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.bno.service.ApprovalService;

@Controller
public class ApprovalController {
	
	private static Logger logger = LoggerFactory.getLogger(ApprovalController.class);
	
	@Autowired
	private ApprovalService service;
	
	
	
	
	
	
}//class end
