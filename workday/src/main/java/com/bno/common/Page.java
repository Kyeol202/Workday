package com.bno.common;

public class Page {
	
	private int page;
	private int pageNum;
	
	
	public Page(int page, int pageNum) {
		super();
		this.page = 1;
		this.pageNum = 10;
	}

	//Getter & Setter
	public int getPageStart() {
			
		return (this.page-1) * pageNum;
		
	}


	public int getPage() {
		return page;
	}


	public void setPage(int page) {
		if(page <=0) {
			this.page = 1;
		} 
		else {
			this.page = page;
		}
	}


	public int getPageNum() {
		return pageNum;
	}


	public void setPageNum(int pageNum) {
		if(pageNum <=0 || pageNum > 100) {
			this.pageNum = 10;
		}
		else {
			this.pageNum = pageNum;
		}
	}


	@Override
	public String toString() {
		return "Page [page=" + page + ", pageNum=" + pageNum + "]";
	}
	
	
	
	
}//class end
