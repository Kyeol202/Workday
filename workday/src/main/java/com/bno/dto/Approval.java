package com.bno.dto;

public class Approval {
	
	private int apv_id;
	private int u_id;
	private int d_id;
	private String apv_div;
	private String apv_ok;
	private String apv_start;
	private String apv_end;
	private String apv_aply;
	private String apv_aplydate;
	
	
	
	public Approval() {
		super();
	}



	public Approval(int apv_id, int u_id, int d_id, String apv_div, String apv_ok, String apv_start, String apv_end,
			String apv_aply, String apv_aplydate) {
		super();
		this.apv_id = apv_id;
		this.u_id = u_id;
		this.d_id = d_id;
		this.apv_div = apv_div;
		this.apv_ok = apv_ok;
		this.apv_start = apv_start;
		this.apv_end = apv_end;
		this.apv_aply = apv_aply;
		this.apv_aplydate = apv_aplydate;
	}


	//Getter & Setter
	public int getApv_id() {
		return apv_id;
	}



	public void setApv_id(int apv_id) {
		this.apv_id = apv_id;
	}



	public int getU_id() {
		return u_id;
	}



	public void setU_id(int u_id) {
		this.u_id = u_id;
	}



	public int getD_id() {
		return d_id;
	}



	public void setD_id(int d_id) {
		this.d_id = d_id;
	}



	public String getApv_div() {
		return apv_div;
	}



	public void setApv_div(String apv_div) {
		this.apv_div = apv_div;
	}



	public String getApv_ok() {
		return apv_ok;
	}



	public void setApv_ok(String apv_ok) {
		this.apv_ok = apv_ok;
	}



	public String getApv_start() {
		return apv_start;
	}



	public void setApv_start(String apv_start) {
		this.apv_start = apv_start;
	}



	public String getApv_end() {
		return apv_end;
	}



	public void setApv_end(String apv_end) {
		this.apv_end = apv_end;
	}



	public String getApv_aply() {
		return apv_aply;
	}



	public void setApv_aply(String apv_aply) {
		this.apv_aply = apv_aply;
	}



	public String getApv_aplydate() {
		return apv_aplydate;
	}



	public void setApv_aplydate(String apv_aplydate) {
		this.apv_aplydate = apv_aplydate;
	}



	@Override
	public String toString() {
		return "Approval [apv_id=" + apv_id + ", u_id=" + u_id + ", d_id=" + d_id + ", apv_div=" + apv_div + ", apv_ok="
				+ apv_ok + ", apv_start=" + apv_start + ", apv_end=" + apv_end + ", apv_aply=" + apv_aply
				+ ", apv_aplydate=" + apv_aplydate + "]";
	}
	
	
	
	
	
}//class end
