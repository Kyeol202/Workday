package com.bno.service;

import java.util.List;

import com.bno.dto.Approval;
import com.bno.dto.BoardPager;
import com.bno.dto.JoinDto;
import com.bno.dto.SearchDto;
import com.bno.dto.UserInfo;

public interface ApprovalService {
	
	// 결재정보 접수
	public void approvalIn(Approval dto);
	
	// 결재정보 등록
	public void userRequestInsert(Approval request);
	
	// 결재정보 총 레코드 가져오기
	public int selectStatusCount(SearchDto searchDto);
	
	// 결재정보 전체 조회
	public List<JoinDto> selectAllApprovalList(BoardPager boardPager); 

	// 결재정보 상세보기
	public Approval approvalSelectOne(int apv_id);
		
	// 결재승인
	public Approval updateStatus(int apv_id);
	
}//interface end
