package com.bno.service;

import java.util.List;

import com.bno.dto.BoardPager;
import com.bno.dto.SearchDto;
import com.bno.dto.UserInfo;
import com.bno.dto.WorkRecord;

public interface WorkRecordService {
	
	//사용자 출근 입력
	public void userWorkIn(WorkRecord dto);
	
	//사용자 총 레코드 가져오기
	public int selectUserCount(SearchDto searchDto);
	
	//사용자 전체 조회
	public List<UserInfo> selectUserAllList(BoardPager boardPager);
	
	
}//interface end
