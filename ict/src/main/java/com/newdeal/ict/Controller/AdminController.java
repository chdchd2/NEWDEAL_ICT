package com.newdeal.ict.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.newdeal.ict.Service.AdminService;
import com.newdeal.ict.Vo.MemberVo;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	@Autowired
	private AdminService service;
	@RequestMapping(value = "/",method = RequestMethod.GET)
	public String adminLogin() {
		
		return "admin/login";
	}
	
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public String Login(String email,String password,HttpSession session) {
		 if(session.getAttribute("admin") != null){
			 session.removeAttribute("admin");
		 }
		if(email.equals("admin@admin.com")&&password.equals("admin")) {
			System.out.println("관리자 로그인 성공");
			 session.setAttribute("admin", "admin");
		}else {
			return "admin/login";
		}
		return "admin/index";
	}
	@RequestMapping(value = "/login",method = RequestMethod.GET)
	public String LoginGet(HttpSession session) {
		 if(session.getAttribute("admin") != null){
			 return "admin/index";
		 }else {
			 return "admin/login";
		 }
		
	}
	
	@RequestMapping(value = "/member",method = RequestMethod.GET)
	public String member(Model model) throws Exception {
		List<MemberVo> memberlist = service.memberList();
		model.addAttribute("memberlist",memberlist);
		System.out.println(memberlist.toString());
		 return "admin/memberlist";
	}
	
	@RequestMapping(value = "/memGrade",method = RequestMethod.GET)
	public String grade(MemberVo vo) throws Exception {
		
		service.memGrade(vo);
		 return "redirect:/admin/member";
	}
	
	@RequestMapping(value = "/memState",method = RequestMethod.GET)
	public String state(MemberVo vo) throws Exception {
		System.out.println(vo.toString());
		service.memState(vo);
		 return "redirect:/admin/member";
	}
	

}
