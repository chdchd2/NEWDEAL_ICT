package com.newdeal.ict.Controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.newdeal.ict.Service.TestService;
import com.newdeal.ict.Vo.TestVo;


@Controller
public class TestController {
	@Autowired
	private TestService service;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		System.out.println("홈으로이동하기");
		return "test/home";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(TestVo vo,Model model) throws Exception {
		System.out.println("VO로 넘겨받은 값 출력:"+vo.toString());
		int i =service.write(vo);
		System.out.println("service.write 메소드 실행:숫자="+i);
		return "redirect:/list";
	}
	
	@RequestMapping(value = "/list")
	public String list(Model model) throws Exception {
		System.out.println("list쪽으로 옴");
		List<TestVo> list=service.list();
		System.out.println(list.toString());
		model.addAttribute("list",list);
		return "test/list";
	}
	
}
