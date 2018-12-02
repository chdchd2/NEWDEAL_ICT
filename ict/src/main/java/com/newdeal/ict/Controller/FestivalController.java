package com.newdeal.ict.Controller;

import java.io.File;
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
import com.newdeal.ict.Service.FestivalService;
import com.newdeal.ict.Vo.CommonFileVo;
import com.newdeal.ict.Vo.EduDetailVo;
import com.newdeal.ict.Vo.FesDetailVo;
import com.newdeal.ict.Vo.FestivalVo;
import com.newdeal.ict.Vo.MemberVo;

@Controller
@RequestMapping("/festival/*")
public class FestivalController {
	@Autowired
	private FestivalService service;
	@Autowired
	private CommonService commonservice;
	
	@RequestMapping(value = "/write",method = RequestMethod.GET)
	public String write() {
		
		return ".festival.write";
	}
	
	@RequestMapping(value="/write", method = RequestMethod.POST)
	public String writePOST(FestivalVo vo, MultipartHttpServletRequest req)  
			throws Exception{

	//글 작성하기
	 service.fesWrite(vo);
	 System.out.println("service.write======>"+vo.toString());
	//첨부파일 처리하기
			List<MultipartFile> filelist = req.getFiles("file"); 
			int fileRefNum=service.fesmaxNum();
			String fileRefBoard="EDU_INTRODUCE";
			commonservice.fileWrite(filelist, fileRefNum,fileRefBoard);
			System.out.println("파일쓰는부분 여기 오는지");
		
			return "redirect:/festival/list";
	}
	
	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public String List(@RequestParam(value="pageNum",defaultValue="1")int pageNum,Model model,String searchType,String searchWord) throws Exception {
	
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pageNum", pageNum);
		map.put("searchType",searchType);
		map.put("searchWord",searchWord);
		map = service.list(map);
		
		model.addAttribute("list",map.get("list"));
		model.addAttribute("pu",map.get("pu"));
		model.addAttribute("searchType",searchType);
		model.addAttribute("searchWord",searchWord);
		
		return ".festival.list";
	}
	
	@RequestMapping(value = "/fesDetail",method = RequestMethod.GET)
	public String fesDetail(int fesNum,Model model) throws Exception {
		
		FestivalVo vo=service.fesDetail(fesNum);
		FestivalVo prev=service.intPrev(fesNum);
		FestivalVo next=service.intNext(fesNum);
		
		model.addAttribute("FestivalVo",vo);
		model.addAttribute("prev",prev);
		model.addAttribute("next",next);
		
		return ".festival.detail";
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
	
	@RequestMapping(value = "/fesDelete",method = RequestMethod.GET)
	public String fesDelete(int fesNum,HttpSession session) throws Exception {
		MemberVo vo=(MemberVo)session.getAttribute("member");
		FesDetailVo fesvo=service.getWriter(fesNum);
		System.out.println("==========>fesvo :" + fesvo);
		if(fesvo.getMemNum()==vo.getMemNum()) {
			System.out.println("작성자와 로그인한 사용자가 같으니까 삭제처리");
			int n=service.fesDelete(fesNum);
			System.out.println("==========>삭제성공 :" +  n);
		}else {
			System.out.println("같지않다.");
			System.out.println("=================>삭제실패 ");
		}
		return "redirect:/festival/list";
	}
	
	@RequestMapping(value = "/fesEdit",method = RequestMethod.GET)
	public String fesEdit(int fesNum,HttpSession session,Model model) throws Exception {
		MemberVo vo=(MemberVo)session.getAttribute("member");
		System.out.println("===========================vo"+vo);
		FesDetailVo fesvo=service.getWriter(fesNum);
		System.out.println("======================fesvo:"+fesvo.toString());
		
		if(fesvo.getMemNum()==vo.getMemNum()) {
			System.out.println("작성자와 로그인한 사용자가 같으니까 수정으로 넘겨줌");
			FestivalVo edit=service.fesDetail(fesNum);
			model.addAttribute("vo",edit);
		}else {
			System.out.println("같지않다.");
		}
		
		return ".festival.edit";
	}
	
	@RequestMapping(value = "/fesEdit",method = RequestMethod.POST)
	public String fesEditOk(FestivalVo vo,MultipartHttpServletRequest req) throws Exception {
		System.out.println("수정시 정보들"+vo.toString());
		List<MultipartFile> filelist = req.getFiles("file"); 
		String fileRefBoard="FESTIVAL";
		int num=vo.getFesNum();
		commonservice.fileWrite(filelist, num,fileRefBoard);
		service.fesEdit(vo);
	
		
		return "redirect:/festival/list";
	}
	
	/*@RequestMapping(value = "/fesEdit",method = RequestMethod.POST)
	public String fesEditOk(FestivalVo vo,MultipartHttpServletRequest req) throws Exception {
		System.out.println("수정시 정보들"+vo.toString());
		List<MultipartFile> filelist = req.getFiles("file"); 
		String fileRefBoard="FESTIVAL";
		int num=vo.getFesNum();
		commonservice.fileWrite(filelist, num,fileRefBoard);
		service.fesEdit(vo);
	
		
		return "redirect:/festival/list";
	}*/
	
	@RequestMapping(value = "/fileDel",method = RequestMethod.POST)
	@ResponseBody
	public void fileDel(CommonFileVo vo) throws Exception{
		System.out.println("파일번호는?"+vo);
		service.fileDel(vo);
	}
	
	@RequestMapping(value = "/detailwrite",method = RequestMethod.GET)
	public String DetailWrite() {
		
		return ".festival.detail.write";
	}
	
	@RequestMapping(value = "/detailwrite", method = RequestMethod.POST)
	public String DetailWriteOk(FesDetailVo vo,MultipartHttpServletRequest req) throws Exception {
		System.out.println("디테일내용=>"+vo.toString());
		List<MultipartFile> filelist = req.getFiles("file"); 
		service.detailWrite(vo);
		int detNum = vo.getDetNum();
		System.out.println("파일번호는?"+detNum);
		String fileRefBoard="FESTIVAL";
		commonservice.fileWrite(filelist, detNum,fileRefBoard);
		
		return "";
	}
	
	@RequestMapping(value = "/detailList",method = RequestMethod.GET)
	public String detailList(@RequestParam(value="pageNum",defaultValue="1")int pageNum,Model model) throws Exception {
	
		HashMap<String, Object> map=service.detailList(pageNum);
		model.addAttribute("list",map.get("list"));
		model.addAttribute("pu",map.get("pu"));
		
		return ".festival.detail.list";
	}
	
	
}
