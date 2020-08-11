package com.bno.dto;

public class UserInfo {
	
	private int u_id;
	private int d_id;
	private String u_email;
	private String u_pwd;
	private String u_name;
	private String u_position;
	private String u_phone;
	private String u_status;
	
	public UserInfo() {
		super();
	}

	
	
	public UserInfo(int u_id, int d_id, String u_email, String u_pwd, String u_name, String u_position, String u_phone,
			String u_status) {
		super();
		this.u_id = u_id;
		this.d_id = d_id;
		this.u_email = u_email;
		this.u_pwd = u_pwd;
		this.u_name = u_name;
		this.u_position = u_position;
		this.u_phone = u_phone;
		this.u_status = u_status;
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

	public String getU_status() {
		return u_status;
	}



	public void setU_status(String u_status) {
		this.u_status = u_status;
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



	@Override
	public String toString() {
		return "UserInfo [u_id=" + u_id + ", d_id=" + d_id + ", u_email=" + u_email + ", u_pwd=" + u_pwd + ", u_name="
				+ u_name + ", u_position=" + u_position + ", u_phone=" + u_phone + ", u_status=" + u_status + "]";
	}


	
	
	
	
	
}//class end
