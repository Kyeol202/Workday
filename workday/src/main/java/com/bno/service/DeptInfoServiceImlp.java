package com.bno.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bno.dao.DeptInfoDao;

@Service
public class DeptInfoServiceImlp implements DeptInfoService {
	
	@Autowired
	private DeptInfoDao dao;
	
	
	
	
	
}//class end
