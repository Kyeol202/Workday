package com.bno.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bno.dto.BoardPager;
import com.bno.dto.JoinDto;
import com.bno.dto.SearchDto;
import com.bno.dto.TAManagement;
import com.bno.dto.UserInfo;
import com.bno.service.UserService;

@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService service;
	
	
	@RequestMapping(value = "/userHome")
	public String userHome(Model model) {
			logger.info("this is a userHome Method");
		
		
		return "user/userHome";
	}
	
	//회원가입
	@RequestMapping(value = "user/userSignUp")
	public String userSignUp(Model model) {
			logger.info("this is a userSignUp Method");
			
		
		
		return "user/userSignUp";
	}
	
	//회원가입 결과
	@RequestMapping(value = "user/userSignUpResult")
	public String userSignUpResult(UserInfo user) throws Exception {
		
		service.insertUser(user);
		
		return "redirect:/user/userlogin";
	}
	
	//로그인 페이지
	@RequestMapping(value = "user/userlogin")
	public String userlogin() {
			logger.info("this is a userlogin Method");
		
			
			return "user/userlogin";
		
	}
	//이메일 중복체크
	@RequestMapping(value = "/user/idcheck", method = RequestMethod.GET)
	public String idcheck(@RequestParam("u_eamil") String u_email) throws Exception {
		
		int result = service.idcheck(u_email);
		String msg;
		if(result > 0) {
			msg = "1";
		} else {
			msg = "0";
		}
		
	return msg;	
	}
	
	//로그인 확인 후 Home페이지
	@RequestMapping(value = "user/userloginEnd")
	public String userloginEnd(Model model, UserInfo user, HttpSession session) {
		logger.info("this is a userloginEnd Method");
		
		UserInfo result = service.userSelectOne(user);
		
		String path = "";
		if(result != null) {
			if(user.getU_pwd().equals(result.getU_pwd())) {
				path = "redirect:/userHome";
				
				session.setAttribute("loginUser", result);
				session.setMaxInactiveInterval(1440*60);
			} 

		}
		
		return path;
	}
	
	//로그아웃
	@RequestMapping(value = "user/userlogout")
	public String userlogout(HttpSession session) {
			logger.info("this is a userlogout Method");
			
			if(session.getAttribute("loginUser")!=null) {
				session.removeAttribute("loginUser");
			}
		
		return "redirect:/userHome";
	}
	
	@RequestMapping(value = "user/userCal")
	public String userCal() {
		
		return "user/userCalender";
	}
	
	
	//마이페이지
	@RequestMapping(value = "myPage/myUserInfo")
	public String myUserInfo() {
		
		
		
		return "user/userMyUserInfo";
	}
	
	
	//마이페이지 수정
	@RequestMapping(value = "user/userInfoUpdate")
	public String userInfoUpdate(UserInfo user, HttpSession session) {
	
		service.userInfoUpdate(user);
		
		session.invalidate();
		
		return "redirect:/user/userlogin";
	}
	
	
	//부서정보
	@RequestMapping(value = "myPage/myDepartment")
	public String myDepartment() {
		
		
		return "admin/myDepartmentInfo";
	}
	
	//부서원 전체 목록
	@RequestMapping(value = "admin/myDepartmentInfoAjax")
	public String myDepartmentInfoAjax(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "searchSort", defaultValue = "")String searchSort,
			@RequestParam(value = "searchVal", defaultValue = "")String searchVal,
			Model model, HttpSession session, RedirectAttributes redirectAttribute, UserInfo user) {
		
			
			
			//검색객체 값 넣기
			SearchDto searchDto = new SearchDto(searchSort, searchVal);
			//총 레코드 가져오기
			int nCount = service.selectUserCount(searchDto);
			//현재 출력 페이지
			int curPage = cPage;
			
			//페이지 객체에 값 저장(nCount : 리스트 총 레코드 갯수 / curPage : 현재 출력 페이지)
			BoardPager boardPager = new BoardPager(nCount, curPage);
			
			//페이지 객체에 검색 정보 저장
			boardPager.setSearchSort(searchSort);
			boardPager.setSearchVal(searchVal);
			
			//전체 리스트 출력
			List<UserInfo> userAllList = service.userAllList(boardPager);
			
			model.addAttribute("userAllList", userAllList);
			model.addAttribute("boardPager", boardPager);
			
			
			
		return "admin/ajax/myDepartmentInfo_ajax";
	}
	
	
	//유저 정보 상세보기
	@RequestMapping(value = "admin/userInfoSelectOne")
	public String userInfoSelectOne(@RequestParam("u_id") int u_id, Model model) {
		
			UserInfo userInfo = service.userInfoSelectOne(u_id);
			model.addAttribute("userInfo", userInfo);
		
		return "admin/adminUserInfoUpdateForm";
	}
	
	//관리자가 유저 정보 수정
	@RequestMapping(value = "admin/userInfoUpdateOk")
	public String userInfoUpdateOk(UserInfo user, RedirectAttributes redirectAttribute) {
		
		service.userInfoUpdateOk(user);

		
		return "admin/myDepartmentInfo";
	}
	
	
	//유저 삭제
	@RequestMapping(value = "admin/userInfoDelete")
	public String userInfoDelete(@RequestParam("u_id")int u_id) {
		
		service.userInfoDelete(u_id);
		
		return "admin/myDepartmentInfo";
	}
	
	
}//class end