package com.bno.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bno.dto.UserInfo;

@Repository
public class UserInfoDaoImpl implements UserInfoDao {
	
	@Autowired 
	SqlSessionTemplate session;
	
	private String queryprefix = "user.";
	
	
	//로그인 확인
	@Override
	public UserInfo userSelectOne(UserInfo user) {
		
//		System.out.println("로그인 확인 = "+user.toString());
		return session.selectOne(queryprefix+"userSelectOne", user);
	}
	
	
	
	
	
	
}//class end
