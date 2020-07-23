package com.bno.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bno.dao.JoinDao;
import com.bno.dto.BoardPager;
import com.bno.dto.JoinDto;
import com.bno.dto.SearchDto;

@Service
public class JoinServiceImpl implements JoinService {
	
	@Autowired
	JoinDao dao;

	@Override
	public List<JoinDto> selectGtoAllList(BoardPager boardPager) {

		return dao.selectGtoAllList(boardPager);
	}
	
	//레코드 총 갯수 가져오기
	@Override
	public int selectuserGtoCount(SearchDto searchDto) {
		
		return dao.selectuserGtoCount(searchDto);
	}
	
	
	
	
}//class end
