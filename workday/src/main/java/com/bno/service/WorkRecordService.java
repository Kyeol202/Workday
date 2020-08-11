package com.bno.service;

import java.util.List;

import com.bno.dto.BoardPager;
import com.bno.dto.JoinDto;
import com.bno.dto.SearchDto;
import com.bno.dto.UserInfo;
import com.bno.dto.WorkRecord;

public interface WorkRecordService {
	
	//사용자 출근 입력
	public void userWorkIn(WorkRecord dto);
	
	//출퇴근 총 레코드 가져오기
	public int selectUserCount(SearchDto searchDto);
	
	//전체 출퇴근 조회
	public List<JoinDto> selectUserAllList(BoardPager boardPager);
	
	//상세조회
	public WorkRecord workRecordSelectOne(int w_id);
	
	//사용자 퇴근
	public void userWorkOut(int w_id);
	
	//사용자 근무시간
	public WorkRecord updateWTime(int w_id);
	
	//사용자 상태변경 및 조퇴사유
	public WorkRecord statusReasonUpdate(WorkRecord wDto);
	
	
}//interface end
