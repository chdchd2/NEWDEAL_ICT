package com.newdeal.ict.Controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.newdeal.ict.Service.MemberService;
import com.newdeal.ict.Vo.MemberVo;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
	
		return ".member.memberlogin";
	}
	
	 @RequestMapping({"/ismember"})
	 @ResponseBody
	public HashMap<String, Object> ismember(String gubun,String id) throws Exception {
		 HashMap<String, Object> map = new HashMap();
		 System.out.println("구분값은?"+gubun);
		 System.out.println("id는?"+id);
		 
		 map.put("type", gubun);
		 map.put("id","01010101");
		 MemberVo vo=service.ismember(map);
		 System.out.println(vo.toString());
		 map.put("member",vo);
		 
		 return map;
	}
}
