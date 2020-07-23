package com.bno.dao;

import java.util.List;

import com.bno.dto.BoardPager;
import com.bno.dto.JoinDto;
import com.bno.dto.SearchDto;

public interface JoinDao {
	
	//출근 전체 목록 조회
	public List<JoinDto> selectGtoAllList(BoardPager boardPager);
	
	//레코드 전체 갯수 가져오기
	public int selectuserGtoCount(SearchDto searchDto);
	
	
}//inter end
