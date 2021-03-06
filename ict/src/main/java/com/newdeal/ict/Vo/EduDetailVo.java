package com.newdeal.ict.Vo;

import java.sql.Date;
import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class EduDetailVo {
	private int detNum;
	private int memNum;
	private String detTitle;
	private String detContent;
	private Date detDate;
	private String detWriter;
	private int detHit;
	private List<CommonFileVo> list;
	
	public EduDetailVo() {}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.JSON_STYLE);
	}

	public int getDetNum() {
		return detNum;
	}

	public void setDetNum(int detNum) {
		this.detNum = detNum;
	}

	public int getMemNum() {
		return memNum;
	}

	public void setMemNum(int memNum) {
		this.memNum = memNum;
	}

	public String getDetTitle() {
		return detTitle;
	}

	public void setDetTitle(String detTitle) {
		this.detTitle = detTitle;
	}

	public String getDetContent() {
		return detContent;
	}

	public void setDetContent(String detContent) {
		this.detContent = detContent;
	}

	public Date getDetDate() {
		return detDate;
	}

	public void setDetDate(Date detDate) {
		this.detDate = detDate;
	}

	public String getDetWriter() {
		return detWriter;
	}

	public void setDetWriter(String detWriter) {
		this.detWriter = detWriter;
	}

	public int getDetHit() {
		return detHit;
	}

	public void setDetHit(int detHit) {
		this.detHit = detHit;
	}

	public List<CommonFileVo> getList() {
		return list;
	}

	public void setList(List<CommonFileVo> list) {
		this.list = list;
	}

	public EduDetailVo(int detNum, int memNum, String detTitle, String detContent, Date detDate, String detWriter,
			int detHit, List<CommonFileVo> list) {
		super();
		this.detNum = detNum;
		this.memNum = memNum;
		this.detTitle = detTitle;
		this.detContent = detContent;
		this.detDate = detDate;
		this.detWriter = detWriter;
		this.detHit = detHit;
		this.list = list;
	}

	
	
	
	
	
}
