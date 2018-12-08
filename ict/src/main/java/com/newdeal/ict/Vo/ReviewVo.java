package com.newdeal.ict.Vo;

import java.sql.Date;
import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class ReviewVo {
	private int rvNum;
	private int memNum;
	private String rvTitle;
	private String rvContent;
	private Date rvDate;
	private String rvWriter;
	private int rvHit;
	private List<CommonFileVo> list;
	private String rvPart;
	
	public ReviewVo() {}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.JSON_STYLE);
	}

	public int getRvNum() {
		return rvNum;
	}

	public void setRvNum(int rvNum) {
		this.rvNum = rvNum;
	}

	public int getMemNum() {
		return memNum;
	}

	public void setMemNum(int memNum) {
		this.memNum = memNum;
	}

	public String getRvTitle() {
		return rvTitle;
	}

	public void setRvTitle(String rvTitle) {
		this.rvTitle = rvTitle;
	}

	public String getRvContent() {
		return rvContent;
	}

	public void setRvContent(String rvContent) {
		this.rvContent = rvContent;
	}

	public Date getRvDate() {
		return rvDate;
	}

	public void setRvDate(Date rvDate) {
		this.rvDate = rvDate;
	}

	public String getRvWriter() {
		return rvWriter;
	}

	public void setRvWriter(String rvWriter) {
		this.rvWriter = rvWriter;
	}

	public int getRvHit() {
		return rvHit;
	}

	public void setRvHit(int rvHit) {
		this.rvHit = rvHit;
	}

	public List<CommonFileVo> getList() {
		return list;
	}

	public void setList(List<CommonFileVo> list) {
		this.list = list;
	}
	

	public String getRvPart() {
		return rvPart;
	}

	public void setRvPart(String rvPart) {
		this.rvPart = rvPart;
	}

	public ReviewVo(int rvNum, int memNum, String rvTitle, String rvContent, Date rvDate, String rvWriter,
			int rvHit, List<CommonFileVo> list, String rvPart) {
		super();
		this.rvNum = rvNum;
		this.memNum = memNum;
		this.rvTitle = rvTitle;
		this.rvContent = rvContent;
		this.rvDate = rvDate;
		this.rvWriter = rvWriter;
		this.rvHit = rvHit;
		this.list = list;
		this.rvPart = rvPart;
	}

	
	
	
	
	
}
