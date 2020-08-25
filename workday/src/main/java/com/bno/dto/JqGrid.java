package com.bno.dto;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class JqGrid {
	
	private int page;
	private int records;
	private int total;
	private List<Map<String, Object>> rows = new ArrayList<Map<String,Object>>();
	
	
	
	public JqGrid() {
		super();
	}



	public JqGrid(int page, int records, List<Map<String, Object>> rows, int total) {
		super();
		this.page = page;
		this.records = records;
		this.rows = rows;
		this.total = total;
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



	public List<Map<String, Object>> getrows() {
		return rows;
	}



	public void setrows(List<Map<String, Object>> rows) {
		this.rows = rows;
	}



	public int getTotal() {
		return total;
	}



	public void setTotal(int total) {
		this.total = total;
	}



	@Override
	public String toString() {
		return "JqGrid [page=" + page + ", records=" + records + ", total=" + total + ", rows=" + rows + "]";
	}

	
	
	
	
	
	
}//class end
