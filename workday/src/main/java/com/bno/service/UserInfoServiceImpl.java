package com.bno.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bno.dao.UserInfoDao;
import com.bno.dao.UserInfoDaoImpl;
import com.bno.dto.UserInfoDto;

@Service
public class UserInfoServiceImpl implements UserInfoService {
	
	
	@Autowired
	private UserInfoDao dao;
	
	


	@Override
	public void insertUser(UserInfoDto user) throws Exception {
		
		dao.insertUser(user);
	}
		
	
	
	
	
	
	
}//class end
