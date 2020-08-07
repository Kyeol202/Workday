package com.bno.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bno.dao.WorkRecordDao;
import com.bno.dto.BoardPager;
import com.bno.dto.JoinDto;
import com.bno.dto.SearchDto;
import com.bno.dto.WorkRecord;

@Service
public class WrokRecordServiceImpl implements WorkRecordService {
	
	
	@Autowired
	private WorkRecordDao dao;
	
	
	//사용자 출근 입력
	@Override
	public void userWorkIn(WorkRecord dto) {
		
		dao.userWorkIn(dto);
	}

	//출퇴근 전체 레코드 갯수
	@Override
	public int selectUserCount(SearchDto searchDto) {
		
		return dao.selectUserCount(searchDto);
	}

	//출퇴근 전체 리스트
	@Override
	public List<JoinDto> selectUserAllList(BoardPager boardPager) {
	
		return dao.selectUserAllList(boardPager);
	}
	
	
	
	
}//class end
