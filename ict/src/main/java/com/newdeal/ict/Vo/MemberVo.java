package com.newdeal.ict.Vo;

import java.sql.Date;

public class MemberVo {
	private int m_num;
	private String m_email;
	private String m_pwd;
	private String m_name;
	private String m_phone;
	private String m_gubun;
	private int m_grade;
	private Date m_joindate;
	
	public MemberVo(){}

	public MemberVo(int m_num, String m_email, String m_pwd, String m_name, String m_phone, String m_gubun, int m_grade,
			Date m_joindate) {
		super();
		this.m_num = m_num;
		this.m_email = m_email;
		this.m_pwd = m_pwd;
		this.m_name = m_name;
		this.m_phone = m_phone;
		this.m_gubun = m_gubun;
		this.m_grade = m_grade;
		this.m_joindate = m_joindate;
	}

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_pwd() {
		return m_pwd;
	}

	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public String getM_gubun() {
		return m_gubun;
	}

	public void setM_gubun(String m_gubun) {
		this.m_gubun = m_gubun;
	}

	public int getM_grade() {
		return m_grade;
	}

	public void setM_grade(int m_grade) {
		this.m_grade = m_grade;
	}

	public Date getM_joindate() {
		return m_joindate;
	}

	public void setM_joindate(Date m_joindate) {
		this.m_joindate = m_joindate;
	}

	@Override
	public String toString() {
		return "MemberVo [m_num=" + m_num + ", m_email=" + m_email + ", m_pwd=" + m_pwd + ", m_name=" + m_name
				+ ", m_phone=" + m_phone + ", m_gubun=" + m_gubun + ", m_grade=" + m_grade + ", m_joindate="
				+ m_joindate + "]";
	}
	
	
}
