package com.newdeal.ict.Controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

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
	public HashMap<String, Object> ismember(String gubun,String id,HttpSession session) throws Exception {
		 HashMap<String, Object> map = new HashMap();
		 System.out.println("���а���?"+gubun);
		 System.out.println("id��?"+id);
		 
		 map.put("type", gubun);
		 map.put("id",id);
		 MemberVo vo=service.ismember(map);
		
		 if(vo==null){
			 System.out.println("���̾���");
			 map.put("ismember","no");
		 }else if(vo!=null) {
			 System.out.println("���� �ִ�");
			 map.put("ismember", "yes");
			 map.put("member",vo);
			 session.setAttribute("login", vo);
		 }
		
		 
		 return map;
	}
	 @RequestMapping(value = "/signup", method = RequestMethod.GET)
		public String signup() {
		
			return ".member.signup";
		}
}
