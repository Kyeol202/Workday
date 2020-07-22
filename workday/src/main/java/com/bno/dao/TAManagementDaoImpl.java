package com.bno.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bno.dto.TAManagement;

@Repository
public class TAManagementDaoImpl implements TAManagementDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	
	private String queryprefix = "TAManagement.";

	//출근시간 입력
	@Override
	public void insertGto(TAManagement dto) {
		System.out.println("출근시간 입력 ="+dto.toString());
		session.insert(queryprefix+"insertGto", dto);
		
	}
	
	
	
	
}//class end
