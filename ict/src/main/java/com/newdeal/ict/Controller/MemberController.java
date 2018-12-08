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
	
	@RequestMapping(value = "/normalsignin", method = RequestMethod.GET)
	public String normalsignin() {
	
		return ".member.normalsignin";
	}
	
	 @RequestMapping({"/ismember"})
	 @ResponseBody
	public HashMap<String, Object> ismember(String gubun,String uid,HttpSession session) throws Exception {
		 if(session.getAttribute("member") != null){
			 session.removeAttribute("member");
		 }
		 HashMap<String, Object> map = new HashMap();
		 
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
		 	int a=service.signin(vo);
		 	if(a==1) {
		 	}
			return "redirect:/";
		}
	@RequestMapping(value = "/nickNameChk",method = RequestMethod.POST)
	@ResponseBody
		public boolean nicknameChk(String nickname) throws Exception{
		
		nickname = nickname.replaceAll(" ", "").replaceAll("(^\\p{Z}+|\\p{Z}+$)", "");
		boolean able =service.nickNameChk(nickname);
			
		return able;
	}
	
	@RequestMapping(value = "/companysignup", method = RequestMethod.GET)
	public String companySingup() {
		
		return ".member.companyregister";
	}
	
	@RequestMapping(value = "/companysignup", method = RequestMethod.POST)
	public String companySingin(MemberVo vo) throws Exception {
		System.out.println("vo밸류값"+vo.toString());
		service.companysignin(vo);
		return ".member.memberlogin";
	}
	
	@RequestMapping(value = "/companylogin", method = RequestMethod.GET)
	public String companyLogin() throws Exception {

		return ".member.companylogin";
	}
	
	@RequestMapping(value = "/companylogin", method = RequestMethod.POST)
	public String companyLogin(MemberVo vo,HttpSession session,Model model) throws Exception {
		System.out.println("vo밸류값"+vo.toString());
		MemberVo login=service.iscompanymember(vo);
		if(login!=null){
			 session.setAttribute("member", login);
			 return "redirect:/";
			
		 }else{
			 System.out.println("기업회원 아님");
			 model.addAttribute("state","fail");
				return ".member.companylogin";
		 }
		
	
	}
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public String signin() throws Exception {

		return ".member.signin";
	}
	
}
