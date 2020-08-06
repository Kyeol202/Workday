package com.bno.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bno.dao.WorkRecordDao;
import com.bno.dto.WorkRecord;

@Service
public class WrokRecordServiceImpl implements WorkRecordService {
	
	
	@Autowired
	private WorkRecordDao dao;
	
	
	//사용자 출근 입력
	@Override
	public void userWorkIn(WorkRecord dto) {
		
		dao.userWorkIn(dto);
	}
	
	
	
	
}//class end
