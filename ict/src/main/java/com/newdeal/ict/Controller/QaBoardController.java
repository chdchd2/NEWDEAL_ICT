package com.newdeal.ict.Controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.newdeal.ict.Service.QaBoardService;

@Controller
@RequestMapping("/qaboard/*")
public class QaBoardController {
	private static final Logger logger=
			LoggerFactory.getLogger(QaBoardController.class);
	
	@Inject 
	QaBoardService service;
	

}
