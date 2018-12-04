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
	public HashMap<String, Object> ismember(String gubun,String uid,HttpSession session) throws Exception {
		 if(session.getAttribute("member") != null){
			 session.removeAttribute("member");
		 }
		 HashMap<String, Object> map = new HashMap();
		 System.out.println("援щ텇媛믪�?"+gubun);
		 System.out.println("uid�뒗?"+uid);
		 
		 map.put("type", gubun);
		 map.put("uid",uid);
		 MemberVo vo=service.ismember(map);
		 if(vo==null){
			 System.out.println("媛믪씠 �뾾�떎");
			 map.put("ismember","no");	
		 }else if(vo!=null) {
			 System.out.println("媛믪씠 �엳�떎");
			 map.put("ismember", "yes");			
			 session.setAttribute("member", vo);
			 System.out.println("vo異쒕젰�빐蹂닿린"+vo.toString());
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
		 System.out.println("�엯�젰媛� 寃�利�"+vo.toString());
		 	int a=service.signin(vo);
		 	if(a==1) {
		 		System.out.println("�쉶�썝媛��엯 �꽦怨�");
		 	}
			return "redirect:/";
		}
	@RequestMapping(value = "/nickNameChk",method = RequestMethod.POST)
	@ResponseBody
		public boolean nicknameChk(String nickname) throws Exception{
		
		nickname = nickname.replaceAll(" ", "").replaceAll("(^\\p{Z}+|\\p{Z}+$)", "");
		System.out.println("�땳�꽕�엫��===>"+nickname);
		boolean able =service.nickNameChk(nickname);
			
		return able;
	}
	
	@RequestMapping(value = "/companysignup", method = RequestMethod.GET)
	public String companySingup() {
	
		return ".member.register";
	}
	
}
