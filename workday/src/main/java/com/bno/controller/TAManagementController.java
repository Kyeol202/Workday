package com.bno.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bno.dto.BoardPager;
import com.bno.dto.JoinDto;
import com.bno.dto.SearchDto;
import com.bno.dto.TAManagement;
import com.bno.dto.UserInfo;
import com.bno.service.TAManagementService;

@Controller
public class TAManagementController {
	
	@Autowired
	private TAManagementService service;

	
	//출근 입력
	@RequestMapping(value = "user/userGtoOw")
	public String userGto() {


		return "work/userGtoOw";
	}
	
	//출근 목록보기
	@RequestMapping(value = "userGtoOw/userGtoOwAjax")
	public String userGtoAjax(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "searchSort", defaultValue = "")String searchSort,
			@RequestParam(value = "searchVal", defaultValue = "")String searchVal,
			Model model, HttpSession session, RedirectAttributes redirectAttribute, TAManagement dto) {
		
			UserInfo user = (UserInfo) session.getAttribute("loginUser");
			model.addAttribute("user", user);
			
			//검색객체 값 넣기
			SearchDto searchDto = new SearchDto(searchSort, searchVal);
			//총 레코드 가져오기
			int nCount = service.selectuserGtoCount(searchDto);
			//현재 출력 페이지
			int curPage = cPage;
			
			//페이지 객체에 값 저장(nCount : 리스트 총 레코드 갯수 / curPage : 현재 출력 페이지)
			BoardPager boardPager = new BoardPager(nCount, curPage);
			
			//페이지 객체에 검색 정보 저장
			boardPager.setSearchSort(searchSort);
			boardPager.setSearchVal(searchVal);
			
			//전체 리스트 출력
			List<JoinDto> gtoAllList = service.selectGtoAllList(boardPager);
			
			model.addAttribute("gtoAllList", gtoAllList);
			model.addAttribute("boardPager", boardPager);
			redirectAttribute.addAttribute("ta_id", dto.getTa_id());
		
	return "work/ajax/userGtoOw_ajax";	
	}
	
	//출근관리 버튼을 눌렀을 때 로그인 체크
	@RequestMapping(value = "/user/userGtoCheck")
	public String userGtoCheck(@RequestParam int u_id, 
			TAManagement dto, HttpSession session, RedirectAttributes redirectAttribute, Model model) {
		
		UserInfo user = (UserInfo) session.getAttribute("loginUser");
		model.addAttribute("dto", dto.getTa_id());

		String path = "";
		
		if(user != null) {
		
		 service.insertGto(dto);
		 
		 path = "redirect:/user/userGtoOw";
			
		} else {
			path = "redirect:/user/userlogin";
		}
		
		return path;
	}
	
	//퇴근관리
	@RequestMapping(value = "user/userOw")
	public String userOw() {
		
		return "work/userOw";
	}
	
	//퇴근관리 버튼을 눌렀을 때 로그인 체크
	@RequestMapping(value = "user/userOwCheck")
	public String userOwCheck(@RequestParam("ta_id") int ta_id,
			HttpSession session, TAManagement dto, RedirectAttributes redirectAttribute) {
		
		UserInfo user = (UserInfo) session.getAttribute("loginUser");
		String path = "";
	
		if(user != null) {
	
			service.owUpdate(ta_id);
			redirectAttribute.addAttribute("ta_id", ta_id);
			
			path = "redirect:/user/workinghour";

		}

		
		else {
			path = "redirect:/user/userlogin";
		}

		return path;
	}
	

	//유저 상세보기
	@RequestMapping(value = "user/userGtoOwSelectOne")
	public String userGtoSelectOne(int ta_id, Model model, HttpSession session) {
			
		UserInfo user = (UserInfo) session.getAttribute("loginUser");
		model.addAttribute("user", user);
		
		TAManagement dto = service.userGtoOwSelectOne(ta_id);
		model.addAttribute("TADto", dto);
		System.out.println(dto.toString());
		
		return "work/userGtoOwSelectOne";
	}
	
	//근무시간 계산
	@RequestMapping(value = "user/workinghour")
	public String Workinghour(@RequestParam("ta_id") int ta_id, HttpSession session, 
			Model model, TAManagement dto) {
		
			service.updateWorkingHour(ta_id);
		
		return "work/userGtoOw";
	}
	
	//상태 수정(조퇴, 반차)
	@RequestMapping(value = "user/userGtoOwUpdate")
	public String userGtoOwUpdate(@RequestParam("ta_id") int ta_id, Model model) {
		
		TAManagement dto = service.userGtoOwSelectOne(ta_id);
		model.addAttribute("TADto", dto);
		System.out.println(dto);
		
		return "work/userGtoOwUpdate";
	}
	
	
	//상태 최종 수정
	@RequestMapping(value = "user/userStatusUpdate")
	public String userStatusUpdate(@RequestParam("ta_id") int ta_id, TAManagement dto, Model model, RedirectAttributes redirectAttribute) {


		
	
		service.userStatusUpdate(dto);

		
//		return "work/userGtoOw";
		return "forward:/user/userOwCheck";
	}
	
	
	
	
	
	
	//부서 출퇴근관리
	@RequestMapping(value = "myPage/myDepartmentGtoOw")
	public String myDepartmentGtoOw() {
		
		return "admin/departmentGtoOw";
	}
	
	//관리자 아이디 부서 출퇴근 전체목록
	@RequestMapping(value = "admin/departmentGtoOwajax")
	public String departmentGtoOwajax(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "searchSort", defaultValue = "")String searchSort,
			@RequestParam(value = "searchVal", defaultValue = "")String searchVal,
			Model model, HttpSession session, RedirectAttributes redirectAttribute, TAManagement dto) {
		
		UserInfo user = (UserInfo) session.getAttribute("loginUser");
		model.addAttribute("user", user);
		
		//검색객체 값 넣기
		SearchDto searchDto = new SearchDto(searchSort, searchVal);
		//총 레코드 가져오기
		int nCount = service.selectuserGtoCount(searchDto);
		//현재 출력 페이지
		int curPage = cPage;
		
		//페이지 객체에 값 저장(nCount : 리스트 총 레코드 갯수 / curPage : 현재 출력 페이지)
		BoardPager boardPager = new BoardPager(nCount, curPage);
		
		//페이지 객체에 검색 정보 저장
		boardPager.setSearchSort(searchSort);
		boardPager.setSearchVal(searchVal);
		
		//전체 리스트 출력
		List<JoinDto> gtoAllList = service.selectGtoAllList(boardPager);
		
		model.addAttribute("gtoAllList", gtoAllList);
		model.addAttribute("boardPager", boardPager);
		redirectAttribute.addAttribute("ta_id", dto.getTa_id());
		
		
		
		return "admin/ajax/departmentGtoOw_ajax";
	}
	
	//관리자 부서 상세보기
	@RequestMapping(value = "admin/adminGtoOwSelectOne")
	public String adminGtoOwSelectOne(int ta_id, Model model, HttpSession session) {
		
		TAManagement dto = service.userGtoOwSelectOne(ta_id);
		model.addAttribute("TADto", dto);
		
		return "admin/adminGtoOwSelectOne";
	}
	
	//관리자 부서원 입력
	@RequestMapping(value = "admin/adminInsertCheck")
	public String adminUpdateCheck() {
		
		
		
		return "admin/userGtoOwInsert";
	}
	
}//class end
