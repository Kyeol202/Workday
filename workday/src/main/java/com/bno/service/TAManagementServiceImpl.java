package com.bno.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bno.dao.TAManagementDao;
import com.bno.dto.BoardPager;
import com.bno.dto.JoinDto;
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

	//출근 전체 목록 조회
	@Override
	public List<JoinDto> selectGtoAllList(BoardPager boardPager) {
		
		return dao.selectGtoAllList(boardPager);
	}

	//출근 레코드 총 갯수 가져오기
	@Override
	public int selectuserGtoCount(SearchDto searchDto) {
	
		return dao.selectuserGtoCount(searchDto);
	}
	
	
	//퇴근시간 (update)
	@Override
	public void owUpdate(int ta_id) {

		dao.owUpdate(ta_id);
	}
	
	//퇴근 전체 목록 조회
	@Override
	public List<JoinDto> selectOwAllList(BoardPager boardPager) {
		
		return dao.selectOwAllList(boardPager);
	}
	
	//퇴근 전체 레코드 가져오기
	@Override
	public int selectuserOwCount(SearchDto searchDto) {
		
		return dao.selectuserOwCount(searchDto);
	}
	
	//상세보기
	@Override
	public TAManagement userGtoOwSelectOne(int ta_id) {
		
		return dao.userGtoOwSelectOne(ta_id);
	}
	
	//근무시간
	@Override
	public TAManagement updateWorkingHour(int ta_id) {
		
		return dao.updateWorkingHour(ta_id);
	}
	
	
	//상태 수정
	@Override
	public void userStatusUpdate(TAManagement dto) {
		
		
		 dao.userStatusUpdate(dto); 
	}
	
	
	//관리자권한 출퇴근 관리 삭제
	@Override
	public void userGtoOwDelete(int ta_id) {
		
		dao.userGtoOwDelete(ta_id);
	}

	
	
	


	
	
	
	
}//class end
