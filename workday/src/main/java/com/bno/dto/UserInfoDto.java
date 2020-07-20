package com.bno.dto;

public class UserInfoDto {
	
	private int u_id;				//사번
	private String u_name;		//사원이름
	private String position;			//직급
	private String u_phone;			//핸드폰번호
	private String u_email;				//이메일
	private String u_pwd; 		//비밀번호
	private String dp_name; 		//부서 이름
	
	
	
	public UserInfoDto() {
		super();
	}



	public UserInfoDto(int u_id, String u_name, String position, String u_phone, String u_email, String u_pwd,
			String dp_name) {
		super();
		this.u_id = u_id;
		this.u_name = u_name;
		this.position = position;
		this.u_phone = u_phone;
		this.u_email = u_email;
		this.u_pwd = u_pwd;
		this.dp_name = dp_name;
	}



	public int getU_id() {
		return u_id;
	}



	public void setU_id(int u_id) {
		this.u_id = u_id;
	}



	public String getU_name() {
		return u_name;
	}



	public void setU_name(String u_name) {
		this.u_name = u_name;
	}



	public String getPosition() {
		return position;
	}



	public void setPosition(String position) {
		this.position = position;
	}



	public String getU_phone() {
		return u_phone;
	}



	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
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



	public String getDp_name() {
		return dp_name;
	}



	public void setDp_name(String dp_name) {
		this.dp_name = dp_name;
	}



	@Override
	public String toString() {
		return "UserInfoDto [u_id=" + u_id + ", u_name=" + u_name + ", position=" + position + ", u_phone=" + u_phone
				+ ", u_email=" + u_email + ", u_pwd=" + u_pwd + ", dp_name=" + dp_name + "]";
	}

	
	

	
	
}//class end
