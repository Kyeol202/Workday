package com.bno.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bno.dao.UserDao;
import com.bno.dto.BoardPager;
import com.bno.dto.JoinDto;
import com.bno.dto.SearchDto;
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
		

	//유저 전체조회
	@Override
	public List<UserInfo> selectAllUserList() {

		return dao.selectAllUserList();
	}

	
	//마이페이지 정보 수정
	@Override
	public void userInfoUpdate(UserInfo user) {
		
		dao.userInfoUpdate(user);
		
	}

	//유저 전체 레코드 갯수 가져오기
	@Override
	public int selectUserCount(SearchDto searchDto) {
		
		return dao.selectUserCount(searchDto);
	}

	//전체 유저 목록 가져오기(검색포함)
	@Override
	public List<JoinDto> userAllList(BoardPager boardPager) {
		
		return dao.userAllList(boardPager);
	}

	
	
	
	
	
	
}//class end
