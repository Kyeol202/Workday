package com.bno.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bno.dto.UserInfo;
import com.bno.dto.WorkRecord;
import com.bno.dto.Approval;
import com.bno.dto.BoardPager;
import com.bno.dto.JoinDto;
import com.bno.dto.SearchDto;
import com.bno.service.ApprovalService;

@Controller
public class ApprovalController {

	private static Logger logger = LoggerFactory.getLogger(ApprovalController.class);

	@Autowired
	private ApprovalService service;

	// 결재리스트화면
	@RequestMapping(value = "user/userStatus")
	public String userStatus() {

		return "work/userStatus";
	}

	// 결재 정보 접수
	@RequestMapping(value = "user/userRequest")
	public String userRequest(HttpSession session, Approval dto) {
		logger.info("this is a approvalIn method");
		UserInfo user = (UserInfo) session.getAttribute("loginUser");
		String path = "";

		if (user != null) {
			service.approvalIn(dto);
			path = "redirect:/user/userStatus";
		} else
			path = "redirect:/user/userHome";

		return path;
	}

	// 결재 신청 화면
	@RequestMapping(value = "user/userStatusRequest")
	public String userStatusRequest(HttpSession session, Model model) {
		UserInfo user = (UserInfo) session.getAttribute("loginUser");
		model.addAttribute("user", user);

		return "work/userStatusRequest";
	}

	// 결재 신청 등록
	@RequestMapping(value = "user/userRequestResult")
	public String userRequest(Approval request) {
		logger.info("this is a userRequest method");

		service.approvalIn(request);

		return "redirect:/user/userStatus";
	}

	// 승인 리스트
	@RequestMapping(value = "user/userstatusListAjax")
	public String userstatusListAjax(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "searchSort", defaultValue = "") String searchSort,
			@RequestParam(value = "searchVal", defaultValue = "") String searchVal, Model model, HttpSession session) {
		logger.info("this is a userStatusListAjax method");

		UserInfo user = (UserInfo) session.getAttribute("loginUser");
		model.addAttribute("user", user);

		// 검색 객체 값 넣기
		SearchDto searchDto = new SearchDto(searchSort, searchVal);

		// 총 레코드 가져오기
		int nCount = service.selectStatusCount(searchDto);

		// 현재 출력 페이지
		int curPage = cPage;

		// 페이지 객체에 값 저장
		BoardPager boardPager = new BoardPager(nCount, curPage);

		// 페이지 겍체에 검색 정보 저장
		boardPager.setSearchSort(searchSort);
		boardPager.setSearchVal(searchVal);

		// 전체 리스트 출력
		List<JoinDto> statusAllList = service.selectAllApprovalList(boardPager);
		System.out.println(statusAllList);
		model.addAttribute("statusAllList", statusAllList);
		model.addAttribute("boardPager", boardPager);

		return "work/ajax/userStatusList_ajax";
	}

	// 휴가내역 상세보기
	@RequestMapping(value = "user/StatusRecordSelectOne")
	public String StatusRecordSelectOne(int apv_id, Model model, 
			HttpSession session) {

		UserInfo user = (UserInfo) session.getAttribute("loginUser");
		model.addAttribute("user", user);

		Approval approval = service.approvalSelectOne(apv_id);
		System.out.println(approval);
		model.addAttribute("approval", approval);

		return "work/userStatusRecordSelectOne";
	}
	
	// 결재 승인/반려
	@RequestMapping(value = "user/userApprovalUpdate")
	public String userApprovalUpdate(Approval aDto) {
		
		service.updateStatus(aDto);
		
		return "redirect:/user/userStatus";
	}
	
	

}// class end
