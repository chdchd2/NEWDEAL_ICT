package com.newdeal.ict.Vo;

import java.util.Date;
import java.util.List;

public class QaBoardVo {
	private int qaNum; //번호
	private String qaTitle; //제목
	private String qaContent;//내용
	private Date qaRegdate;//작성일
	private int qaViewcnt;//조회수
	private String qaWriter;//작성자
	private int qaCnt;//댓글수
	private String qaShow;//화면표시여부
	private int qaRef;//최상위부모번호(신규입력시1부터차례대로증가)
	private int qaStep;//리플의 순번
	private int qaLevel;//리플의 depth
	private List<CommonFileVo> list; //파일
	  
	public int getQaNum() {
		return qaNum;
	}
	public void setQaNum(int qaNum) {
		this.qaNum = qaNum;
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
	public String getQaWriter() {
		return qaWriter;
	}
	public void setQaWriter(String qaWriter) {
		this.qaWriter = qaWriter;
	}
	public int getQaCnt() {
		return qaCnt;
	}
	public void setQaCnt(int qaCnt) {
		this.qaCnt = qaCnt;
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
	public List<CommonFileVo> getList() {
		return list;
	}
	public void setList(List<CommonFileVo> list) {
		this.list = list;
	}
	@Override
	public String toString() {
		return "QaBoardVo [qaNum=" + qaNum + ", qaTitle=" + qaTitle + ", qaContent=" + qaContent + ", qaRegdate="
				+ qaRegdate + ", qaViewcnt=" + qaViewcnt + ", qaWriter=" + qaWriter + ", qaCnt=" + qaCnt + ", qaShow="
				+ qaShow + ", qaRef=" + qaRef + ", qaStep=" + qaStep + ", qaLevel=" + qaLevel + ", list=" + list + "]";
	}
	
	
	
	
}
