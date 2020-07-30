package com.bno.dao;

import java.util.List;

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
	

	
}//inter end
