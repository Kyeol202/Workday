package com.bno.dao;

import java.util.List;

import com.bno.dto.BoardPager;
import com.bno.dto.SearchDto;
import com.bno.dto.UserInfo;

public interface UserInfoDao {
	
	//로그인 확인
	public UserInfo userSelectOne(UserInfo user);
	
	//이메일 중복체크
	public int emailCheck(String u_email);
	
	
	//사용자 등록
	public void userInsert(UserInfo user);
	
	//사용자 총 레코드
	public int selectUserListCount(SearchDto searchDto);
	
	//사용자 전체 리스트
	public List<UserInfo> selectAdminUserList(BoardPager boardPager);
	
}//interface end
