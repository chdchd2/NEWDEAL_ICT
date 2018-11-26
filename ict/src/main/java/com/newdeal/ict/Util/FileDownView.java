package com.newdeal.ict.Util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class FileDownView extends AbstractView{
@Override
protected void renderMergedOutputModel(Map<String, Object> map, HttpServletRequest req, HttpServletResponse resp)throws Exception {

		setContentType("application/octet-stream");
		File f=(File)map.get("file");
		String fileNm=(String)map.get("fileName");
		resp.setContentType(getContentType());
		fileNm=URLEncoder.encode(fileNm,"UTF-8");
		fileNm=fileNm.replaceAll("\\+","%20");
		resp.setHeader("Content-Disposition", "attachment;filename="+fileNm);
		OutputStream os=resp.getOutputStream();
		FileInputStream fis=new FileInputStream(f);
		FileCopyUtils.copy(fis, os);
		os.close();
		fis.close();
	}
}