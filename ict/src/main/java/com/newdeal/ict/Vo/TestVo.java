package com.newdeal.ict.Vo;

public class TestVo {
	private int num;
	private String name;
	
	/* 단축키 = Alt+Shift+ (O,R,S) 생성자,게터세터,투스트링 */
	public TestVo() {} // new 객체 생성 기본생성자
	
	public TestVo(int num, String name) { //오버로딩하여 생성자
		super();
		this.num = num;
		this.name = name;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "TestVo [num=" + num + ", name=" + name + "]";
	}
	
}
