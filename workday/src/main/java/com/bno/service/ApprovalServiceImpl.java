package com.bno.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bno.dao.ApprovalDao;
import com.bno.dto.Approval;
import com.bno.dto.BoardPager;
import com.bno.dto.JoinDto;
import com.bno.dto.SearchDto;

@Service
public class ApprovalServiceImpl implements ApprovalService{
	
	@Autowired
	private ApprovalDao dao;

	// 결재정보 접수
	@Override
	public void approvalIn(Approval dto) {
		// TODO Auto-generated method stub
		dao.approvalIn(dto);
	}
	
	// 결재정보 전체 레코드 갯수
	@Override
	public int selectStatusCount(SearchDto searchDto) {
		
		return dao.selectStatusCount(searchDto);
	}

	// 결재정보 전체 조회
	@Override
	public List<JoinDto> selectAllApprovalList(BoardPager boardPager) {
		// TODO Auto-generated method stub
		return dao.selectAllApprovalList(boardPager);
	}

	// 결재정보 상세보기
	@Override
	public Approval approvalSelectOne(int apv_id) {
		// TODO Auto-generated method stub
		return dao.approvalSelectOne(apv_id);
	}

	// 결재승인
	@Override
	public Approval updateStatus(int apv_id) {
		// TODO Auto-generated method stub
		return dao.updateStatus(apv_id);
	}


	
	// 결재정보 등록
	@Override
	public void userRequestInsert(Approval request) {
		// TODO Auto-generated method stub
		
	}
	
	
	
	
	
}//class end
