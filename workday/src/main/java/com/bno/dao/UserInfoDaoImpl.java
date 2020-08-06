package com.bno.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserInfoDaoImpl implements UserInfoDao {
	
	@Autowired 
	SqlSessionTemplate session;
	
	private String queryprefix = "UserInfo.";
	
	
	
	
}//class end
