package com.bno.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bno.dao.TAManagementDao;
import com.bno.dto.TAManagement;

@Service
public class TAManagementServiceImpl implements TAManagementService {
	
	@Autowired
	private TAManagementDao dao;
	
	
	//출근시간 입력
	@Override
	public void insertGto(TAManagement dto) {
		
		dao.insertGto(dto);
	}
	
	
	
	
	
}//class end
