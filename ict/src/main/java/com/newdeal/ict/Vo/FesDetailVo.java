package com.newdeal.ict.Vo;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class FesDetailVo {
	private int detNum;
	private int memNum;
	private String detTitle;
	private String detContent;
	private Date detDate;
	private String detWriter;
	private int hit;
	
	public FesDetailVo(int detNum, int memNum, String detTitle, String detContent, Date detDate, String detWriter,
			int hit, List<CommonFileVo> list) {
		super();
		this.detNum = detNum;
		this.memNum = memNum;
		this.detTitle = detTitle;
		this.detContent = detContent;
		this.detDate = detDate;
		this.detWriter = detWriter;
		this.hit = hit;
		this.list = list;
	}



	public int getDetNum() {
		return detNum;
	}



	public void setDetNum(int detNum) {
		this.detNum = detNum;
	}



	public int getMemNum() {
		return memNum;
	}



	public void setMemNum(int memNum) {
		this.memNum = memNum;
	}



	public String getDetTitle() {
		return detTitle;
	}



	public void setDetTitle(String detTitle) {
		this.detTitle = detTitle;
	}



	public String getDetContent() {
		return detContent;
	}



	public void setDetContent(String detContent) {
		this.detContent = detContent;
	}



	public Date getDetDate() {
		return detDate;
	}



	public void setDetDate(Date detDate) {
		this.detDate = detDate;
	}



	public String getDetWriter() {
		return detWriter;
	}



	public void setDetWriter(String detWriter) {
		this.detWriter = detWriter;
	}



	public int getHit() {
		return hit;
	}



	public void setHit(int hit) {
		this.hit = hit;
	}



	public List<CommonFileVo> getList() {
		return list;
	}



	public void setList(List<CommonFileVo> list) {
		this.list = list;
	}



	private List<CommonFileVo> list;
	
	public FesDetailVo() {}
	
	

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.JSON_STYLE);
	}
}
