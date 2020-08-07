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

	//이메일 중복체크
	@Override
	public int emailCheck(String u_email) {
		System.out.println("이메일 중복체크 = "+u_email.toString());
		return session.selectOne(queryprefix+"emailCheck", u_email);
	}
	

	
	//사용자 등록
	@Override
	public void userInsert(UserInfo user) {
	System.out.println("사용자 등록 값 = "+user.toString());
	session.insert(queryprefix+"userInsert", user);
	}
	
	
	
	
	
	
}//class end
