package com.bno.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ApprovalImpl implements ApprovalDao {
	
	
	@Autowired
	private SqlSessionTemplate session;
	
	private String queryprefix = "Approval.";
	
	
	
	
	
}//class end
