package com.newdeal.ict.Vo;

public class TestVo {
	private int num;
	private String name;
	
	/* ����Ű = Alt+Shift+ (O,R,S) ������,���ͼ���,����Ʈ�� */
	public TestVo() {} // new ��ü ���� �⺻������
	
	public TestVo(int num, String name) { //�����ε��Ͽ� ������
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
