package com.bno.dto;

public class DepartmentDto {
	
	private int dp_id;				//부서번호
	private int emp_id;			//사원이름
	private String dp_name;	//부서이름
	
	
	
	public DepartmentDto() {
		super();
	}



	public DepartmentDto(int dp_id, int emp_id, String dp_name) {
		super();
		this.dp_id = dp_id;
		this.emp_id = emp_id;
		this.dp_name = dp_name;
	}



	public int getDp_id() {
		return dp_id;
	}



	public void setDp_id(int dp_id) {
		this.dp_id = dp_id;
	}



	public int getEmp_id() {
		return emp_id;
	}



	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}



	public String getDp_name() {
		return dp_name;
	}



	public void setDp_name(String dp_name) {
		this.dp_name = dp_name;
	}



	@Override
	public String toString() {
		return "DepartmentDto [dp_id=" + dp_id + ", emp_id=" + emp_id + ", dp_name=" + dp_name + "]";
	}
	
	
	
	
	
	
	
	
}//class end
