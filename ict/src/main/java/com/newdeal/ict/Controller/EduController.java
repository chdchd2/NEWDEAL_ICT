package com.newdeal.ict.Controller;

import java.io.File;
import java.lang.reflect.Member;
import java.util.HashMap;
import java.util.List;

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
	
	@RequestMapping(value = "/intWrite", method = RequestMethod.POST)
	public String intWriteOk(IntroduceVo vo,MultipartHttpServletRequest req) throws Exception {
		//湲� �옉�꽦�븯湲�
		service.intWrite(vo); 
		//泥⑤��뙆�씪 泥섎━�븯湲�
		List<MultipartFile> filelist = req.getFiles("file"); 
		int fileRefNum=service.intmaxNum();
		String fileRefBoard="EDU_INTRODUCE";
		commonservice.fileWrite(filelist, fileRefNum,fileRefBoard);
		return "redirect:/edu/intList";
	}
	
	@RequestMapping(value = "/intList",method = RequestMethod.GET)
	public String intList(@RequestParam(value="pageNum",defaultValue="1")int pageNum,Model model,String searchType,String searchWord) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pageNum", pageNum);
		map.put("searchType",searchType);
		map.put("searchWord",searchWord);
		map = service.intList(map);
		model.addAttribute("list",map.get("list"));
		model.addAttribute("pu",map.get("pu"));
		model.addAttribute("searchType",searchType);
		model.addAttribute("searchWord",searchWord);
		
		return ".edu.introduce.list";
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
		IntroduceVo intvo=service.getWriter(intNum);
		
		if(intvo.getMemNum()==vo.getMemNum()) {
			System.out.println("�옉�꽦�옄�� 濡쒓렇�씤�븳 �궗�슜�옄媛� 媛숈쑝�땲源� �궘�젣泥섎━");
			int n=service.intDelete(intNum);
		}else {
			System.out.println("媛숈��븡�떎.");
		}
		
		
		return "redirect:/edu/intList";
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
	
	@RequestMapping(value = "/intEdit",method = RequestMethod.POST)
	public String intEditOk(IntroduceVo vo,MultipartHttpServletRequest req) throws Exception {
		System.out.println("�닔�젙�떆 �젙蹂대뱾"+vo.toString());
		List<MultipartFile> filelist = req.getFiles("file"); 
		String fileRefBoard="EDU_INTRODUCE";
		int num=vo.getIntNum();
		commonservice.fileWrite(filelist, num,fileRefBoard);
		service.intEdit(vo);
		
		return "redirect:/edu/intList";
	}
	@RequestMapping(value = "/fileDel",method = RequestMethod.POST)
	@ResponseBody
	public void fileDel(CommonFileVo vo) throws Exception {
		System.out.println("�뙆�씪踰덊샇�뒗?"+vo);
		service.fileDel(vo);
	}
	
	@RequestMapping(value = "/detailwrite",method = RequestMethod.GET)
	public String DetailWrite() {
		
		return ".edu.detail.write";
	}
	
	@RequestMapping(value = "/detailwrite", method = RequestMethod.POST)
	public String DetailWriteOk(EduDetailVo vo,MultipartHttpServletRequest req) throws Exception {
		System.out.println("占쏙옙占쏙옙占싹놂옙占쏙옙=>"+vo.toString());
		List<MultipartFile> filelist = req.getFiles("file"); 
		service.detailWrite(vo);
		int detNum = vo.getDetNum();
		System.out.println("占쏙옙占싹뱄옙호占쏙옙?"+detNum);
		String fileRefBoard="EDU_DETAIL";
		commonservice.fileWrite(filelist, detNum,fileRefBoard);
		
		return "";
	}
	
	@RequestMapping(value = "/detailList",method = RequestMethod.GET)
	public String detailList(@RequestParam(value="pageNum",defaultValue="1")int pageNum,Model model) throws Exception {
	
		HashMap<String, Object> map=service.detailList(pageNum);
		model.addAttribute("list",map.get("list"));
		model.addAttribute("pu",map.get("pu"));
		
		return ".edu.detail.list";
	}
	
}
