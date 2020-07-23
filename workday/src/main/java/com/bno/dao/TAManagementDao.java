package com.bno.dao;

import java.util.HashMap;
import java.util.List;

import com.bno.dto.BoardPager;
import com.bno.dto.SearchDto;
import com.bno.dto.TAManagement;

public interface TAManagementDao {
		
	//출근시간 입력
	public void insertGto(TAManagement dto);
	
	//전체 조회
	public List<TAManagement> selectGtoAllList(BoardPager boardPager);
	
	
	//레코드 총 갯수 가져오기
	public int selectuserGtoCount(SearchDto searchDto);

	
}//inter end
