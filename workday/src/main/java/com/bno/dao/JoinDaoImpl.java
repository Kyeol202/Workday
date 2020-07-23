package com.bno.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bno.dto.BoardPager;
import com.bno.dto.JoinDto;

@Repository
public class JoinDaoImpl implements JoinDao{
	
	@Autowired
	private SqlSessionTemplate session;
	
	private String queryprefix = "Join.";

	@Override
	public List<JoinDto> selectGtoAllList(BoardPager boardPager) {

		List<JoinDto> selectGtoAllList = new ArrayList<JoinDto>();
		System.out.println("dao 접근 = "+selectGtoAllList.toString());
		
		selectGtoAllList = session.selectList(queryprefix+"selectGtoAllList", boardPager);
		
		return selectGtoAllList;
	}
	
	
	
	
}//class end
