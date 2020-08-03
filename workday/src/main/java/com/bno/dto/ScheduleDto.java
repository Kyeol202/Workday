package com.bno.dto;

public class ScheduleDto {
	
	private String subject;				//제목
	private String startDate;			//시작날짜
	private String endDate;				//끝나는 날짜
	private String memo;				//메모
	
	
	
	public ScheduleDto() {
		super();
	}



	public ScheduleDto(String subject, String startDate, String endDate, String memo) {
		super();
		this.subject = subject;
		this.startDate = startDate;
		this.endDate = endDate;
		this.memo = memo;
	}



	public String getSubject() {
		return subject;
	}



	public void setSubject(String subject) {
		this.subject = subject;
	}



	public String getStartDate() {
		return startDate;
	}



	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}



	public String getEndDate() {
		return endDate;
	}



	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}



	public String getMemo() {
		return memo;
	}



	public void setMemo(String memo) {
		this.memo = memo;
	}



	@Override
	public String toString() {
		return "ScheduleDto [subject=" + subject + ", startDate=" + startDate + ", endDate=" + endDate + ", memo="
				+ memo + "]";
	}
	
	
	
	
	
	
	
}//class end
