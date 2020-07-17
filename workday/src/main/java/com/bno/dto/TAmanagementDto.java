package com.bno.dto;

public class TAmanagementDto {
	
	private String ymd;			//년월일
	private String gto;			//출근시간
	private String ow;				//퇴근시간
	private char status;			//상태
	private String tardy;			//지각
	private String early;			//조퇴
	private int workinghour;	//근무시간
	
	
	
	public TAmanagementDto() {
		super();
	}



	public TAmanagementDto(String ymd, String gto, String ow, char status, String tardy, String early,
			int workinghour) {
		super();
		this.ymd = ymd;
		this.gto = gto;
		this.ow = ow;
		this.status = status;
		this.tardy = tardy;
		this.early = early;
		this.workinghour = workinghour;
	}



	public String getYmd() {
		return ymd;
	}



	public void setYmd(String ymd) {
		this.ymd = ymd;
	}



	public String getGto() {
		return gto;
	}



	public void setGto(String gto) {
		this.gto = gto;
	}



	public String getOw() {
		return ow;
	}



	public void setOw(String ow) {
		this.ow = ow;
	}



	public char getStatus() {
		return status;
	}



	public void setStatus(char status) {
		this.status = status;
	}



	public String getTardy() {
		return tardy;
	}



	public void setTardy(String tardy) {
		this.tardy = tardy;
	}



	public String getEarly() {
		return early;
	}



	public void setEarly(String early) {
		this.early = early;
	}



	public int getWorkinghour() {
		return workinghour;
	}



	public void setWorkinghour(int workinghour) {
		this.workinghour = workinghour;
	}



	@Override
	public String toString() {
		return "TAmanagementDto [ymd=" + ymd + ", gto=" + gto + ", ow=" + ow + ", status=" + status + ", tardy=" + tardy
				+ ", early=" + early + ", workinghour=" + workinghour + "]";
	}
	
	
	
	
	
}//class end
