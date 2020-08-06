package com.bno.dto;

public class DeptInfo {
	
	private int d_id;
	private String d_name;
	
	
	
	public DeptInfo() {
		super();
	}



	public DeptInfo(int d_id, String d_name) {
		super();
		this.d_id = d_id;
		this.d_name = d_name;
	}


	//Getter & Setter
	public int getD_id() {
		return d_id;
	}



	public void setD_id(int d_id) {
		this.d_id = d_id;
	}



	public String getD_name() {
		return d_name;
	}



	public void setD_name(String d_name) {
		this.d_name = d_name;
	}



	@Override
	public String toString() {
		return "DeptInfo [d_id=" + d_id + ", d_name=" + d_name + "]";
	}
	
	
	
	
}//class end
