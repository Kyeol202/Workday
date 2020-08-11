package com.bno.service;

import java.util.List;

import com.bno.dto.BoardPager;
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
	
}//interface end
