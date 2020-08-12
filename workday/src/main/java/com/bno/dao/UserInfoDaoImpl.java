package com.bno.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bno.dto.BoardPager;
import com.bno.dto.SearchDto;
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
	
	
	//사용자 총 레코드
	@Override
	public int selectUserListCount(SearchDto searchDto) {
		
		return session.selectOne(queryprefix+"selectUserListCount", searchDto);
	}
	
	
	//사용자 전체 리스트
	@Override
	public List<UserInfo> selectAdminUserList(BoardPager boardPager) {
		
		return session.selectList(queryprefix+"selectAdminUserList", boardPager);
	}
	
	
	//사용자 상세보기
	@Override
	public UserInfo adminUserSelectOne(int u_id) {
		
		return session.selectOne(queryprefix+"adminUserSelectOne", u_id);
	}
	
	
	//사용자 정보 수정(관리자)
	@Override
	public UserInfo adminUserUpdateResult(UserInfo uDto) {
		System.out.println("uDto = "+uDto);
		return session.selectOne(queryprefix+"adminUserUpdateResult", uDto);
	}
	
	
	//사용자 숨김(퇴사)
	@Override
	public UserInfo adminUserRun(UserInfo uDto) {
		
		return session.selectOne(queryprefix+"adminUserRun", uDto);
	}
	
	
	//사용자 정보 완전 삭제(Delete)
	@Override
	public void adminUserDelete(int u_id) {
		
		session.delete(queryprefix+"adminUserDelete", u_id);
	}
	
	
	
	
	
	
}//class end
