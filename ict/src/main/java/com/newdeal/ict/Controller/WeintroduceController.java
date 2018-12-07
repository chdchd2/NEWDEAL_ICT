package com.newdeal.ict.Controller;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/weintroduce/*")
public class WeintroduceController {

	@RequestMapping(value = "/newdel",method = RequestMethod.GET)
	public String NewDel(Model model) throws Exception {
	
		return ".weintroduce.newdel";
	}
	
	@RequestMapping(value = "/site",method = RequestMethod.GET)
	public String Site(Model model) throws Exception {
	
		return ".weintroduce.site";
	}
	
}
