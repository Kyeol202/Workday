package com.bno.dto;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class JqGrid {
	
	private int page;
	private int records;
	private List<Map<String, Object>> ros = new ArrayList<Map<String,Object>>();
	
	
	
	public JqGrid() {
		super();
	}



	public JqGrid(int page, int records, List<Map<String, Object>> ros) {
		super();
		this.page = page;
		this.records = records;
		this.ros = ros;
	}



	public int getPage() {
		return page;
	}



	public void setPage(int page) {
		this.page = page;
	}



	public int getRecords() {
		return records;
	}



	public void setRecords(int records) {
		this.records = records;
	}



	public List<Map<String, Object>> getRos() {
		return ros;
	}



	public void setRos(List<Map<String, Object>> ros) {
		this.ros = ros;
	}



	@Override
	public String toString() {
		return "JqGrid [page=" + page + ", records=" + records + ", ros=" + ros + "]";
	}
	
	
	
	
	
	
	
	
	
}//class end
