package com.bno.dto;

public class TAmanagementDto {
	
	private String ymd;			//년월일
	private int u_id;			//사번
	private String gto;			//출근시간
	private String ow;				//퇴근시간
	private char status;			//상태
	private int workinghour;	//근무시간
	
	
	
	public TAmanagementDto() {
		super();
	}



	public TAmanagementDto(String ymd, int u_id, String gto, String ow, char status, int workinghour) {
		super();
		this.ymd = ymd;
		this.u_id = u_id;
		this.gto = gto;
		this.ow = ow;
		this.status = status;
		this.workinghour = workinghour;
	}



	public String getYmd() {
		return ymd;
	}



	public void setYmd(String ymd) {
		this.ymd = ymd;
	}



	public int getU_id() {
		return u_id;
	}



	public void setU_id(int u_id) {
		this.u_id = u_id;
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



	public int getWorkinghour() {
		return workinghour;
	}



	public void setWorkinghour(int workinghour) {
		this.workinghour = workinghour;
	}



	@Override
	public String toString() {
		return "TAmanagementDto [ymd=" + ymd + ", u_id=" + u_id + ", gto=" + gto + ", ow=" + ow + ", status=" + status
				+ ", workinghour=" + workinghour + "]";
	}

	
	

	
	
	
	
	
	
}//class end
