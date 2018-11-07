package com.newdeal.ict.Controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.newdeal.ict.Service.EduService;
import com.newdeal.ict.Util.PageUtil;
import com.newdeal.ict.Vo.IntDetailJoinVo;
import com.newdeal.ict.Vo.IntroduceVo;

@Controller
@RequestMapping(value = "/edu")
public class EduController {
	@Autowired
	private EduService service;
	
	@RequestMapping(value = "/intWrite",method = RequestMethod.GET)
	public String intWrite() {
		
		return ".edu.introduce.write";
	}
	
	@RequestMapping(value = "/intWrite", method = RequestMethod.POST)
	public String intWriteOk(IntroduceVo vo,MultipartHttpServletRequest req) throws Exception {
		//글 작성하기
		service.intWrite(vo); 
		//첨부파일 처리하기
		List<MultipartFile> filelist = req.getFiles("file"); 
		int num=service.intmaxNum();
		service.intfileWrite(filelist, num);
		
		return "redirect:/edu/intList";
	}
	
	@RequestMapping(value = "/intList",method = RequestMethod.GET)
	public String intList(@RequestParam(value="pageNum",defaultValue="1")int pageNum,Model model) throws Exception {
	
		HashMap<String, Object> map=service.intList(pageNum);
		model.addAttribute("list",map.get("list"));
		model.addAttribute("pu",map.get("pu"));
		
		return "edu/introduce/list";
	}
	
	@RequestMapping(value = "/intDetail",method = RequestMethod.GET)
	public String intDetail(int intNum,Model model) throws Exception {
		
		IntDetailJoinVo vo=service.intDetail(intNum);
		System.out.println("===>out"+vo.toString());
		model.addAttribute("vo",vo);
		return "edu/introduce/detail";
	}
	
}
