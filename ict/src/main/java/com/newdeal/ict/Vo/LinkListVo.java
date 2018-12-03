
package com.newdeal.ict.Vo;

public class LinkListVo {
	private int linkNum;
	private String linkName;
	private String linkUrl;
	
	public LinkListVo() {}

	public int getLinkNum() {
		return linkNum;
	}

	public void setLinkNum(int linkNum) {
		this.linkNum = linkNum;
	}

	public String getLinkName() {
		return linkName;
	}

	public void setLinkName(String linkName) {
		this.linkName = linkName;
	}

	public String getLinkUrl() {
		return linkUrl;
	}

	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}

	@Override
	public String toString() {
		return "LinkListVo [linkNum=" + linkNum + ", linkName=" + linkName + ", linkUrl=" + linkUrl + "]";
	}

	public LinkListVo(int linkNum, String linkName, String linkUrl) {
		super();
		this.linkNum = linkNum;
		this.linkName = linkName;
		this.linkUrl = linkUrl;
	}
	
	
	
}
