package com.bno.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bno.dto.BoardPager;
import com.bno.dto.JoinDto;
import com.bno.dto.SearchDto;
import com.bno.dto.UserInfo;

@Repository
public class UserDaoImpl implements UserDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	private String queryprefix = "user.";
	

	//회원가입
	@Override
	public void insertUser(UserInfo user) throws Exception {
//		System.out.println("회원가입"+user.toString());
		session.insert(queryprefix+"insertUser", user);
	}

	//이메일 중복체크
	@Override
	public int idcheck(String u_email) throws Exception {
	
//		System.out.println("이메일 중복체크"+u_email.toString());
			
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
//		System.out.println("user정보 Get = "+user);
		session.update(queryprefix+"userInfoUpdate", user);
	}
	
	
	//유저 전체 레코드 갯수 가져오기
	@Override
	public int selectUserCount(SearchDto searchDto) {
			
//		System.out.println("레코드 총 갯수 = "+searchDto);
		
		return session.selectOne(queryprefix+"selectUserCount", searchDto);
	}
	
	
	//유저 전체 목록 가져오기(검색포함)
	@Override
	public List<UserInfo> userAllList(BoardPager boardPager) {
		List<UserInfo> userAllList = new ArrayList<UserInfo>();
		userAllList = session.selectList(queryprefix+"userAllList", boardPager);
//		System.out.println("유저 전체 목록 ="+userAllList);
		return userAllList;
	}
	
	
	
	//유저 정보 상세보기
	@Override
	public UserInfo userInfoSelectOne(int u_id) {
		
		return session.selectOne(queryprefix+"userInfoSelectOne", u_id);
	}
	
	
	
	//관리자가 유저 정보 수정
	@Override
	public void userInfoUpdateOk(UserInfo user) {
		System.out.println("userInfo = "+user);
		 session.update(queryprefix+"userInfoUpdateOk", user);
		
	}
	
	
	//유저 삭제
	@Override
	public void userInfoDelete(int u_id) {
		
		session.delete(queryprefix+"userInfoDelete", u_id);
	}
	

	
	
	
	
	
	
	
	
}//class end
