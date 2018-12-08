package com.newdeal.ict.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.newdeal.ict.Service.AdminService;
import com.newdeal.ict.Service.NoticeService;
import com.newdeal.ict.Service.QaBoardService;
import com.newdeal.ict.Vo.LinkListVo;
import com.newdeal.ict.Vo.MemberVo;
import com.newdeal.ict.Vo.NoticeVo;
import com.newdeal.ict.Vo.QaBoardVo;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	@Autowired
	private AdminService service;
	@Inject
	NoticeService noticeService;
	@Inject
	QaBoardService qaService;
	@RequestMapping(value = "/",method = RequestMethod.GET)
	public String adminLogin() {
		
		return "admin/login";
	}
	
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public String Login(String email,String password,HttpSession session) {
		 if(session.getAttribute("admin") != null){
			 session.removeAttribute("madmin");
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
	public String member(Model model,HttpSession session) throws Exception {
		 if(session.getAttribute("admin") != "admin"){
			 return "admin/login";
		 }
		List<MemberVo> memberlist = service.memberList();
		model.addAttribute("memberlist",memberlist);
		System.out.println(memberlist.toString());
		 return "admin/memberlist";
	}
	
	@RequestMapping(value = "/memGrade",method = RequestMethod.GET)
	public String grade(MemberVo vo,HttpSession session) throws Exception {
		 if(session.getAttribute("admin") != "admin"){
			 return "admin/login";
		 }
		service.memGrade(vo);
		 return "redirect:/admin/member";
	}
	
	@RequestMapping(value = "/memState",method = RequestMethod.GET)
	public String state(MemberVo vo,HttpSession session) throws Exception {
		 if(session.getAttribute("admin") != "admin"){
			 return "admin/login";
		 }
		System.out.println(vo.toString());
		service.memState(vo);
		 return "redirect:/admin/member";
	}
	
	@RequestMapping(value="/notice",method = RequestMethod.GET)
	public ModelAndView list(HttpSession session) throws Exception{
		ModelAndView mav=new ModelAndView();
		if(session.getAttribute("admin") != "admin"){
			mav.setViewName("admin/login");
			 return mav;
		 }
		List<NoticeVo> list=noticeService.listAll();
		mav.setViewName("admin/noticelist");
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", list.size());
		mav.addObject("map", map);
		
		return mav;
	}
	
	@RequestMapping(value = "/noticeWrite",method = RequestMethod.GET)
	public String noticeWrite(HttpSession session) throws Exception {
		 if(session.getAttribute("admin") != "admin"){
			 return "admin/login";
		 }
		System.out.println("noticeWrite");
		 return "admin/noticewrite";
	}
	
	@RequestMapping(value="/noticeWrite",method=RequestMethod.POST)
	public String insert(@ModelAttribute NoticeVo vo,HttpSession session) throws Exception{
		 if(session.getAttribute("admin") != "admin"){
			 return "admin/login";
		 }
		System.out.println("=====================>"+vo.toString());
		noticeService.create(vo);
		return "redirect:/admin/notice";
	}
	
	@RequestMapping(value="/noticeDel",method=RequestMethod.GET)
	public String noticeDel(int ntNum,HttpSession session) throws Exception{
		if(session.getAttribute("admin") =="admin") {
			noticeService.delete(ntNum);
		}
		return "redirect:/admin/notice";
	}
	
	@RequestMapping(value="/qalist",method = RequestMethod.GET)
	public ModelAndView qalist(HttpSession session) throws Exception{
		ModelAndView mav=new ModelAndView();
		 if(session.getAttribute("admin") != "admin"){
			 mav.setViewName("admin/login");
			 return mav;
		 }
		List<QaBoardVo> list=qaService.listAll();
		mav.setViewName("admin/qalist");
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("list", list);
		mav.addObject("map", map);
		
		return mav;
	}
	
	@RequestMapping(value="/qaview",method = RequestMethod.GET)
	public ModelAndView qaview(int qaNum,HttpSession session)throws Exception{
		ModelAndView mv=new ModelAndView("admin/qaview");
		
		mv.addObject("vo", qaService.view(qaNum));
		return mv;
	}
	
	@RequestMapping(value="/answer",method = RequestMethod.POST)
	public String answer(QaBoardVo vo,HttpSession session)throws Exception{
		 if(session.getAttribute("admin") != "admin"){
			 return "admin/login";
		 }
		vo.setQaTitle("[답변]"+vo.getQaTitle());
		vo.setGroupOrd(vo.getQaNum());
		System.out.println("브이오갑숯ㄹ력"+vo.toString());
		qaService.answer(vo);
		
		return "redirect:/admin/qalist";
	}
	
	@RequestMapping(value = "/linklist",method = RequestMethod.GET)
	public String linklist(Model model,HttpSession session) throws Exception {
		System.out.println("링크리스트통과");
		 if(session.getAttribute("admin") != "admin"){
			 return "admin/login";
		 }
		 List<LinkListVo> list = service.linklist();
		 list.toString();
		 model.addAttribute("linklist",list);
		 return "admin/linklist";
	}
	
	@RequestMapping(value = "/dellink",method = RequestMethod.GET)
	public String dellink(Model model,HttpSession session,int linkNum) throws Exception {
		 if(session.getAttribute("admin") != "admin"){
			 return "admin/login";
		 }
		 service.dellink(linkNum);
		 List<LinkListVo> list = service.linklist();
		 list.toString();
		 model.addAttribute("linklist",list);
		 return "admin/linklist";
	}
	
	@RequestMapping(value = "/linkadd",method = RequestMethod.GET)
	public String linkadd(Model model,HttpSession session,LinkListVo vo) throws Exception {
		 if(session.getAttribute("admin") != "admin"){
			 return "admin/login";
		 }
		service.linkadd(vo);
		 List<LinkListVo> list = service.linklist();
		 list.toString();
		 model.addAttribute("linklist",list);
		 return "admin/linklist";
	}
	
	
	
	
	
	
	
	

}
