package com.bno.dao;

import java.util.List;

import com.bno.dto.BoardPager;
import com.bno.dto.JoinDto;
import com.bno.dto.SearchDto;
import com.bno.dto.WorkRecord;

public interface WorkRecordDao {
	
	//사용자 출근 입력
	public void userWorkIn(WorkRecord dto);
	
	//출퇴근 전체 레코드 갯수
	public int selectUserCount(SearchDto searchDto);
	
	//출퇴근 전체 조회
	public List<JoinDto> selectUserAllList(BoardPager boardPager);
	
	//사용자 상세보기
	public WorkRecord workRecordSelectOne(int w_id);
	
	//사용자 퇴근
	public void userWorkOut(int w_id);
	
	//사용자 근무시간 계산
	public WorkRecord updateWTime(int w_id);
	
}//interface end
