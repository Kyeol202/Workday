package com.bno.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bno.dao.UserInfoDao;
import com.bno.dto.UserInfo;
@Service
public class UserInfoServiceImpl implements UserInfoService {
	
	@Autowired 
	private UserInfoDao dao;
	
	
	//로그인 확인
	@Override
	public UserInfo userSelectOne(UserInfo user) {
				
		return dao.userSelectOne(user);
	}

	//이메일 중복체크
	@Override
	public int emailCheck(String u_email) {

		return dao.emailCheck(u_email);
	}
	

	
	//사용자 등록
	@Override
	public void userInsert(UserInfo user) {
		
		dao.userInsert(user);
	}
	
	
	
	
	
}//class end
