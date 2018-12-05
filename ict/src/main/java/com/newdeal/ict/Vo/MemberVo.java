package com.newdeal.ict.Vo;

import java.sql.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class MemberVo {
	private int memNum;
	private String memNickName;
	private String memTel;
	private String memGubun;
	private int memGrade;
	private Date memJoinDate;
	private String memUid;
	private String memState;
	private String memPassword;
	
	public MemberVo(){}

	


	

	public int getMemNum() {
		return memNum;
	}






	public void setMemNum(int memNum) {
		this.memNum = memNum;
	}






	public String getMemNickName() {
		return memNickName;
	}






	public void setMemNickName(String memNickName) {
		this.memNickName = memNickName;
	}






	public String getMemTel() {
		return memTel;
	}






	public void setMemTel(String memTel) {
		this.memTel = memTel;
	}






	public String getMemGubun() {
		return memGubun;
	}






	public void setMemGubun(String memGubun) {
		this.memGubun = memGubun;
	}






	public int getMemGrade() {
		return memGrade;
	}






	public void setMemGrade(int memGrade) {
		this.memGrade = memGrade;
	}






	public Date getMemJoinDate() {
		return memJoinDate;
	}






	public void setMemJoinDate(Date memJoinDate) {
		this.memJoinDate = memJoinDate;
	}






	public String getMemUid() {
		return memUid;
	}






	public void setMemUid(String memUid) {
		this.memUid = memUid;
	}






	public String getMemState() {
		return memState;
	}






	public void setMemState(String memState) {
		this.memState = memState;
	}






	public String getMemPassword() {
		return memPassword;
	}






	public void setMemPassword(String memPassword) {
		this.memPassword = memPassword;
	}






	public MemberVo(int memNum, String memNickName, String memTel, String memGubun, int memGrade, Date memJoinDate,
			String memUid, String memState, String memPassword) {
		super();
		this.memNum = memNum;
		this.memNickName = memNickName;
		this.memTel = memTel;
		this.memGubun = memGubun;
		this.memGrade = memGrade;
		this.memJoinDate = memJoinDate;
		this.memUid = memUid;
		this.memState = memState;
		this.memPassword = memPassword;
	}






	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.JSON_STYLE);
	}

	
	
}
