package com.bno.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.bno.service.WorkRecordService;

@Controller
public class WorkRecordController {
	
	private static Logger logger = LoggerFactory.getLogger(WorkRecordController.class);
	
	@Autowired
	private WorkRecordService service;
	
	
	
	
	
}//class end
