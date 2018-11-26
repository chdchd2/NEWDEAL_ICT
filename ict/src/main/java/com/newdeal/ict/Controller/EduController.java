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
		//글 작성하기
		service.intWrite(vo); 
		//첨부파일 처리하기
		List<MultipartFile> filelist = req.getFiles("file"); 
		int fileRefNum=service.intmaxNum();
		String fileRefBoard="EDU_INTRODUCE";
		commonservice.fileWrite(filelist, fileRefNum,fileRefBoard);
		System.out.println("파일쓰는부분 여기 오는지");
		return "redirect:/edu/intList";
	}
	
	@RequestMapping(value = "/intList",method = RequestMethod.GET)
	public String intList(@RequestParam(value="pageNum",defaultValue="1")int pageNum,Model model) throws Exception {
	
		HashMap<String, Object> map=service.intList(pageNum);
		model.addAttribute("list",map.get("list"));
		model.addAttribute("pu",map.get("pu"));
		
		return ".edu.introduce.list";
	}
	
	@RequestMapping(value = "/intDetail",method = RequestMethod.GET)
	public String intDetail(int intNum,Model model) throws Exception {
		
		IntDetailJoinVo vo=service.intDetail(intNum);
		System.out.println("===>out"+vo.toString());
		model.addAttribute("vo",vo);
		return ".edu.introduce.detail";
	}
	
	@RequestMapping(value="/fileDown" )
	public ModelAndView contactoDownload(@ModelAttribute CommonFileVo filevo) throws Exception{
		System.out.println("컨트롤러 파일다운부분까지 온다.");
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
			System.out.println("작성자와 로그인한 사용자가 같으니까 삭제처리");
			int n=service.intDelete(intNum);
		}else {
			System.out.println("같지않다.");
		}
		
		
		return "redirect:/edu/intList";
	}
	
	@RequestMapping(value = "/intEdit",method = RequestMethod.GET)
	public String intEdit(int intNum,HttpSession session,Model model) throws Exception {
		MemberVo vo=(MemberVo)session.getAttribute("member");
		IntroduceVo intvo=service.getWriter(intNum);
		
		if(intvo.getMemNum()==vo.getMemNum()) {
			System.out.println("작성자와 로그인한 사용자가 같으니까 수정으로 넘겨줌");
			IntDetailJoinVo editvo=service.intDetail(intNum);
			model.addAttribute("vo",editvo);
		}else {
			System.out.println("같지않다.");
		}
		
		return ".edu.introduce.edit";
	}
	
	@RequestMapping(value = "/intEdit",method = RequestMethod.POST)
	public String intEditOk(IntroduceVo vo,MultipartHttpServletRequest req) throws Exception {
		System.out.println("수정시 정보들"+vo.toString());
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
		System.out.println("파일번호는?"+vo);
		service.fileDel(vo);
	}
	
	@RequestMapping(value = "/detailwrite",method = RequestMethod.GET)
	public String DetailWrite() {
		
		return ".edu.detail.write";
	}
	
	@RequestMapping(value = "/detailwrite", method = RequestMethod.POST)
	public String DetailWriteOk(EduDetailVo vo,MultipartHttpServletRequest req) throws Exception {
		System.out.println("디테일내용=>"+vo.toString());
		List<MultipartFile> filelist = req.getFiles("file"); 
		service.detailWrite(vo);
		int detNum = vo.getDetNum();
		System.out.println("파일번호는?"+detNum);
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
