package com.newdeal.ict.Util;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class PageUtil {
	private int pageNum=1;//페이지번호
	private int startRow; //시작행
	private int endRow;  //끝행
	private int totalPageCount; //총 페이지 갯수
	private int startPageNum; // 시작페이지번호
	private int endPageNum; //끝 페이지번호
	private int rowBlockCount; // 한 페이지에 보여줄 글의 갯수
	private int pageBlockCount; //화면에 보여줄 페이지 갯수
	private int totalRowCount; //총 글 갯수
	private String searchKeyword;
	private String searchCondition;
	
	public PageUtil() {
		this.pageNum = 1;
		this.rowBlockCount = 10; //한페이지당 보여주는 줄수.
		this.pageBlockCount = 10; //
	}
	public PageUtil(int pageNum,int rowBlockCount,int pageBlockCount,int totalRowCount) {
		this.pageNum=pageNum;
		this.rowBlockCount=rowBlockCount;
		this.pageBlockCount=pageBlockCount;
		this.totalRowCount=totalRowCount;
		
		startRow=(pageNum-1)*rowBlockCount+1;
		endRow=startRow+rowBlockCount-1; 
		totalPageCount=(int)Math.ceil(totalRowCount/(double)rowBlockCount); 
		startPageNum=(pageNum-1)/pageBlockCount*pageBlockCount+1;
		endPageNum=startPageNum+pageBlockCount-1;
		if(endPageNum>totalPageCount) {
			endPageNum=totalPageCount;
		}
	}
	public int getPageNum() {
		return pageNum;
	}
	public int getStartRow() {
		return startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public int getTotalPageCount() {
		return totalPageCount;
	}
	public int getStartPageNum() {
		return startPageNum;
	}
	public int getEndPageNum() {
		return endPageNum;
	}
	public int getRowBlockCount() {
		return rowBlockCount;
	}
	public int getPageBlockCount() {
		return pageBlockCount;
	}
	public int getTotalRowCount() {
		return totalRowCount;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.JSON_STYLE);
	}
}
