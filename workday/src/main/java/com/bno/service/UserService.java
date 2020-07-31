package com.bno.service;

import java.util.List;

import com.bno.dto.UserInfo;

public interface UserService {
	

	
	//회원가입
	public void insertUser(UserInfo user) throws Exception;
	
	//이메일 중복체크
	public int idcheck(String u_email) throws Exception;
	
	//상세조회
	public UserInfo userSelectOne(UserInfo user);
	
	//전체조회(페이징 없음)
	public List<UserInfo> selectAllUserList();
	
	//마이페이지 정보 수정
	public void userInfoUpdate(UserInfo user);
	
}//inter end
