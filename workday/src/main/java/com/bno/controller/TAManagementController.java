package com.bno.controller;

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

	
	
	@RequestMapping(value = "user/userGtoOw")
	public String userGto() {
		
		
		
		return "work/userGtoOw";
	}
	
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
	public String userGtoCheck(@RequestParam int u_id, TAManagement dto, HttpSession session) {
		
		UserInfo user = (UserInfo) session.getAttribute("loginUser");
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
		
		return "work/userGtoOw";
	}
	
	//퇴근관리 버튼을 눌렀을 때 로그인 체크
	@RequestMapping(value = "user/userOwCheck")
	public String userOwCheck(@RequestParam int u_id,TAManagement dto,
			HttpSession session, RedirectAttributes redirectAttribute, 
			@RequestParam HashMap<String, String> paramMap) {
		
		UserInfo user = (UserInfo) session.getAttribute("loginUser");
		String path = "";
		
		if(user != null) {

			service.owUpdate(paramMap);
			redirectAttribute.addAttribute("ta_id", paramMap.get("ta_id"));
			path = "redirect:/user/userGtoOw";

		}
		else {
			path = "redirect:/user/userlogin";
		}

		return path;
	}
	
	@RequestMapping(value = "userOw/userOwAjax")
	public String userOwAjax(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "searchSort", defaultValue = "")String searchSort,
			@RequestParam(value = "searchVal", defaultValue = "")String searchVal,
			Model model, HttpSession session) {
		
			UserInfo user = (UserInfo) session.getAttribute("loginUser");
			model.addAttribute("user", user);
			
			//검색객체 값 넣기
			SearchDto searchDto = new SearchDto(searchSort, searchVal);
			//총 레코드 가져오기
			int nCount = service.selectuserOwCount(searchDto);
			//현재 출력 페이지
			int curPage = cPage;
			
			//페이지 객체에 값 저장(nCount : 리스트 총 레코드 갯수 / curPage : 현재 출력 페이지)
			BoardPager boardPager = new BoardPager(nCount, curPage);
			
			//페이지 객체에 검색 정보 저장
			boardPager.setSearchSort(searchSort);
			boardPager.setSearchVal(searchVal);
			
			//퇴근 리스트 출력
			List<JoinDto> owAllList = service.selectOwAllList(boardPager);
			
			model.addAttribute("owAllList", owAllList);
			model.addAttribute("boardPager", boardPager);
		
	return "work/ajax/userGtoOw_ajax";	
	}
	
	
	
}//class end
