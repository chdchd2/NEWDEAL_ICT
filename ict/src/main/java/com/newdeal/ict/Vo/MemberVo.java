package com.newdeal.ict.Vo;

import java.sql.Date;

public class MemberVo {
	private int num;
	private String email;
	private String pwd;
	private String name;
	private String phone;
	private String facebook;
	private String kakaotalk;
	private int grade;
	private Date joindate;
	
	public MemberVo(){}
	public MemberVo(int num, String email, String pwd, String name, String phone, String facebook, String kakaotalk,
			int grade, Date joindate) {
		super();
		this.num = num;
		this.email = email;
		this.pwd = pwd;
		this.name = name;
		this.phone = phone;
		this.facebook = facebook;
		this.kakaotalk = kakaotalk;
		this.grade = grade;
		this.joindate = joindate;
	}
	@Override
	public String toString() {
		return "MemberVo [num=" + num + ", email=" + email + ", pwd=" + pwd + ", name=" + name + ", phone=" + phone
				+ ", facebook=" + facebook + ", kakaotalk=" + kakaotalk + ", grade=" + grade + ", joindate=" + joindate
				+ "]";
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getFacebook() {
		return facebook;
	}
	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}
	public String getKakaotalk() {
		return kakaotalk;
	}
	public void setKakaotalk(String kakaotalk) {
		this.kakaotalk = kakaotalk;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public Date getJoindate() {
		return joindate;
	}
	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}
	
	
}
