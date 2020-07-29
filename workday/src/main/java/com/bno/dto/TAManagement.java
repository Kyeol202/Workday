package com.bno.dto;

public class TAManagement {
	
	private int ta_id;				//일련번호
	private int u_id;				//사번
	private String gto;			//출근시간
	private String ow;				//퇴근시간
	private char status;			//상태
	private String workinghour;	//근무시간
	
	
	
	public TAManagement() {
		super();
	}




	public char getStatus() {
		return status;
	}






	public void setStatus(char status) {
		this.status = status;
	}






	public TAManagement(int ta_id, int u_id, String gto, String ow, char status, String workinghour) {
		super();
		this.ta_id = ta_id;
		this.u_id = u_id;
		this.gto = gto;
		this.ow = ow;
		this.status = status;
		this.workinghour = workinghour;
	}






	public int getTa_id() {
		return ta_id;
	}



	public void setTa_id(int ta_id) {
		this.ta_id = ta_id;
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






	public String getWorkinghour() {
		return workinghour;
	}



	public void setWorkinghour(String workinghour) {
		this.workinghour = workinghour;
	}


	




	@Override
	public String toString() {
		return "TAManagement [ta_id=" + ta_id + ", u_id=" + u_id + ", gto=" + gto + ", ow=" + ow + ", status=" + status
				+ ", workinghour=" + workinghour + "]";
	}





	
	
	
	
}//class end
