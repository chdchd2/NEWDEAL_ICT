package com.newdeal.ict.Vo;

import java.util.Arrays;
import java.util.Date;

public class NoticeVo {


	private int ntNum; //번호
	private String ntTitle; //제목
	private String ntContent;//내용
	private Date ntRegdate;//작성일
	private int ntViewcnt;//조회수
	private String ntWriter;//작성자
	private String ntMap;
	private int ntCnt;//댓글수
	private String ntShow;//화면표시여부
	private String[] ntFiles;//첨부파일이름배열
	//getter, setter, toString(), 기본생성자
	public int getNtNum() {
		return ntNum;
	}
	public void setNtNum(int ntNum) {
		this.ntNum = ntNum;
	}
	public String getNtTitle() {
		return ntTitle;
	}
	public void setNtTitle(String ntTitle) {
		this.ntTitle = ntTitle;
	}
	public String getNtContent() {
		return ntContent;
	}
	public void setNtContent(String ntContent) {
		this.ntContent = ntContent;
	}
//	public String getntId() {
//		return ntId;
//	}
//	public void setntId(String ntId) {
//		this.ntId = ntId;
//	}
	public Date getNtRegdate() {
		return ntRegdate;
	}
	public void setNtRegdate(Date ntRegdate) {
		this.ntRegdate = ntRegdate;
	}
	public int getNtViewcnt() {
		return ntViewcnt;
	}
	public void setNtViewcnt(int ntViewcnt) {
		this.ntViewcnt = ntViewcnt;
	}
	public String getNtWriter() {
		return ntWriter;
	}
	public void setNtWriter(String ntWriter) {
		this.ntWriter = ntWriter;
	}
	public String getNtMap() {
		return ntMap;
	}
	public void setNtMap(String ntMap) {
		this.ntMap = ntMap;
	}
	public int getNtCnt() {
		return ntCnt;
	}
	public void setNtCnt(int ntCnt) {
		this.ntCnt = ntCnt;
	}
	public String getNtShow() {
		return ntShow;
	}
	public void setNtShow(String ntShow) {
		this.ntShow = ntShow;
	}
	public String[] getNtFiles() {
		return ntFiles;
	}
	public void setNtFiles(String[] ntFiles) {
		this.ntFiles = ntFiles;
	}
	@Override
	public String toString() {
		return "NoticeVo [ntNum=" + ntNum + ", ntTitle=" + ntTitle + ", ntContent=" + ntContent + ", ntRegdate="
				+ ntRegdate + ", ntViewcnt=" + ntViewcnt + ", ntWriter=" + ntWriter + ", ntMap=" + ntMap + ", ntCnt="
				+ ntCnt + ", ntShow=" + ntShow + ", ntFiles=" + Arrays.toString(ntFiles) + "]";
	}
	
	
}
