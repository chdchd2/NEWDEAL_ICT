package com.newdeal.ict.Controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		 System.out.println("구분값은?"+gubun);
		 System.out.println("id는?"+id);
		 
		 map.put("type", gubun);
		 map.put("id",id);
		 MemberVo vo=service.ismember(map);
		 if(session.getAttribute("member") != null){
				session.removeAttribute("member");
			}
		 if(vo==null){
			 System.out.println("값이 없다");
			 map.put("ismember","no");	
		 }else if(vo!=null) {
			 System.out.println("값이 있다");
			 map.put("ismember", "yes");			
			 session.setAttribute("member", vo);
			 System.out.println("vo출력해보기"+vo.toString());
		 }
		
		 
		 return map;
	}
	 @RequestMapping(value = "/signup", method = RequestMethod.GET)
		public String signup(MemberVo vo,Model model) {
		 	model.addAttribute("vo",vo);
			return ".member.signup";
		}
	 @RequestMapping(value="/logout")
	 public String logout(HttpSession session) {
		 	session.removeAttribute("member"); 
	        return "redirect:/login";
	    }
	 @RequestMapping(value = "/signin", method = RequestMethod.POST)
		public String signin(MemberVo vo,Model model) throws Exception {
		 	int a=service.signin(vo);
		 	if(a==1) {
		 		System.out.println("회원가입 성공");
		 	}
			return "redirect:/";
		}
	 
}
