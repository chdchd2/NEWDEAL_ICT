package com.newdeal.ict.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.newdeal.ict.Service.EduService;

@Controller
@RequestMapping(value = "/edu")
public class EduController {
	@Autowired
	private EduService service;
	
	@RequestMapping(value = "/intWrite")
	public String intWrite() {
		
		return "edu/introduce/write";
	}
	
	
	
}
