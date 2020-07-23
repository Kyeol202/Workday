package com.bno.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bno.dto.BoardPager;
import com.bno.dto.JoinDto;
import com.bno.dto.SearchDto;

@Repository
public class JoinDaoImpl implements JoinDao{
	
	@Autowired
	private SqlSessionTemplate session;
	
	private String queryprefix = "Join.";
	
	//출근 전체 목록 조회
	@Override
	public List<JoinDto> selectGtoAllList(BoardPager boardPager) {

		List<JoinDto> selectGtoAllList = new ArrayList<JoinDto>();
		System.out.println("dao 접근 = "+selectGtoAllList.toString());
		
		selectGtoAllList = session.selectList(queryprefix+"selectGtoAllList", boardPager);
		
		return selectGtoAllList;
	}
	
	
	//레코드 총 갯수 가져오기
	@Override
	public int selectuserGtoCount(SearchDto searchDto) {
				
		return session.selectOne(queryprefix+"selectuserGtoCount", searchDto);
	}
	
	
}//class end
