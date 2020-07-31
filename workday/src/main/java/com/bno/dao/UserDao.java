package com.bno.dao;

import java.util.List;

import com.bno.dto.BoardPager;
import com.bno.dto.JoinDto;
import com.bno.dto.SearchDto;
import com.bno.dto.UserInfo;

public interface UserDao {
	

	
	//회원가입
	public void insertUser(UserInfo user) throws Exception;
	
	//이메일 중복체크
	public int idcheck(String u_email) throws Exception; 
	
	//유저 상세조회
	public UserInfo userSelectOne(UserInfo user);
	
	//유저 전체정보
	public List<UserInfo> selectAllUserList();
	
	//마이페이지 정보 수정
	public void userInfoUpdate(UserInfo user);
	
	//유저 전체 레코드 갯수 가져오기
	public int selectUserCount(SearchDto searchDto);
	
	//유저 전체 목록 가져오기(검색포함)
	public List<JoinDto> userAllList(BoardPager boardPager);
	
}//inter end
