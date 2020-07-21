package com.bno.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bno.dao.UserDao;
import com.bno.dao.UserDaoImpl;
import com.bno.dto.UserInfo;

@Service
public class UserServiceImpl implements UserService {
	
	
	@Autowired
	private UserDao dao;
	
	

	//회원가입
	@Override
	public void insertUser(UserInfo user) throws Exception {
		
		dao.insertUser(user);
	}


	//이메일 중복체크
	@Override
	public int idcheck(String u_email) throws Exception {
		
		return dao.idcheck(u_email);
	}

	//상세조회	
	@Override
	public UserInfo userSelectOne(UserInfo user) {
		
		
		return dao.userSelectOne(user);
	}
		

	
	
	
	
	
	
}//class end
