package com.bno.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bno.dao.JoinDao;
import com.bno.dto.BoardPager;
import com.bno.dto.JoinDto;

@Service
public class JoinServiceImpl implements JoinService {
	
	@Autowired
	JoinDao dao;

	@Override
	public List<JoinDto> selectGtoAllList(BoardPager boardPager) {

		return dao.selectGtoAllList(boardPager);
	}
	
	
	
	
	
	
}//class end
