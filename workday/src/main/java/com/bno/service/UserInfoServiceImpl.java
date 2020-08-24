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
	
	//사용자 상세보기
	@Override
	public UserInfo adminUserSelectOne(int u_id) {
		
		return dao.adminUserSelectOne(u_id);
	}
	
	//사용자 정보 수정(사용자)
	@Override
	public UserInfo myPageUserInfo(UserInfo uDto) {
		
		return dao.myPageUserInfo(uDto);
	}

	//사용자 정보 수정(관리자)
	@Override
	public UserInfo adminUserUpdateResult(UserInfo uDto) {
	
		return dao.adminUserUpdateResult(uDto);
	}
	
	
	//사용자 숨김(퇴사)
	@Override
	public UserInfo adminUserRun(UserInfo uDto) {
		
		return dao.adminUserRun(uDto);
	}
	
	
	//사용자 정보 완전삭제(Delete)
	@Override
	public void adminUserDelete(int u_id) {
		
		dao.adminUserDelete(u_id);
	}
	
	
	//그리드 테스트
	@Override
	public List<UserInfo> gridTest(UserInfo uDto) {
		
		return dao.gridTest(uDto);
	}
	
	
	
	
	
	
}//class end
