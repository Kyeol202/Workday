package com.bno.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bno.dto.WorkRecord;

@Repository
public class WorkRecordDaoImpl implements WorkRecordDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	private String queryprefix = "WorkRecord.";
	
	
	//사용자 출근 입력
	@Override
	public void userWorkIn(WorkRecord dto) {
		
		System.out.println("사용자 정보 = "+dto);
		session.insert(queryprefix+"userWorkIn", dto);
	}
	
	
	
	
	
}//class end
