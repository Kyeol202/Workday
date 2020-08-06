package com.bno.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bno.dto.BoardPager;
import com.bno.dto.SearchDto;
import com.bno.dto.UserInfo;
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

	//사용자 전체 레코드 갯수
	@Override
	public int selectUserCount(SearchDto searchDto) {
		
		return session.selectOne(queryprefix+"selectUserCount", searchDto);
	}

	//사용자 전체 조회
	@Override
	public List<UserInfo> selectUserAllList(BoardPager boardPager) {
		
		List<UserInfo> AllUserList = new ArrayList<UserInfo>();
		AllUserList = session.selectList(queryprefix+"selectUserAllList", boardPager);
		
		return AllUserList;
	}
	
	
	
	
	
}//class end
