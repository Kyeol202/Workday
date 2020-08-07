package com.bno.service;

import com.bno.dto.UserInfo;

public interface UserInfoService {
	
	//로그인 확인
	public UserInfo userSelectOne(UserInfo user);
	
	//이메일 중복 체크
	public int emailCheck(String u_email);
	
	//사용자 등록
	public void userInsert(UserInfo user);
	
	
}//interface end
