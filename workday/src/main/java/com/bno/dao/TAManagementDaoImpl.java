package com.bno.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TAManagementDaoImpl implements TAManagementDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	
	private String queryprefix = "TAManagement.";
	
	
	
	
}//class end
