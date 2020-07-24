package com.bno.service;

import java.util.HashMap;
import java.util.List;

import com.bno.dto.BoardPager;
import com.bno.dto.JoinDto;
import com.bno.dto.SearchDto;
import com.bno.dto.TAManagement;

public interface TAManagementService {
	
	//출근시간 입력
	public void insertGto(TAManagement dto);
	

	//출근 전체 조회 출력
	public List<JoinDto>  selectGtoAllList(BoardPager boardPager);
	
	//출근 레코드 전체 갯수 가져오기
	public int selectuserGtoCount(SearchDto searchDto);

	//퇴근시간 (update)
	public void owUpdate(HashMap<String, String> paramMap);
	
	//퇴근 전체 조회 출력
	public List<JoinDto>  selectOwAllList(BoardPager boardPager);
	
	//퇴근 레코드 전체 갯수 가져오기
	public int selectuserOwCount(SearchDto searchDto);
	
}//inter end
