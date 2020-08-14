package com.bno.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bno.common.CheckNull;
import com.bno.dto.BoardPager;
import com.bno.dto.JoinDto;
import com.bno.dto.SearchDto;
import com.bno.dto.UserInfo;
import com.bno.dto.WorkRecord;
import com.bno.service.WorkRecordService;

@Controller
public class WorkRecordController {
	
	private static Logger logger = LoggerFactory.getLogger(WorkRecordController.class);
	
	@Autowired
	private WorkRecordService service;
	
	
	
	//출근리스트화면
	@RequestMapping(value = "user/userWorkList")
	public String userWorkList() {
		
		
		
		return"work/userWorkList";
	}
	
	//사용자 출근
	@RequestMapping(value = "user/userWorkIn")
	public String userWorkIn(HttpSession session, WorkRecord wDto) {
	logger.info("this is a userWorkIn method");
		UserInfo user = (UserInfo) session.getAttribute("loginUser");
		String path = "";
		
		//날짜형식 yyyy-mm-dd
		SimpleDateFormat workin = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		String today = workin.format(cal.getTime()).substring(0, 10); 
		
		//9시 기준
		SimpleDateFormat standardTime = new SimpleDateFormat("yyyyMMdd0900");
		String standard = standardTime.format(cal.getTime());
		
		//현재시간
		SimpleDateFormat currentTime = new SimpleDateFormat("yyyyMMddHHmm");
		String current = currentTime.format(cal.getTime());
		System.out.println(today);
		
		int result = standard.compareTo(current);
		
		//근태관리 출근 날짜 리스트 출력
		List<WorkRecord> inOutList = service.inOutAllList(wDto);
//		for(int i =0; i < inOutList.size(); i++) {
			
//			System.out.println(inOutList.get(i).getW_in());
//			System.out.println(inOutList.get(i).getU_id());
//			유저 세션이 null이 아니고 출근날짜 리스트에 출근시간이 null이면 출근 insert
			if(user != null && result >= 0) {
//				if(inOutList.get(i).getW_in() == null) {
					service.userWorkIn(wDto);
					path = "redirect:/user/userWorkList";
//				}
//				 else if (inOutList.get(i).getW_in().substring(0, 10).equals(today)) {
//					
//					path = "redirect:/user/userWorkList";
//				}
					
				}
				else if(user != null &&result < 0) {
					service.userWorkLate(wDto);
					path = "redirect:/user/userWorkList";
				} 
				else path = "redirect:/user/userlogin";
//		}
		
		return path;
	}
	
	//근태관리 전체 출퇴근 조회(페이징)
	@RequestMapping(value = "user/userworkListAjax")
	public String userworkListAjax(@RequestParam(value = "cPage", defaultValue = "1")int cPage,
			@RequestParam(value = "searchSort", defaultValue = "")String searchSort,
			@RequestParam(value ="searchVal", defaultValue = "") String searchVal,
			Model model, HttpSession session) {
		logger.info("this is a userWorkListAjax method");
		
		UserInfo user = (UserInfo) session.getAttribute("loginUser");
		model.addAttribute("user", user);
		
		//검색 객체 값 넣기
		SearchDto searchDto = new SearchDto(searchSort, searchVal);
		
		//총 레코드 가져오기
		int nCount = service.selectUserCount(searchDto);
		
		//현재 출력 페이지
		int curPage = cPage;
		
		//페이지 객체에 값 저장
		BoardPager boardPager = new BoardPager(nCount, curPage);
		
		//페이지 겍체에 검색 정보 저장
		boardPager.setSearchSort(searchSort);
		boardPager.setSearchVal(searchVal);
		
		//전체 출퇴근 조회(페이징)
		List<JoinDto> workAllList = service.selectUserAllList(boardPager);
		model.addAttribute("workAllList", workAllList);
		model.addAttribute("boardPager", boardPager);
		
		
		
		return "work/ajax/userWorkList_ajax";
	}
	
