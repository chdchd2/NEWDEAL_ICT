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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.newdeal.ict.Service.FestivalService;
import com.newdeal.ict.Vo.CommonFileVo;
import com.newdeal.ict.Vo.FesDetailVo;
import com.newdeal.ict.Vo.FestivalVo;
import com.newdeal.ict.Vo.IntDetailJoinVo;
import com.newdeal.ict.Vo.IntroduceVo;
import com.newdeal.ict.Vo.MemberVo;

@Controller
@RequestMapping("/festival/*")
public class FestivalController {
	@Autowired
	private FestivalService service;
	
	@RequestMapping(value = "/write",method = RequestMethod.GET)
	public String write() {
		
		return ".festival.write";
	}
	
	@RequestMapping(value="/write", method = RequestMethod.POST)
	public String writePOST(FestivalVo vo, RedirectAttributes rttr)  
			throws Exception{
		
	 System.out.println("write post....");
	 System.out.println("=====================>"+vo.toString());
	//글 작성하기
	 service.fesWrite(vo);
	 System.out.println("service.write======>"+vo.toString());
	//첨부파일 처리하기
			/*List<MultipartFile> filelist = req.getFiles("file"); 
			int num=service.intmaxNum();
			service.intfileWrite(filelist, num);
			*/
			return "redirect:/festival/list";
	}
	
	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public String List(@RequestParam(value="pageNum",defaultValue="1")int pageNum,Model model) throws Exception {
	
		HashMap<String, Object> map=service.list(pageNum);
		model.addAttribute("list",map.get("list"));
		model.addAttribute("pu",map.get("pu"));
		
		return ".festival.list";
	}
	
	@RequestMapping(value = "/fesDetail",method = RequestMethod.GET)
	public String fesDetail(int fesNum,Model model) throws Exception {
		
		FesDetailVo vo=service.fesDetail(fesNum);
		System.out.println("===>out"+vo.toString());
		model.addAttribute("FestivalVo",vo);
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
		FestivalVo fesvo=service.getWriter(fesNum);
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
		FestivalVo fesvo=service.getWriter(fesNum);
		
		if(fesvo.getMemNum()==vo.getMemNum()) {
			System.out.println("작성자와 로그인한 사용자가 같으니까 수정으로 넘겨줌");
			FesDetailVo editvo=service.fesDetail(fesNum);
			model.addAttribute("vo",editvo);
		}else {
			System.out.println("같지않다.");
		}
		
		return ".festival.edit";
	}
	
	@RequestMapping(value = "/fesEdit",method = RequestMethod.POST)
	public String fesEditOk(FestivalVo vo,MultipartHttpServletRequest req) throws Exception {
		System.out.println("-------------------");
		System.out.println("수정시 정보들"+vo.toString());
		List<MultipartFile> filelist = req.getFiles("file"); 
		int num=service.fesmaxNum();
		service.intfileWrite(filelist, num);
		System.out.printf("----> filelist :" + filelist, "----> num :" + num);
		service.fesEdit(vo);
		System.out.printf("----> fesEdit(vo) :" + vo);
		
		return "redirect:/festival/list";
	}
	@RequestMapping(value = "/fileDel",method = RequestMethod.POST)
	@ResponseBody
	public void fileDel(CommonFileVo vo) throws Exception{
		System.out.println("파일번호는?"+vo);
		service.fileDel(vo);
	}
	
}
