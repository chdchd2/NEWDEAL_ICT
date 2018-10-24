package com.newdeal.ict.Controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.newdeal.ict.Service.AppService;


@Controller
public class AppController {
	@Autowired
	private AppService service;
	@RequestMapping(value="/ksa/guide",method=RequestMethod.GET)
	public String app() {
		return "app/guide/guidelist";
	}
	@RequestMapping(value="/ksa/guide/write",method=RequestMethod.GET)
	public String guidewrite() {
		return "app/guide/guidewrite";
	}
	@RequestMapping(value="/ckeditorImageUpload", method=RequestMethod.POST)
	public void ckeditorImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) throws     Exception {

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset-utf-8");
		try {
			service.ckeditorImageUpload(request, response, upload);
		} catch (IOException e) {
			e.printStackTrace();

		}

	}


}
