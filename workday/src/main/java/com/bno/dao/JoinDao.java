package com.bno.dao;

import java.util.List;

import com.bno.dto.BoardPager;
import com.bno.dto.JoinDto;

public interface JoinDao {
	
	public List<JoinDto> selectGtoAllList(BoardPager boardPager);
	
	
	
	
}//inter end
