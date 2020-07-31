package com.bno.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.bno.dto.UserInfo;

@Repository
public class UserDaoImpl implements UserDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	private String queryprefix = "user.";
	

	//회원가입
	@Override
	public void insertUser(UserInfo user) throws Exception {
		System.out.println("회원가입"+user.toString());
		session.insert(queryprefix+"insertUser", user);
	}

	//이메일 중복체크
	@Override
	public int idcheck(String u_email) throws Exception {
	
		System.out.println("이메일 중복체크"+u_email.toString());
			
		return session.selectOne(queryprefix+"idcheck", u_email);
	}

	//유저 상세조회
	@Override
	public UserInfo userSelectOne(UserInfo user) {
	
		return session.selectOne(queryprefix+"userSelectOne", user);
	}
	
	
	//유저 전체 조회
	@Override
	public List<UserInfo> selectAllUserList() {
		
		return session.selectList(queryprefix+"selectAllUserList");
	}
	
	
	//마이페이지 정보 수정
	@Override
	public void userInfoUpdate(UserInfo user) {
		System.out.println("user정보 Get = "+user);
		session.update(queryprefix+"userInfoUpdate", user);
	}
	

	
	
	
	
	
	
	
}//class end
