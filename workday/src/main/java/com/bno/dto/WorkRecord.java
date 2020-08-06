package com.bno.dto;

public class WorkRecord {
	
	private int u_id;
	private int d_id;
	private int w_id;
	private String w_in;
	private String w_out;
	private int w_time;
	private String w_status;
	private String w_reason;
	
	public WorkRecord() {
		super();
	}

	public WorkRecord(int u_id, int d_id, int w_id, String w_in, String w_out, int w_time, String w_status,
			String w_reason) {
		super();
		this.u_id = u_id;
		this.d_id = d_id;
		this.w_id = w_id;
		this.w_in = w_in;
		this.w_out = w_out;
		this.w_time = w_time;
		this.w_status = w_status;
		this.w_reason = w_reason;
	}
	
	
	//Getter & Setter
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

	public int getW_id() {
		return w_id;
	}

	public void setW_id(int w_id) {
		this.w_id = w_id;
	}

	public String getW_in() {
		return w_in;
	}

	public void setW_in(String w_in) {
		this.w_in = w_in;
	}

	public String getW_out() {
		return w_out;
	}

	public void setW_out(String w_out) {
		this.w_out = w_out;
	}

	public int getW_time() {
		return w_time;
	}

	public void setW_time(int w_time) {
		this.w_time = w_time;
	}

	public String getW_status() {
		return w_status;
	}

	public void setW_status(String w_status) {
		this.w_status = w_status;
	}

	public String getW_reason() {
		return w_reason;
	}

	public void setW_reason(String w_reason) {
		this.w_reason = w_reason;
	}

	@Override
	public String toString() {
		return "WorkRecord [u_id=" + u_id + ", d_id=" + d_id + ", w_id=" + w_id + ", w_in=" + w_in + ", w_out=" + w_out
				+ ", w_time=" + w_time + ", w_status=" + w_status + ", w_reason=" + w_reason + "]";
	}
	
	
	
	
	
	
	
	
}//class end
