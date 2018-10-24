package com.newdeal.ict.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

public interface AppService {
	public void ckeditorImageUpload(HttpServletRequest request, HttpServletResponse response, MultipartFile file) throws Exception;

}
