package com.bno.dto;

public class EmployeesDto {
	
	private int emp_id;				//사번
	private String emp_name;		//사원이름
	private String position;			//직급
	private String phone;			//핸드폰번호
	private String email;				//이메일
	
	
	
	public EmployeesDto() {
		super();
	}



	public EmployeesDto(int emp_id, String emp_name, String position, String phone, String email) {
		super();
		this.emp_id = emp_id;
		this.emp_name = emp_name;
		this.position = position;
		this.phone = phone;
		this.email = email;
	}



	public int getEmp_id() {
		return emp_id;
	}



	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}



	public String getEmp_name() {
		return emp_name;
	}



	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}



	public String getPosition() {
		return position;
	}



	public void setPosition(String position) {
		this.position = position;
	}



	public String getPhone() {
		return phone;
	}



	public void setPhone(String phone) {
		this.phone = phone;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	@Override
	public String toString() {
		return "EmployeesDto [emp_id=" + emp_id + ", emp_name=" + emp_name + ", position=" + position + ", phone="
				+ phone + ", email=" + email + "]";
	}

	

	
	
}//class end
