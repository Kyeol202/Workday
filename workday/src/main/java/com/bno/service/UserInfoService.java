package com.bno.service;

import java.util.List;

import com.bno.dto.BoardPager;
import com.bno.dto.JqGrid;
import com.bno.dto.SearchDto;
import com.bno.dto.UserInfo;
import com.bno.dto.WorkRecord;

public interface UserInfoService {
	
	//로그인 확인
	public UserInfo userSelectOne(UserInfo user);
	
	//이메일 중복 체크
	public int emailCheck(String u_email);
	
	//사용자 등록
	public void userInsert(UserInfo user);
	
	//사용자 총 레코드 가져오기
	public int selectUserListCount(SearchDto searchDto);
	
	//사용자 전체 조회
	public List<UserInfo> selectAdminUserList(BoardPager boardPager);
	
	//사용자 상세보기
	public UserInfo adminUserSelectOne(int u_id);
	
	//사용자 정보 수정(사용자)
	public UserInfo myPageUserInfo(UserInfo uDto);
	
	//사용자 정보 수정(관리자)
	public UserInfo adminUserUpdateResult(UserInfo uDto);
	
	//사용자 숨김(퇴사)
	public UserInfo adminUserRun(UserInfo uDto);
	
	//사용자 정보 완전 삭제(Delete)
	public void adminUserDelete(int u_id);
	
	//그리드 테스트
	public List<UserInfo> gridTest(String page,  String rows);
	
	//그리드 테스트 카운트
	public JqGrid gridCount();
	
	//그리드 테스트 업데이트

	
}//interface end