		//사용자 근무 상세보기
		@RequestMapping(value = "user/WorkRecordSelectOne")
		public String WorkRecordSelectOne(int w_id, Model model, HttpSession session) {
			
			UserInfo user = (UserInfo) session.getAttribute("loginUser");
			model.addAttribute("user", user);
			
			WorkRecord workRecord = service.workRecordSelectOne(w_id);
			model.addAttribute("workRecord", workRecord);
			System.out.println(workRecord);
			
			
			return "work/userWorkRecordSelectOne";
		}
	
		
		//사용자 퇴근
		@RequestMapping(value ="user/userWorkOut")
		public String userWorkOut(@RequestParam("w_id")int w_id, HttpSession session, WorkRecord wDto) {
			
			UserInfo user = (UserInfo) session.getAttribute("loginUser");
			String path = "";
			
			//날짜형식 yyyy-mm-dd
			SimpleDateFormat workin = new SimpleDateFormat("yyyy-MM-dd");
			Calendar cal = Calendar.getInstance();
			String today = workin.format(cal.getTime()).substring(0, 10); 
			
			//현재시간
			SimpleDateFormat currentTime = new SimpleDateFormat("yyyyMMddHHmm");
			String late = currentTime.format(cal.getTime());
			System.out.println(today);
			
			//근태관리 출근 날짜 리스트 출력
			List<WorkRecord> inOutList = service.inOutAllList(wDto);
			
			if(user != null) {
		
					service.userWorkOut(w_id);
					path = "forward:/user/userwTime";
			
					
					
					
				}
				
	
				
				
				
			
			else path = "work/userWorkList";
			
			
			
			
			return path;
		}
		
		//사용자 근무 시간
		@RequestMapping(value = "user/userwTime")
		public String userwTime(int w_id) {
			
			service.updateWTime(w_id);
			
			return "redirect:/user/userWorkList";
		}
		
		//사용자 상태 업데이트(조퇴)
		@RequestMapping(value = "user/userStatusReasonUpdate")
		public String userStatusReasonUpdate(WorkRecord wDto, 
				RedirectAttributes redirectAttribute, HttpSession session) {
			
			UserInfo user = (UserInfo) session.getAttribute("loginUser");
			String path = "";
			
			//날짜형식 yyyy-mm-dd
			SimpleDateFormat workin = new SimpleDateFormat("yyyy-MM-dd");
			Calendar cal = Calendar.getInstance();
			String today = workin.format(cal.getTime()).substring(0, 10); 
			
			//현재시간
			SimpleDateFormat currentTime = new SimpleDateFormat("yyyyMMddHHmm");
			String late = currentTime.format(cal.getTime());
			System.out.println(today);
			
			//근태관리 출근 날짜 리스트 출력
			List<WorkRecord> inOutList = service.inOutAllList(wDto);
			
			if(user !=null) {
				
						service.statusReasonUpdate(wDto);
						service.userWorkOut(wDto.getW_id());
						service.updateWTime(wDto.getW_id());
						path =  "redirect:/user/userWorkList";
					}
						
						
						path = "work/userWorkList";
;
			
			
			return path;
		}
		
//-----------------------------------------------------------------------관리자-----------------------------------------------------------
		
		//사용자 근무기록 삭제
		@RequestMapping(value = "admin/userWorkDelete")
		public String userWorkDelete(int w_id) {
			service.userWorkDelete(w_id);
			return "redirect:/user/userWorkList";
		}
		
		
		//출근리스트 관리자 화면
				@RequestMapping(value = "admin/adminWorkList")
				public String adminWorkList() {



					return"admin/adminWorkList";
				}


				//근태관리 전체 출퇴근 조회(페이징)
				@RequestMapping(value = "admin/adminworkListAjax")
				public String adminworkListAjax(@RequestParam(value = "cPage", defaultValue = "1")int cPage,
						@RequestParam(value = "searchSort", defaultValue = "")String searchSort,
						@RequestParam(value ="searchVal", defaultValue = "") String searchVal,
						Model model, HttpSession session) {
					logger.info("this is a userWorkListAjax method");

					UserInfo user = (UserInfo) session.getAttribute("loginUser");
					model.addAttribute("user", user);

					//검색 객체 값 넣기
					SearchDto searchDto = new SearchDto(searchSort, searchVal);

					//총 레코드 가져오기
					int nCount = service.selectUserCount(searchDto);

					//현재 출력 페이지
					int curPage = cPage;

					//페이지 객체에 값 저장
					BoardPager boardPager = new BoardPager(nCount, curPage);

					//페이지 겍체에 검색 정보 저장
					boardPager.setSearchSort(searchSort);
					boardPager.setSearchVal(searchVal);

					//전체 출퇴근 조회(페이징)
					List<JoinDto> workAllList = service.selectUserAllList(boardPager);
					model.addAttribute("workAllList", workAllList);
					model.addAttribute("boardPager", boardPager);



					return "admin/ajax/adminWorkList_ajax";
				}
	
}//class end!
