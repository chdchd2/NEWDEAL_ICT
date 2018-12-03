package com.newdeal.ict.Controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;

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
import com.newdeal.ict.Service.FestivalService;
import com.newdeal.ict.Vo.CommonFileVo;
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
	public String writePOST(FestivalVo vo, MultipartHttpServletRequest multiRequest)  
			throws Exception{

	//占쏙옙 占쌜쇽옙占싹깍옙
	 service.fesWrite(vo);
	 System.out.println("service.write======>"+vo.toString());
	//첨占쏙옙占쏙옙占쏙옙 처占쏙옙占싹깍옙
			
			int fileRefNum=service.fesmaxNum();
			String fileRefBoard="FESTIVAL";
			
			commonservice.fileWrite(fileRefNum,fileRefBoard,multiRequest);
			System.out.println("占쏙옙占싹억옙占승부븝옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙");
		
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
	
	@RequestMapping(value = "/detDetail",method = RequestMethod.GET)
	public String detDetail(int detNum,Model model,HttpServletRequest request) throws Exception {
		
		FesDetailVo vo=service.detDetail(detNum);
		FesDetailVo prev=service.detPrev(detNum);
		FesDetailVo next=service.detNext(detNum);
		
		String detPart = request.getParameter("detPart");
		
		model.addAttribute("FesDetailVo",vo);
		model.addAttribute("prev",prev);
		model.addAttribute("next",next);
		
		return ".festival.detail.detail";
	}
	
	@RequestMapping(value="/fileDown" )
	public ModelAndView contactoDownload(@ModelAttribute CommonFileVo filevo) throws Exception{
		System.out.println("占쏙옙트占싼뤄옙 占쏙옙占싹다울옙觀閨占쏙옙占� 占승댐옙.");
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
			System.out.println("�옉�꽦�옄�� 濡쒓렇�씤�븳 �궗�슜�옄媛� 媛숈쑝�땲源� �궘�젣泥섎━");
			int n=service.fesDelete(fesNum);
			System.out.println("==========>�궘�젣�셿猷� :" +  n);
		}else {
			System.out.println("媛숈� �븡�쓬.");
			System.out.println("=================>�궘�젣�떎�뙣 ");
		}
		return "redirect:/festival/list";
	}
	
	@RequestMapping(value = "/fesEdit",method = RequestMethod.GET)
	public String fesEdit(int fesNum,HttpSession session,Model model) throws Exception {
		MemberVo vo=(MemberVo)session.getAttribute("member");
		System.out.println("===========================vo"+vo);
		FestivalVo fesvo=service.getWriter(fesNum);
		System.out.println("======================fesvo:"+fesvo.toString());
		
		if(fesvo.getMemNum()==vo.getMemNum()) {
			System.out.println("占쌜쇽옙占쌘울옙 占싸깍옙占쏙옙占쏙옙 占쏙옙占쏙옙微占� 占쏙옙占쏙옙占싹깍옙 占쏙옙占쏙옙占쏙옙占쏙옙 占싼곤옙占쏙옙");
			FestivalVo edit=service.fesDetail(fesNum);
			model.addAttribute("vo",edit);
		}else {
			System.out.println("占쏙옙占쏙옙占십댐옙.");
		}
		
		return ".festival.edit";
	}
	
	@RequestMapping(value = "/fesEdit",method = RequestMethod.POST)
	public String fesEditOk(FestivalVo vo,MultipartHttpServletRequest req) throws Exception {
		String fileRefBoard="FESTIVAL";
		int num=vo.getFesNum();
		
		commonservice.fileWrite(num,fileRefBoard,req);
		service.fesEdit(vo);
	
		
		return "redirect:/festival/list";
	}
	
	
	@RequestMapping(value = "/fileDel",method = RequestMethod.POST)
	@ResponseBody
	public void fileDel(CommonFileVo vo) throws Exception{
		System.out.println("占쏙옙占싹뱄옙호占쏙옙?"+vo);
		service.fileDel(vo);
	}
	
	@RequestMapping(value = "/detailwrite",method = RequestMethod.GET)
	public String DetailWrite() {
		
		return ".festival.detail.write";
	}
	
	@RequestMapping(value = "/detailwrite", method = RequestMethod.POST)
	public String DetailWriteOk(FesDetailVo vo,MultipartHttpServletRequest req, HttpServletRequest request) throws Exception {
		System.out.println("占쏙옙占쏙옙占싹놂옙占쏙옙=>"+vo.toString());
		List<MultipartFile> filelist = req.getFiles("file"); 
		
		String detPart = request.getParameter("detPart");
		
		service.detailWrite(vo);
		int detNum = vo.getDetNum();
		
		String fileRefBoard="FESTIVALDEL";
		commonservice.fileWrite(detNum,fileRefBoard,req);
		
		return "redirect:/festival/detailList";
	}
	
	@RequestMapping(value = "/detailList",method = RequestMethod.GET)
	public String detailList(@RequestParam(value="pageNum",defaultValue="1")int pageNum,Model model,String searchType,String searchWord,String detPart) throws Exception {
	
		System.out.println("분야구분은?=>"+detPart);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		/*map.put("detPartgubun", detPartgubun);*/
		map.put("pageNum", pageNum);
		map.put("searchType",searchType);
		map.put("searchWord",searchWord);
		map.put("detPart", detPart);
		//List<FesDetailVo> detPart=service.detPart();
		
		map = service.detailList(map);
		//model.addAttribute("detPart",detPart);
		model.addAttribute("list",map.get("list"));
		model.addAttribute("pu",map.get("pu"));
		model.addAttribute("searchType",searchType);
		model.addAttribute("searchWord",searchWord);
		
		return ".festival.detail.list";
	}
	
	@RequestMapping(value = "/detEdit",method = RequestMethod.GET)
	public String detEdit(int detNum,HttpSession session,Model model) throws Exception {
		MemberVo vo=(MemberVo)session.getAttribute("member");
		System.out.println("===========================vo"+vo);
		FesDetailVo detvo=service.getWriterD(detNum);
		System.out.println("======================fesvo:"+detvo.toString());
		
		if(detvo.getMemNum()==vo.getMemNum()) {
			System.out.println("占쌜쇽옙占쌘울옙 占싸깍옙占쏙옙占쏙옙 占쏙옙占쏙옙微占� 占쏙옙占쏙옙占싹깍옙 占쏙옙占쏙옙占쏙옙占쏙옙 占싼곤옙占쏙옙");
			FesDetailVo edit=service.detDetail(detNum);
			model.addAttribute("vo",edit);
		}else {
			System.out.println("占쏙옙占쏙옙占십댐옙.");
		}
		
		return ".festival.detail.edit";
	}
	
	@RequestMapping(value = "/detEdit",method = RequestMethod.POST)
	public String detEditOk(FesDetailVo vo,MultipartHttpServletRequest req) throws Exception {
		String fileRefBoard="FESTIVAL";
		int num=vo.getDetNum();
		
		commonservice.fileWrite(num,fileRefBoard,req);
		service.detEdit(vo);
	
		
		return "redirect:/festival/list";
	}
	
	@RequestMapping(value = "/detDelete",method = RequestMethod.GET)
	public String detDelete(int detNum,HttpSession session, HttpServletRequest request) throws Exception {
		MemberVo vo=(MemberVo)session.getAttribute("member");
		FesDetailVo fesvo=service.getWriterD(detNum);
		
		String detPart = request.getParameter("detPart");
		
		System.out.println("==========>fesvo :" + fesvo);
		if(fesvo.getMemNum()==vo.getMemNum()) {
			System.out.println("�옉�꽦�옄�� 濡쒓렇�씤�븳 �궗�슜�옄媛� 媛숈쑝�땲源� �궘�젣泥섎━");
			int n=service.fesDelete(detNum);
			System.out.println("==========>占쏙옙占쏙옙占쏙옙占쏙옙 :" +  n);
		}else {
			System.out.println("占쏙옙占쏙옙占십댐옙.");
			System.out.println("=================>占쏙옙占쏙옙占쏙옙占쏙옙 ");
		}
		return "redirect:/festival/detailList";
	}
	
}
