package com.newdeal.ict.Vo;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class FestivalVo {
	private int fesNum;
	private String fesTitle;
	private String fesContent;
	private Date fesDate;
	private String fesWrite;
	private int fesHit;
	private int memNum;
	private List<FestivalVo> list;
	
	public FestivalVo() {}
	
	
	public String getFesContent() {
		return fesContent;
	}

	public FestivalVo(int fesNum, String fesTitle, String fesContent, Date fesDate, String fesWrite, int fesHit,
			int memNum, List<FestivalVo> list) {
		super();
		this.fesNum = fesNum;
		this.fesTitle = fesTitle;
		this.fesContent = fesContent;
		this.fesDate = fesDate;
		this.fesWrite = fesWrite;
		this.fesHit = fesHit;
		this.memNum = memNum;
		this.list = list;
	}

	public void setFesContent(String fesContent) {
		this.fesContent = fesContent;
	}

	
	public int getFesNum() {
		return fesNum;
	}
	public void setFesNum(int fesNum) {
		this.fesNum = fesNum;
	}
	public String getFesTitle() {
		return fesTitle;
	}
	public void setFesTitle(String fesTitle) {
		this.fesTitle = fesTitle;
	}
	public Date getFesDate() {
		return fesDate;
	}
	public void setFesDate(Date fesDate) {
		this.fesDate = fesDate;
	}
	public String getFesWrite() {
		return fesWrite;
	}
	public void setFesWrite(String fesWrite) {
		this.fesWrite = fesWrite;
	}
	public int getFesHit() {
		return fesHit;
	}
	public void setFesHit(int fesHit) {
		this.fesHit = fesHit;
	}
	public int getMemNum() {
		return memNum;
	}
	public void setMemNum(int memNum) {
		this.memNum = memNum;
	}
	public List<FestivalVo> getList() {
		return list;
	}
	public void setList(List<FestivalVo> list) {
		this.list = list;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.JSON_STYLE);
	}
}
