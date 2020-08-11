package com.bno.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bno.dao.UserInfoDao;
import com.bno.dto.BoardPager;
import com.bno.dto.SearchDto;
import com.bno.dto.UserInfo;
@Service
public class UserInfoServiceImpl implements UserInfoService {
	
	@Autowired 
	private UserInfoDao dao;
	
	
	//로그인 확인
	@Override
	public UserInfo userSelectOne(UserInfo user) {
				
		return dao.userSelectOne(user);
	}

	//이메일 중복체크
	@Override
	public int emailCheck(String u_email) {

		return dao.emailCheck(u_email);
	}
	

	
	//사용자 등록
	@Override
	public void userInsert(UserInfo user) {
		
		dao.userInsert(user);
	}
	
	//사용자 총 레코드
	@Override
	public int selectUserListCount(SearchDto searchDto) {
		
		return dao.selectUserListCount(searchDto);
	}
	
	//사용자 전체 리스트
	@Override
	public List<UserInfo> selectAdminUserList(BoardPager boardPager) {
		
		return dao.selectAdminUserList(boardPager);
	}
	
	
	
	
	
}//class end
