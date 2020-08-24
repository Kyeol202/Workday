package com.bno.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bno.common.JsonUtil;
import com.bno.dto.BoardPager;
import com.bno.dto.JoinDto;
import com.bno.dto.JqGrid;
import com.bno.dto.SearchDto;
import com.bno.dto.UserInfo;
import com.bno.dto.WorkRecord;
import com.bno.service.UserInfoService;
import com.bno.service.WorkRecordService;

@Controller
public class UserInfoController {
	
	private static Logger logger = LoggerFactory.getLogger(UserInfoController.class);
	
	@Autowired
	private UserInfoService service;
	
	@Autowired
	private WorkRecordService workService;
	
	//사용자 홈 화면
	@RequestMapping(value = "userHome")
	public String userHome() {
		logger.info("this is userHome method");

		
		
		return "user/userHome";
	}
	
	//사용자 로그인 화면
	@RequestMapping(value = "user/userlogin")
	public String userlogin(Model model) {
		logger.info("this is userlogin method");
		
		
		
		return "user/user_login";
	}
	
	//사용자 로그인
	@RequestMapping(value = "user/userloginEnd")
	public String userloginEnd(Model model, UserInfo user, HttpSession session) {
		logger.info("this is a userloginEnd method");
		
		UserInfo result = service.userSelectOne(user);
		String path = "";
		
		if(result !=null) {
			if(user.getU_pwd().equals(result.getU_pwd())) {
				path = "redirect:/userHome";
				
				session.setAttribute("loginUser", result);
				
			}
		}
		
		return path;
	}
	
	//로그아웃
	@RequestMapping(value = "user/userlogout")
	public String userlogOut(HttpSession session) {
		
		logger.info("this is a userlogOut method");
		if(session.getAttribute("loginUser") !=null) {
			session.removeAttribute("loginUser");
		}
		
		return "redirect:/userHome";
	}
	
	//사용자 등록 화면
	@RequestMapping(value ="user/userSignUp")
	public String userSignUp() {
		
		return "user/user_SignUp";
	}
	
	//이메일 중복체크
	@RequestMapping(value = "user/emailCheck")
	public String emailCheck(@RequestParam("u_email") String u_email) {
		
		int result = service.emailCheck(u_email);
		String msg;
		if(result > 0) {
			msg = "1";
		}
		else msg = "0";
		
		return msg;
	}

	
	//사용자 등록
	@RequestMapping(value = "user/userSignUpResult")
	public String userSignUpResult(UserInfo user) {
		logger.info("this is a userSignUpResult method");
		
		service.userInsert(user);
		
		return "redirect:/user/userSignUp";
	}
	
	//사용자 myPageForm
	@RequestMapping(value = "myPage/myUserInfo")
	public String myUserInfo(HttpSession session, Model model) {
		
		UserInfo user = (UserInfo) session.getAttribute("loginUser");
		model.addAttribute("user", user);
		
		return "user/myPageUserInfo";
	}
	
	@RequestMapping(value = "userMyPage/myUserInfoResult")
	public String myUserInfoResult(UserInfo uDto) {
		
		service.myPageUserInfo(uDto);
		
		return "redirect:/user/userlogin";
	}
	
	
	@RequestMapping(value = "user/userGrid2")
	public String userGrid2(UserInfo uDto, Model model) {
		
		List<UserInfo> gridList = new ArrayList<UserInfo>();
		gridList = service.gridTest(uDto);
		
		model.addAttribute("gridList", gridList);
		
		return "work/test2";
	}
	
	@RequestMapping(value = "user/userGridTest")
	@ResponseBody
	public String userGridTest(@RequestParam(value="page", required=false, defaultValue="1") String page,
			@RequestParam(value="rows", required=false, defaultValue="") String rows) {
		
		System.out.println(page);
//		List<UserInfo> list = service.gridTest(uDto);
//		System.out.println(list);
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();

//		JsonObj totalCnt = service.getCount();

		HashMap<String, Object> tempMap = new HashMap<String, Object>();
		System.out.println(page);
	        
		
		return "";
	}
	
//------------------------------------------------------------------관리자-----------------------------------------------------	
	
