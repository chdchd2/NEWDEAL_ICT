package com.newdeal.ict.Vo;


import java.text.DecimalFormat;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class CommonFileVo {
	private int fileNum;
	private String fileName;
	private String fileOrgName;
	private String fileSize;
	private String filePath;
	private String fileRefBoard;
	private int fileRefNum;
	
	public CommonFileVo(){}

	public CommonFileVo(int fileNum, String fileName, String fileOrgName, String fileSize, String filePath,
			String fileRefBoard, int fileRefNum) {
		super();
		this.fileNum = fileNum;
		this.fileName = fileName;
		this.fileOrgName = fileOrgName;
		this.fileSize = fileSize;
		this.filePath = filePath;
		this.fileRefBoard = fileRefBoard;
		this.fileRefNum = fileRefNum;
	}

















	public int getFileNum() {
		return fileNum;
	}

















	public void setFileNum(int fileNum) {
		this.fileNum = fileNum;
	}

















	public String getFileName() {
		return fileName;
	}

















	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

















	public String getFileOrgName() {
		return fileOrgName;
	}

















	public void setFileOrgName(String fileOrgName) {
		this.fileOrgName = fileOrgName;
	}

















	public String getFileSize() {
		return fileSize;
	}

















	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}

















	public String getFilePath() {
		return filePath;
	}

















	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

















	public String getFileRefBoard() {
		return fileRefBoard;
	}

















	public void setFileRefBoard(String fileRefBoard) {
		this.fileRefBoard = fileRefBoard;
	}

















	public int getFileRefNum() {
		return fileRefNum;
	}

















	public void setFileRefNum(int fileRefNum) {
		this.fileRefNum = fileRefNum;
	}

















	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.JSON_STYLE);
	}

	 public String byteCalculation(String bytes) {
         String retFormat = "0";
        Double size = Double.parseDouble(bytes);

         String[] s = { "bytes", "KB", "MB", "GB", "TB", "PB" };
         

         if (bytes != "0") {
               int idx = (int) Math.floor(Math.log(size) / Math.log(1024));
               DecimalFormat df = new DecimalFormat("#,###.##");
               double ret = ((size / Math.pow(1024, Math.floor(idx))));
               retFormat = df.format(ret) + " " + s[idx];
          } else {
               retFormat += " " + s[0];
          }

          return retFormat;
	 }
	
}
