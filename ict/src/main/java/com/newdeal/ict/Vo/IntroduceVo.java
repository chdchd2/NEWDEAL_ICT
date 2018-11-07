package com.newdeal.ict.Vo;

import java.sql.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class IntroduceVo {
	private int intNum;
	private int memNum;
	private String intTitle;
	private String intContent;
	private String intWriter;
	private Date intDate;
	private int intHit;
	
	public IntroduceVo() {}
	
	
	


	public IntroduceVo(int intNum, int memNum, String intTitle, String intContent, String intWriter, Date intDate,
			int intHit) {
		super();
		this.intNum = intNum;
		this.memNum = memNum;
		this.intTitle = intTitle;
		this.intContent = intContent;
		this.intWriter = intWriter;
		this.intDate = intDate;
		this.intHit = intHit;
	}





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





	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.JSON_STYLE);
	}
}
