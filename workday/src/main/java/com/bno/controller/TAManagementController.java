package com.bno.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bno.dto.BoardPager;
import com.bno.dto.SearchDto;
import com.bno.dto.TAManagement;
import com.bno.dto.UserInfo;
import com.bno.service.TAManagementService;

@Controller
public class TAManagementController {
	
	@Autowired
	private TAManagementService service;

	
	
	@RequestMapping(value = "user/userGto")
	public String userGto() {
		
		
		
		return "work/userGto";
	}
	
	@RequestMapping(value = "userGto/userGtoAjax")
	public String userGtoAjax(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "searchSort", defaultValue = "")String searchSort,
			@RequestParam(value = "searchVal", defaultValue = "")String searchVal,
			Model model, HttpSession session) {
		
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
			List<TAManagement> gtoAllList = service.selectGtoAllList(boardPager);
			
			model.addAttribute("gtoAllList", gtoAllList);
			model.addAttribute("boardPager", boardPager);
		
	return "work/ajax/userGto_ajax";	
	}
	
	
	@RequestMapping(value = "/user/userGtoCheck")
	public String userGtoCheck(@RequestParam int u_id, TAManagement dto,
			HttpSession session) {
		
		UserInfo user = (UserInfo) session.getAttribute("loginUser");
		String path = "";
		
		
		if(user != null) {
		
		 service.insertGto(dto);
		 path = "redirect:/user/userGto";
			
		} else {
			path = "redirect:/user/userlogin";
		}
		
		return path;
	}
	
	
	
	
	
	
	
}//class end
