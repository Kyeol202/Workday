package com.bno.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bno.dao.UserInfoDao;
@Service
public class UserInfoServiceImpl implements UserInfoService {
	
	@Autowired 
	private UserInfoDao dao;
	
	
	
	
	
}//class end
