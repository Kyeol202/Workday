package com.bno.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bno.dto.BoardPager;
import com.bno.dto.JoinDto;
import com.bno.dto.SearchDto;
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

	//출퇴근 전체 레코드 갯수
	@Override
	public int selectUserCount(SearchDto searchDto) {
		
		return session.selectOne(queryprefix+"selectUserCount", searchDto);
	}

	//출퇴근 전체 조회
	@Override
	public List<JoinDto> selectUserAllList(BoardPager boardPager) {
		
		List<JoinDto> AllUserList = new ArrayList<JoinDto>();
		AllUserList = session.selectList(queryprefix+"selectUserAllList", boardPager);
		System.out.println("전체 리스트 = "+AllUserList);
		return AllUserList;
	}
	
	
	
	
	
}//class end
