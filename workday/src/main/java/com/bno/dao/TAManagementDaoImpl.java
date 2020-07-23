package com.bno.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bno.dto.BoardPager;
import com.bno.dto.SearchDto;
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
	
	
	//레코드 총 갯수 가져오기
	@Override
	public int selectuserGtoCount(SearchDto searchDto) {
				
		return session.selectOne(queryprefix+"selectuserGtoCount", searchDto);
	}
	
	
	
	
}//class end
