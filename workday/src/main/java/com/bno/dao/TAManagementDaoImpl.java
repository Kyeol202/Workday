package com.bno.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bno.dto.BoardPager;
import com.bno.dto.JoinDto;
import com.bno.dto.SearchDto;
import com.bno.dto.TAManagement;

@Repository
public class TAManagementDaoImpl implements TAManagementDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	
	private String queryprefix = "TAManagement.";
	
	//출근시간 입력
	@Override
	public void insertGto(TAManagement dto) {
//		System.out.println("출근시간 입력 ="+dto.toString());
		session.insert(queryprefix+"insertGto", dto);
		
	}
	
	//출근 전체 조회
	@Override
	public List<JoinDto> selectGtoAllList(BoardPager boardPager) {
		
		List<JoinDto> selectGtoAllList = new ArrayList<JoinDto>();
		
		
		selectGtoAllList = session.selectList(queryprefix+"selectGtoAllList", boardPager);
//		System.out.println("전체목록 조회 = "+selectGtoAllList.toString());
		
		return selectGtoAllList;
	}
	
	//출근 총 레코드 갯수
	@Override
	public int selectuserGtoCount(SearchDto searchDto) {

//		System.out.println("레코드 총 갯수 Dao"+searchDto);
		
		return session.selectOne(queryprefix+"selectuserGtoCount", searchDto);
	}
	
	//퇴근시간 (update)
	@Override
	public void owUpdate(int ta_id) {
		System.out.println("update = "+ta_id);
		
		session.update(queryprefix+"owUpdate", ta_id);
	}
	
	//퇴근 전체 조회
	@Override
	public List<JoinDto> selectOwAllList(BoardPager boardPager) {
		
		List<JoinDto> selectOwAllList = new ArrayList<JoinDto>();
		selectOwAllList = session.selectList(queryprefix+"selectOwAllList", boardPager);
//		System.out.println("퇴근 전체 리스트 = "+selectOwAllList);
		return selectOwAllList;
	}
	
	
	//퇴근 레코드 총 갯수 가져오기
	@Override
	public int selectuserOwCount(SearchDto searchDto) {
//		System.out.println("퇴근 레코드 총 갯수 ="+searchDto.toString());
		
		return session.selectOne(queryprefix+"selectuserOwCount", searchDto);
	}
	
	//상세조회
	@Override
	public int userGtoOwSelectOne(int ta_id) {
		System.out.println("상세조회 = "+ta_id);
		
		return session.selectOne(queryprefix+"userGtoOwSelectOne", ta_id);
	}
	

	
	
	
	
	
}//class end
