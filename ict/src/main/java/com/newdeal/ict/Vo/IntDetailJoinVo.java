package com.newdeal.ict.Vo;

import java.sql.Date;
import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class IntDetailJoinVo {
	private int intNum;
	private int memNum;
	private String intTitle;
	private String intContent;
	private String intWriter;
	private Date intDate;
	private int intHit;
	private List<CommonFileVo> list;
	
	public IntDetailJoinVo() {}
	 
	 
	public int getIntNum() {
		return intNum;
	}


	public void setIntNum(int intNum) {
		this.intNum = intNum;
	}


	public int getMemNum() {
		return memNum;
	}


	public void setMemNum(int memNum) {
		this.memNum = memNum;
	}


	public String getIntTitle() {
		return intTitle;
	}


	public void setIntTitle(String intTitle) {
		this.intTitle = intTitle;
	}


	public String getIntContent() {
		return intContent;
	}


	public void setIntContent(String intContent) {
		this.intContent = intContent;
	}


	public String getIntWriter() {
		return intWriter;
	}


	public void setIntWriter(String intWriter) {
		this.intWriter = intWriter;
	}


	public Date getIntDate() {
		return intDate;
	}


	public void setIntDate(Date intDate) {
		this.intDate = intDate;
	}


	public int getIntHit() {
		return intHit;
	}


	public void setIntHit(int intHit) {
		this.intHit = intHit;
	}


	public List<CommonFileVo> getList() {
		return list;
	}


	public void setList(List<CommonFileVo> list) {
		this.list = list;
	}


	public IntDetailJoinVo(int intNum, int memNum, String intTitle, String intContent, String intWriter, Date intDate,
			int intHit, List<CommonFileVo> list) {
		super();
		this.intNum = intNum;
		this.memNum = memNum;
		this.intTitle = intTitle;
		this.intContent = intContent;
		this.intWriter = intWriter;
		this.intDate = intDate;
		this.intHit = intHit;
		this.list = list;
	}


	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.JSON_STYLE);
	}

}
