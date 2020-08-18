package com.bno.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bno.dto.BoardPager;
import com.bno.dto.JoinDto;
import com.bno.dto.SearchDto;
import com.bno.dto.UserInfo;
import com.bno.dto.WorkRecord;

@Repository
public class WorkRecordDaoImpl implements WorkRecordDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	private String queryprefix = "WorkRecord.";
	
	
	//출퇴근 전체 리스트
	@Override
	public List<WorkRecord> inOutAllList(WorkRecord wDto) {
		
		List<WorkRecord> inOutAllList = new ArrayList<WorkRecord>();
		inOutAllList = session.selectList(queryprefix+"inOutAllList", wDto);
		
		return inOutAllList;
	}
	
	//사용자 출근 중복 체크
	@Override
	public int userWorkInCheck(int u_id) {
			
		return session.selectOne(queryprefix+"userWorkInCheck", u_id);
	}


	//사용자 출근 입력(정상)
	@Override
	public void userWorkIn(WorkRecord dto) {
		
		System.out.println("사용자 정보 = "+dto);
		session.insert(queryprefix+"userWorkIn", dto);
	}
	
	//사용자 출근 입력(지각)
	@Override
	public void userWorkLate(WorkRecord dto) {
		System.out.println(dto);
		session.insert(queryprefix+"userWorkLate", dto);
	}

	//출퇴근 전체 레코드 갯수
	@Override
	public int selectUserCount(SearchDto searchDto) {
		
		return session.selectOne(queryprefix+"selectUserCount", searchDto);
	}

	//전체 출퇴근 조회(페이징)
	@Override
	public List<JoinDto> selectUserAllList(BoardPager boardPager) {
		
		List<JoinDto> AllUserList = new ArrayList<JoinDto>();
		AllUserList = session.selectList(queryprefix+"selectUserAllList", boardPager);
//		System.out.println("전체 리스트 = "+AllUserList);
		return AllUserList;
	}
	
	//사용자 상세보기
	@Override
	public WorkRecord workRecordSelectOne(int w_id) {
//			System.out.println("상세조회 = "+w_id);
		return session.selectOne(queryprefix+"workRecordSelectOne", w_id);
	}
	
	
	//사용자 퇴근 중복방지 테스트
	@Override
	public int userWorkOutCheck(int u_id) {
		
		return session.selectOne(queryprefix+"userWorkOutCheck", u_id);
	}

	//사용자 퇴근
	@Override
	public void userWorkOut(int w_id) {
//		System.out.println("w_id = "+w_id);
		session.update(queryprefix+"userWorkOut", w_id);
	}
	
	//사용자 근무시간 계산
	@Override
	public WorkRecord updateWTime(int w_id) {
//		System.out.println("w_id = "+w_id);
		return session.selectOne(queryprefix+"updateWTime", w_id);
	}
	
	
	//사용자 상태 및 조퇴사유
	@Override
	public WorkRecord statusReasonUpdate(WorkRecord wDto) {
//	System.out.println("wDto = "+wDto);
	
	return session.selectOne(queryprefix+"statusReasonUpdate", wDto);	
	}
	
	
	//사용자 근무기록 삭제
	@Override
	public void userWorkDelete(int w_id) {
		
		session.delete(queryprefix+"userWorkDelete", w_id);
	}
	
	//사용자 근무시간 수정
	@Override
	public WorkRecord userTimeUpdateOk(WorkRecord wDto) {
		System.out.println("근무시간 수정 데이터 = "+wDto);
		return session.selectOne(queryprefix+"userTimeUpdateOk", wDto);
	}
	
	

	
	
	
	
	
}//class end
