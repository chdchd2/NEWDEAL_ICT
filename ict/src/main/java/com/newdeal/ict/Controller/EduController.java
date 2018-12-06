package com.newdeal.ict.Controller;

import java.io.File;
import java.lang.reflect.Member;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.newdeal.ict.Service.CommonService;
import com.newdeal.ict.Service.EduService;
import com.newdeal.ict.Util.PageUtil;
import com.newdeal.ict.Vo.CommonFileVo;
import com.newdeal.ict.Vo.EduDetailVo;
import com.newdeal.ict.Vo.IntDetailJoinVo;
import com.newdeal.ict.Vo.IntroduceVo;
import com.newdeal.ict.Vo.MemberVo;

@Controller
@RequestMapping(value = "/edu")
public class EduController {
	@Autowired
	private EduService service;
	@Autowired
	private CommonService commonservice;
	
	@RequestMapping(value = "/intWrite",method = RequestMethod.GET)
	public String intWrite() {
		
		return ".edu.introduce.write";
	}
	
	@RequestMapping(value = "/detWrite",method = RequestMethod.GET)
	public String detWrite() {
		
		return ".edu.detail.write";
	}
	
	@RequestMapping(value = "/intWrite", method = RequestMethod.POST)
	public String intWriteOk(IntroduceVo vo,MultipartHttpServletRequest multiRequest,HttpSession session) throws Exception {
		MemberVo member=(MemberVo)session.getAttribute("member");
		if(member.getMemGrade()!=2) {
			return "error/interror";
		}
		service.intWrite(vo); 
		int fileRefNum=service.intmaxNum();
		String fileRefBoard="EDU_INTRODUCE";
		commonservice.fileWrite(fileRefNum,fileRefBoard,multiRequest);
		return "redirect:/edu/intList";
	}
	
	@RequestMapping(value = "/detWrite", method = RequestMethod.POST)
	public String detWriteOk(EduDetailVo vo,MultipartHttpServletRequest multiRequest,HttpSession session) throws Exception {
		MemberVo member=(MemberVo)session.getAttribute("member");
		if(member.getMemGrade()!=2) {
			return "error/interror";
		}
		service.detWrite(vo); 
		int fileRefNum=service.detmaxNum();
		String fileRefBoard="EDU_DETAIL";
		commonservice.fileWrite(fileRefNum,fileRefBoard,multiRequest);
		return "redirect:/edu/detList";
	}
	
	@RequestMapping(value = "/intList",method = RequestMethod.GET)
	public String intList(@RequestParam(value="pageNum",defaultValue="1")int pageNum,Model model,String searchType,String searchWord,@RequestParam(value="companygubun",defaultValue="")String companygubun) throws Exception {
		System.out.println("회원구분은?=>"+companygubun);
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(!(companygubun.equals(""))) {
		map.put("companygubun", companygubun);
		}
		map.put("pageNum", pageNum);
		map.put("searchType",searchType);
		map.put("searchWord",searchWord);
		List<MemberVo> companymember=service.companymember();
		
		map = service.intList(map);
		model.addAttribute("companygubun",companygubun);
		model.addAttribute("companymember",companymember);
		model.addAttribute("list",map.get("list"));
		model.addAttribute("pu",map.get("pu"));
		model.addAttribute("searchType",searchType);
		model.addAttribute("searchWord",searchWord);
		
		return ".edu.introduce.list";
	}
	
	@RequestMapping(value = "/detList",method = RequestMethod.GET)
	public String detList(@RequestParam(value="pageNum",defaultValue="1")int pageNum,Model model,String searchType,String searchWord,@RequestParam(value="companygubun",defaultValue="")String companygubun) throws Exception {
		System.out.println("회원구분은?=>"+companygubun);
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(!(companygubun.equals(""))) {
		map.put("companygubun", companygubun);
		}
		map.put("pageNum", pageNum);
		map.put("searchType",searchType);
		map.put("searchWord",searchWord);
		List<MemberVo> companymember=service.companymember();
		
		map = service.detList(map);
		model.addAttribute("companygubun",companygubun);
		model.addAttribute("companymember",companymember);
		model.addAttribute("list",map.get("list"));
		model.addAttribute("pu",map.get("pu"));
		model.addAttribute("searchType",searchType);
		model.addAttribute("searchWord",searchWord);
		
		return ".edu.detail.list";
	}
	
	@RequestMapping(value = "/intDetail",method = RequestMethod.GET)
	public String intDetail(int intNum,Model model) throws Exception {
		
		IntDetailJoinVo vo=service.intDetail(intNum);
		IntDetailJoinVo prev=service.intPrev(intNum);
		IntDetailJoinVo next=service.intNext(intNum);
		
		model.addAttribute("vo",vo);
		model.addAttribute("prev",prev);
		model.addAttribute("next",next);
		
		return ".edu.introduce.detail";
	}
	
