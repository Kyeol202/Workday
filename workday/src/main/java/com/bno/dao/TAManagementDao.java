package com.bno.dao;

import java.util.HashMap;
import java.util.List;

import com.bno.dto.BoardPager;
import com.bno.dto.JoinDto;
import com.bno.dto.SearchDto;
import com.bno.dto.TAManagement;

public interface TAManagementDao {
		
	//출근시간 입력
	public void insertGto(TAManagement dto);
	
	//출근 전체 조회
	public List<JoinDto> selectGtoAllList(BoardPager boardPager);
	
	
	//출근 레코드 총 갯수 가져오기
	public int selectuserGtoCount(SearchDto searchDto);

	//퇴근시간 (update)
	public void owUpdate(int ta_id);
	
	//퇴근 전체 조회
	public List<JoinDto> selectOwAllList(BoardPager boardPager);
	
	//퇴근 레코드 총 갯수 가져오기
	public int selectuserOwCount(SearchDto searchDto);
	
	//상세조회
	public TAManagement userGtoOwSelectOne(int ta_id);
	
	//근무시간
	public TAManagement updateWorkingHour(int ta_id);
	
	//상태 수정
	public void userStatusUpdate(int ta_id);
	
}//inter end