	//부서원 리스트
	@RequestMapping(value = "admin/adminUserList")
	public String userWorkList() {
		
		
		
		return"admin/adminUserList";
	}
	
	
	
	
	
	
	//부서 정보
	@RequestMapping(value = "admin/adminUserListAjax")
	public String adminUserList(@RequestParam(value = "cPage", defaultValue = "1")int cPage,
			@RequestParam(value = "searchSort", defaultValue = "")String searchSort,
			@RequestParam(value ="searchVal", defaultValue = "") String searchVal,
			Model model, HttpSession session) {
		logger.info("this is a adminUserList method");
		
		//검색 객체 값 넣기
				SearchDto searchDto = new SearchDto(searchSort, searchVal);
				
				//총 레코드 가져오기
				int nCount = service.selectUserListCount(searchDto);
				
				//현재 출력 페이지
				int curPage = cPage;
				
				//페이지 객체에 값 저장
				BoardPager boardPager = new BoardPager(nCount, curPage);
				
				//페이지 겍체에 검색 정보 저장
				boardPager.setSearchSort(searchSort);
				boardPager.setSearchVal(searchVal);
				
				//전체 리스트 출력
				List<UserInfo> adminUserAllList = service.selectAdminUserList(boardPager);
				model.addAttribute("adminUserAllList", adminUserAllList);
				model.addAttribute("boardPager", boardPager);
		
		
		
		
		return "admin/ajax/adminUserList_ajax";
	}
	
	
	//사용자 상세보기
	@RequestMapping(value = "admin/adminUserSelectOne")
	public String adminUserSelectOne(int u_id, Model model, HttpSession session) {
		
		UserInfo user = (UserInfo) session.getAttribute("loginUser");
		
		UserInfo userInfo = service.adminUserSelectOne(u_id);
		model.addAttribute("userInfo", userInfo);
		
		return "admin/adminUserSelectOne";
	}
	
	
	//사용자 정보 수정 Form
	@RequestMapping(value = "admin/adminUserUpdate")
	public String adminUserUpdate(int u_id, Model model) {
		
		UserInfo userInfo = service.adminUserSelectOne(u_id);
		model.addAttribute("userInfo", userInfo);
		
		
		return "admin/adminUserUpdateForm";
	}
	
	//사용자 정보 수정 Result
	@RequestMapping(value = "admin/adminUserUpdateResult")
	public String adminUserUpdateResult(UserInfo uDto) {
		
		service.adminUserUpdateResult(uDto);
		
		return "redirect:/admin/adminUserList";
	}
	
	
	//사용자 숨김(퇴사)
	@RequestMapping(value = "admin/adminUserRun")
	public String adminUserRun(UserInfo uDto) {
		
		service.adminUserRun(uDto);
		
		return "redirect:/admin/adminUserList";
	}
	
	//숨겨진 사용자 정보
	@RequestMapping(value = "admin/adminRunUserList")
	public String adminRunUserList() {
		
		return "admin/adminRunUserList";
	}
	
	//숨겨진 사용자 모든 정보
	@RequestMapping(value = "admin/adminRunUserListAjax")
	public String adminRunUserListAjax(@RequestParam(value = "cPage", defaultValue = "1")int cPage,
			@RequestParam(value = "searchSort", defaultValue = "")String searchSort,
			@RequestParam(value ="searchVal", defaultValue = "") String searchVal,
			Model model, HttpSession session) {
		logger.info("this is a adminUserList method");
		
		//검색 객체 값 넣기
				SearchDto searchDto = new SearchDto(searchSort, searchVal);
				
				//총 레코드 가져오기
				int nCount = service.selectUserListCount(searchDto);
				
				//현재 출력 페이지
				int curPage = cPage;
				
				//페이지 객체에 값 저장
				BoardPager boardPager = new BoardPager(nCount, curPage);
				
				//페이지 겍체에 검색 정보 저장
				boardPager.setSearchSort(searchSort);
				boardPager.setSearchVal(searchVal);
				
				//전체 리스트 출력
				List<UserInfo> adminRunUserAllList = service.selectAdminUserList(boardPager);
				model.addAttribute("adminRunUserAllList", adminRunUserAllList);
				model.addAttribute("boardPager", boardPager);
		
		
		
		
		return "admin/ajax/adminRunUserList_ajax";
	}
	
	//사용자 정보 완전 삭제(Delete)
	@RequestMapping(value = "admin/adminUserDelete")
	public String adminUserDelete(int u_id) {
		
		service.adminUserDelete(u_id);
		
		return "redirect:/admin/adminRunUserList";
	}
	
	
	
}//class end
