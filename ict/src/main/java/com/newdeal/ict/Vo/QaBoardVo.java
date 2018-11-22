package com.newdeal.ict.Vo;

import java.util.Date;

public class QaBoardVo {
	private int qaNum;
	private String qaWriter;
	private String qaTitle;
	private String qaContent;
	private Date qaRegdate;
	private int qaViewcnt;
	private String qaShow;
	private int qaRef;
	private int qaStep;
	private int qaLevel;
	public int getQaNum() {
		return qaNum;
	}
	public void setQaNum(int qaNum) {
		this.qaNum = qaNum;
	}
	public String getQaWriter() {
		return qaWriter;
	}
	public void setQaWriter(String qaWriter) {
		this.qaWriter = qaWriter;
	}
	public String getQaTitle() {
		return qaTitle;
	}
	public void setQaTitle(String qaTitle) {
		this.qaTitle = qaTitle;
	}
	public String getQaContent() {
		return qaContent;
	}
	public void setQaContent(String qaContent) {
		this.qaContent = qaContent;
	}
	public Date getQaRegdate() {
		return qaRegdate;
	}
	public void setQaRegdate(Date qaRegdate) {
		this.qaRegdate = qaRegdate;
	}
	public int getQaViewcnt() {
		return qaViewcnt;
	}
	public void setQaViewcnt(int qaViewcnt) {
		this.qaViewcnt = qaViewcnt;
	}
	public String getQaShow() {
		return qaShow;
	}
	public void setQaShow(String qaShow) {
		this.qaShow = qaShow;
	}
	public int getQaRef() {
		return qaRef;
	}
	public void setQaRef(int qaRef) {
		this.qaRef = qaRef;
	}
	public int getQaStep() {
		return qaStep;
	}
	public void setQaStep(int qaStep) {
		this.qaStep = qaStep;
	}
	public int getQaLevel() {
		return qaLevel;
	}
	public void setQaLevel(int qaLevel) {
		this.qaLevel = qaLevel;
	}
	
	@Override
	public String toString() {
		return "QaBoardVo [qaNum=" + qaNum + ", qaWriter=" + qaWriter + ", qaTitle=" + qaTitle + ", qaContent="
				+ qaContent + ", qaRegdate=" + qaRegdate + ", qaViewcnt=" + qaViewcnt + ", qaShow=" + qaShow
				+ ", qaRef=" + qaRef + ", qaStep=" + qaStep + ", qaLevel=" + qaLevel + "]";
	}
	
	
	
	
}
