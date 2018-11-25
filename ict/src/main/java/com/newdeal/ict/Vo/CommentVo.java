package com.newdeal.ict.Vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class CommentVo {
	private int comNum;
	private int memNum;
	private String comContent;
	private String comType;
	private int comBnum;
	
	
	public CommentVo() {}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.JSON_STYLE);
	}

	
	public int getComNum() {
		return comNum;
	}



	public void setComNum(int comNum) {
		this.comNum = comNum;
	}



	public int getMemNum() {
		return memNum;
	}



	public void setMemNum(int memNum) {
		this.memNum = memNum;
	}



	public String getComContent() {
		return comContent;
	}



	public void setComContent(String comContent) {
		this.comContent = comContent;
	}



	public String getComType() {
		return comType;
	}



	public void setComType(String comType) {
		this.comType = comType;
	}



	public int getComBnum() {
		return comBnum;
	}



	public void setComBnum(int comBnum) {
		this.comBnum = comBnum;
	}



	public CommentVo(int comNum, int memNum, String comContent, String comType, int comBnum) {
		super();
		this.comNum = comNum;
		this.memNum = memNum;
		this.comContent = comContent;
		this.comType = comType;
		this.comBnum = comBnum;
	}
	
	
}
