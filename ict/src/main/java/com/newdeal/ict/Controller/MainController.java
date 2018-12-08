package com.newdeal.ict.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.newdeal.ict.Service.MainService;
import com.newdeal.ict.Vo.EduDetailVo;
import com.newdeal.ict.Vo.FestivalVo;
import com.newdeal.ict.Vo.IntroduceVo;
import com.newdeal.ict.Vo.LinkListVo;
import com.newdeal.ict.Vo.NoticeVo;
@Controller
public class MainController {
	@Autowired
	private MainService service;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	   public String home(HttpSession session,Model model) throws Exception {
		  List<LinkListVo> linklist = service.linklist();
		  List<NoticeVo> noticelist = service.noticelist();
		  List<FestivalVo> festivallist = service.festivallist();
		  List<IntroduceVo> intlist = service.intlist();
		  List<EduDetailVo> detlist = service.detlist();
		  
		  System.out.println("노티스 목록들==>?"+noticelist);
		  System.out.println("페스티벌 목록들==>"+festivallist);
		  System.out.println("인트로듀스 목록들==>?"+intlist);
		  System.out.println("인트디테일 목록들==>?"+detlist);
	      System.out.println("홈으로이동하기");
	      session.setAttribute("linklist", linklist);
	      model.addAttribute("noticelist",noticelist);
	      model.addAttribute("festivallist",festivallist);
	      model.addAttribute("intlist",intlist);
	      model.addAttribute("detlist",detlist);
	      
	      return ".main";
	   }
}
