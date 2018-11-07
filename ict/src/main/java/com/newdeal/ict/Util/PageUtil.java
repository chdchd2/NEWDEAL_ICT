package com.newdeal.ict.Util;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class PageUtil {
	private int pageNum=1;//��������ȣ
	private int startRow; //������
	private int endRow;  //����
	private int totalPageCount; //�� ������ ����
	private int startPageNum; // ������������ȣ
	private int endPageNum; //�� ��������ȣ
	private int rowBlockCount; // �� �������� ������ ���� ����
	private int pageBlockCount; //ȭ�鿡 ������ ������ ����
	private int totalRowCount; //�� �� ����
	private String searchKeyword;
	private String searchCondition;
	
	public PageUtil() {
		this.pageNum = 1;
		this.rowBlockCount = 10; //���������� �����ִ� �ټ�.
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
