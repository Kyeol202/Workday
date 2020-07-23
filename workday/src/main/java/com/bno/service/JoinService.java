package com.bno.service;

import java.util.List;

import com.bno.dto.BoardPager;
import com.bno.dto.JoinDto;

public interface JoinService {
	
	public List<JoinDto> selectGtoAllList(BoardPager boardPager);
	
	
	
}//inter end
