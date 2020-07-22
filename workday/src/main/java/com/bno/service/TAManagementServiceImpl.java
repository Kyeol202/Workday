package com.bno.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bno.dao.TAManagementDao;
import com.bno.dto.BoardPager;
import com.bno.dto.SearchDto;
import com.bno.dto.TAManagement;

@Service
public class TAManagementServiceImpl implements TAManagementService {
	
	@Autowired
	private TAManagementDao dao;
	
	
	//출근시간 입력
	@Override
	public void insertGto(TAManagement dto) {
		
		dao.insertGto(dto);
	}

	//전체 조회
	@Override
	public List<TAManagement> selectAllGtoList(BoardPager boardPager) {
		
		
		
		return dao.selectAllGtoList(boardPager);
	}

	//레코드 총 갯수 가져오기
	@Override
	public int selectuserGtoCount(SearchDto searchDto) {
		
		return dao.selectuserGtoCount(searchDto);
	}


	
	
	
	
}//class end
