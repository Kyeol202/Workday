package com.bno.dto;

public class JoinDto {
	
	private int u_id;
	private int d_id;
	private String u_email;
	private String u_pwd;
	private String u_name;
	private String u_position;
	private String u_phone;
	private String u_status;
	private int apv_id;					
	private String apv_div;
	private String apv_ok;
	private String apv_start;
	private String apv_end;
	private String apv_aply;
	private String apv_aplydate;
	private int w_id;
	private String w_in;
	private String w_out;
	private int w_time;
	private String w_status;
	private String w_reason;
	
	public JoinDto() {
		super();
	}

	

	public JoinDto(int u_id, int d_id, String u_email, String u_pwd, String u_name, String u_position, String u_phone,
			String u_status, int apv_id, String apv_div, String apv_ok, String apv_start, String apv_end,
			String apv_aply, String apv_aplydate, int w_id, String w_in, String w_out, int w_time, String w_status,
			String w_reason) {
		super();
		this.u_id = u_id;
		this.d_id = d_id;
		this.u_email = u_email;
		this.u_pwd = u_pwd;
		this.u_name = u_name;
		this.u_position = u_position;
		this.u_phone = u_phone;
		this.u_status = u_status;
		this.apv_id = apv_id;
		this.apv_div = apv_div;
		this.apv_ok = apv_ok;
		this.apv_start = apv_start;
		this.apv_end = apv_end;
		this.apv_aply = apv_aply;
		this.apv_aplydate = apv_aplydate;
		this.w_id = w_id;
		this.w_in = w_in;
		this.w_out = w_out;
		this.w_time = w_time;
		this.w_status = w_status;
		this.w_reason = w_reason;
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

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getU_pwd() {
		return u_pwd;
	}

	public void setU_pwd(String u_pwd) {
		this.u_pwd = u_pwd;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_position() {
		return u_position;
	}

	public void setU_position(String u_position) {
		this.u_position = u_position;
	}

	public String getU_phone() {
		return u_phone;
	}

	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}
	
	

	public String getU_status() {
		return u_status;
	}



	public void setU_status(String u_status) {
		this.u_status = u_status;
	}



	public int getApv_id() {
		return apv_id;
	}

	public void setApv_id(int apv_id) {
		this.apv_id = apv_id;
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
		return "JoinDto [u_id=" + u_id + ", d_id=" + d_id + ", u_email=" + u_email + ", u_pwd=" + u_pwd + ", u_name="
				+ u_name + ", u_position=" + u_position + ", u_phone=" + u_phone + ", u_status=" + u_status
				+ ", apv_id=" + apv_id + ", apv_div=" + apv_div + ", apv_ok=" + apv_ok + ", apv_start=" + apv_start
				+ ", apv_end=" + apv_end + ", apv_aply=" + apv_aply + ", apv_aplydate=" + apv_aplydate + ", w_id="
				+ w_id + ", w_in=" + w_in + ", w_out=" + w_out + ", w_time=" + w_time + ", w_status=" + w_status
				+ ", w_reason=" + w_reason + "]";
	}


	
	
	
	
	
	
	
	
}//class end
