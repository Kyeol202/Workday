package com.bno.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.bno.dto.UserInfoDto;

@Repository
public class UserInfoDaoImpl implements UserInfoDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	private String queryprefix = "user.";
	

	//회원가입
	@Override
	public void insertUser(UserInfoDto user) throws Exception {
		System.out.println("회원가입"+user.toString());
		session.insert(queryprefix+"insertUser", user);
	}
	
	
	
	
	
	
	
}//class end
