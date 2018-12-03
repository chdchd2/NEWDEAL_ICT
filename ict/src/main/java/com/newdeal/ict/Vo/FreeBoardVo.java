package com.newdeal.ict.Vo;

import java.util.Date;
import java.util.List;

public class FreeBoardVo {
	private int fbNum; //번호
	private String fbTitle; //제목
	private String fbContent;//내용
	private Date fbRegdate;//작성일
	private int fbViewcnt;//조회수
	private String fbWriter;//작성자
	private int fbCnt;//댓글수
	private String fbShow;//화면표시여부
	private List<CommonFileVo> list;
	
	//getter, setter, toString(), 기본생성자
	public int getFbNum() {
		return fbNum;
	}
	public void setFbNum(int fbNum) {
		this.fbNum = fbNum;
	}
	public String getFbTitle() {
		return fbTitle;
	}
	public void setFbTitle(String fbTitle) {
		this.fbTitle = fbTitle;
	}
	public String getFbContent() {
		return fbContent;
	}
	public void setFbContent(String fbContent) {
		this.fbContent = fbContent;
	}
	public Date getFbRegdate() {
		return fbRegdate;
	}
	public void setFbRegdate(Date fbRegdate) {
		this.fbRegdate = fbRegdate;
	}
	public int getFbViewcnt() {
		return fbViewcnt;
	}
	public void setFbViewcnt(int fbViewcnt) {
		this.fbViewcnt = fbViewcnt;
	}
	public String getFbWriter() {
		return fbWriter;
	}
	public void setFbWriter(String fbWriter) {
		this.fbWriter = fbWriter;
	}
	public int getFbCnt() {
		return fbCnt;
	}
	public void setFbCnt(int fbCnt) {
		this.fbCnt = fbCnt;
	}
	public String getFbShow() {
		return fbShow;
	}
	public void setFbShow(String fbShow) {
		this.fbShow = fbShow;
	}
	public List<CommonFileVo> getList() {
		return list;
	}
	public void setList(List<CommonFileVo> list) {
		this.list = list;
	}
	@Override
	public String toString() {
		return "FreeBoardVo [fbNum=" + fbNum + ", fbTitle=" + fbTitle + ", fbContent=" + fbContent + ", fbRegdate="
				+ fbRegdate + ", fbViewcnt=" + fbViewcnt + ", fbWriter=" + fbWriter + ", fbCnt=" + fbCnt + ", fbShow="
				+ fbShow + ", list=" + list + "]";
	}
	
	
}