	@RequestMapping(value = "/detDetail",method = RequestMethod.GET)
	public String detDetail(int detNum,Model model) throws Exception {
		
		EduDetailVo vo=service.detDetail(detNum);
		EduDetailVo prev=service.detPrev(detNum);
		EduDetailVo next=service.detNext(detNum);
		
		model.addAttribute("vo",vo);
		model.addAttribute("prev",prev);
		model.addAttribute("next",next);
		
		return ".edu.detail.detail";
	}
	@RequestMapping(value="/fileDown" )
	public ModelAndView contactoDownload(@ModelAttribute CommonFileVo filevo) throws Exception{
		CommonFileVo fileVo=service.fileinfo(filevo);
		ModelAndView mv= new ModelAndView("FileDownView");
		File file=new File(fileVo.getFilePath()+File.separator+fileVo.getFileName());
		mv.addObject("file",file);
		mv.addObject("fileName",fileVo.getFileOrgName());
		return mv;
	}
	
	@RequestMapping(value = "/intDelete",method = RequestMethod.GET)
	public String intDelete(int intNum,HttpSession session) throws Exception {
		MemberVo vo=(MemberVo)session.getAttribute("member");
		System.out.println("삭제할 글번호는?"+intNum);
		IntroduceVo intvo=service.getWriter(intNum);
		System.out.println(intvo.getMemNum());
		System.out.println(vo.getMemNum());
		if(intvo.getMemNum()==vo.getMemNum()) {
			int n=service.intDelete(intNum);
			
		}else {
			System.out.println("媛숈��븡�떎.");
		}
		
		
		return "redirect:/edu/intList";
	}
	
	@RequestMapping(value = "/detDelete",method = RequestMethod.GET)
	public String detDelete(int detNum,HttpSession session) throws Exception {
		MemberVo vo=(MemberVo)session.getAttribute("member");
		System.out.println("삭제할 글번호는?"+detNum);
		EduDetailVo detvo=service.detgetWriter(detNum);
		System.out.println(detvo.getMemNum());
		System.out.println(vo.getMemNum());
		if(detvo.getMemNum()==vo.getMemNum()) {
			int n=service.detDelete(detNum);
			
		}else {
			System.out.println("媛숈��븡�떎.");
		}
		
		
		return "redirect:/edu/detList";
	}
	
	@RequestMapping(value = "/intEdit",method = RequestMethod.GET)
	public String intEdit(int intNum,HttpSession session,Model model) throws Exception {
		MemberVo vo=(MemberVo)session.getAttribute("member");
		IntroduceVo intvo=service.getWriter(intNum);
		
		if(intvo.getMemNum()==vo.getMemNum()) {
			System.out.println("�옉�꽦�옄�� 濡쒓렇�씤�븳 �궗�슜�옄媛� 媛숈쑝�땲源� �닔�젙�쑝濡� �꽆寃⑥쨲");
			IntDetailJoinVo editvo=service.intDetail(intNum);
			model.addAttribute("vo",editvo);
		}else {
			System.out.println("媛숈��븡�떎.");
		}
		
		return ".edu.introduce.edit";
	}
	
	@RequestMapping(value = "/detEdit",method = RequestMethod.GET)
	public String detEdit(int detNum,HttpSession session,Model model) throws Exception {
		MemberVo vo=(MemberVo)session.getAttribute("member");
		EduDetailVo detvo=service.detgetWriter(detNum);
		
		if(detvo.getMemNum()==vo.getMemNum()) {
			EduDetailVo editvo=service.detDetail(detNum);
			model.addAttribute("vo",editvo);
		}else {
			System.out.println("媛숈��븡�떎.");
		}
		
		return ".edu.detail.edit";
	}
	
	
	
	@RequestMapping(value = "/intEdit",method = RequestMethod.POST)
	public String intEditOk(IntroduceVo vo,MultipartHttpServletRequest req) throws Exception {
		String fileRefBoard="EDU_INTRODUCE";
		int num=vo.getIntNum();
		commonservice.fileWrite(num,fileRefBoard,req);
		service.intEdit(vo);
		
		return "redirect:/edu/intList";
	}
	@RequestMapping(value = "/detEdit",method = RequestMethod.POST)
	public String intEditOk(EduDetailVo vo,MultipartHttpServletRequest req) throws Exception {
		String fileRefBoard="EDU_DETAIL";
		int num=vo.getDetNum();
		commonservice.fileWrite(num,fileRefBoard,req);
		service.detEdit(vo);
		
		return "redirect:/edu/detList";
	}
	@RequestMapping(value = "/fileDel",method = RequestMethod.POST)
	@ResponseBody
	public void fileDel(CommonFileVo vo) throws Exception {
		System.out.println("삭제요청"+vo.toString());
		service.fileDel(vo);
	}
	
	
	
	
	

}
