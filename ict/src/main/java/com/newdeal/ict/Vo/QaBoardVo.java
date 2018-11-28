package com.newdeal.ict.Vo;

import java.util.Date;
import java.util.List;

public class QaBoardVo {
	private int qaNum; //踰덊샇
	private String qaTitle; //�젣紐�
	private String qaContent;//�궡�슜
	private Date qaRegdate;//�옉�꽦�씪
	private int qaViewcnt;//議고쉶�닔
	private String qaWriter;//�옉�꽦�옄
	private int qaCnt;//�뙎湲��닔
	private String qaShow;//�솕硫댄몴�떆�뿬遺�
	private int qaRef;//理쒖긽�쐞遺�紐⑤쾲�샇(�떊洹쒖엯�젰�떆1遺��꽣李⑤���濡쒖쬆媛�)
	private String qaGubun;
	private List<CommonFileVo> list; //�뙆�씪
	
	
	public String getQaGubun() {
		return qaGubun;
	}
	public void setQaGubun(String qaGubun) {
		this.qaGubun = qaGubun;
	}
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
				+ qaShow + ", qaRef=" + qaRef + ", qaGubun=" + qaGubun + ", list=" + list + "]";
	}
	
	
	
	
	
}
