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
	public String writePOST(@ModelAttribute FestivalVo vo, HttpSession session, MultipartHttpServletRequest multiRequest)  
			throws Exception{

	//�뜝�룞�삕 �뜝�뙗�눦�삕�뜝�떦源띿삕
	 service.fesWrite(vo);
	 System.out.println("service.write======>"+vo.toString());
	//泥ⓨ뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 泥섇뜝�룞�삕�뜝�떦源띿삕
			
			int fileRefNum=service.fesmaxNum();
			String fileRefBoard="FESTIVAL";
			
			commonservice.intfileWrite(fileRefNum,fileRefBoard,multiRequest);
			System.out.println("�뜝�룞�삕�뜝�떦�뼲�삕�뜝�듅遺�釉앹삕 �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕");
		
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
		System.out.println("�뜝�룞�삕�듃�뜝�떬琉꾩삕 �뜝�룞�삕�뜝�떦�떎�슱�삕鰲��뼥�뜝�룞�삕�뜝占� �뜝�듅�뙋�삕.");
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
			System.out.println("占쎌삂占쎄쉐占쎌쁽占쏙옙 嚥≪뮄�젃占쎌뵥占쎈립 占쎄텢占쎌뒠占쎌쁽揶쏉옙 揶쏆늿�몵占쎈빍繹먲옙 占쎄텣占쎌젫筌ｌ꼶�봺");
			int n=service.fesDelete(fesNum);
			System.out.println("==========>占쎄텣占쎌젫占쎌끏�뙴占� :" +  n);
		}else {
			System.out.println("揶쏆늿占� 占쎈륫占쎌벉.");
			System.out.println("=================>占쎄텣占쎌젫占쎈뼄占쎈솭 ");
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
			System.out.println("�뜝�뙗�눦�삕�뜝�뙓�슱�삕 �뜝�떥源띿삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕孃��뜝占� �뜝�룞�삕�뜝�룞�삕�뜝�떦源띿삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�떬怨ㅼ삕�뜝�룞�삕");
			FestivalVo edit=service.fesDetail(fesNum);
			model.addAttribute("vo",edit);
		}else {
			System.out.println("�뜝�룞�삕�뜝�룞�삕�뜝�떗�뙋�삕.");
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
		System.out.println("�뜝�룞�삕�뜝�떦諭꾩삕�샇�뜝�룞�삕?"+vo);
		service.fileDel(vo);
	}
	
	@RequestMapping(value = "/detailwrite",method = RequestMethod.GET)
	public String DetailWrite() {
		
		return ".festival.detail.write";
	}
	
	@RequestMapping(value = "/detailwrite", method = RequestMethod.POST)
	public String DetailWriteOk(FesDetailVo vo,MultipartHttpServletRequest req, HttpServletRequest request) throws Exception {
		System.out.println("�뜝�룞�삕�뜝�룞�삕�뜝�떦�냲�삕�뜝�룞�삕=>"+vo.toString());
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
		
		map.put("pageNum", pageNum);
		map.put("searchType",searchType);
		map.put("searchWord",searchWord);
		map.put("detPart", detPart);
		
		map = service.detailList(map);
		model.addAttribute("detPart",detPart);
		System.out.println("detPart :"+detPart);
		
		model.addAttribute("list",map.get("list"));                
		model.addAttribute("pu",map.get("pu"));
		
		model.addAttribute("searchType",searchType);
		System.out.println("searchType :"+searchType);
		
		model.addAttribute("searchWord",searchWord);
		System.out.println("searchWord :"+searchWord);
		
		return ".festival.detail.list";
	}
	
	@RequestMapping(value = "/detEdit",method = RequestMethod.GET)
	public String detEdit(int detNum,HttpSession session,Model model) throws Exception {
		MemberVo vo=(MemberVo)session.getAttribute("member");
		System.out.println("===========================vo"+vo);
		FesDetailVo detvo=service.getWriterD(detNum);
		System.out.println("======================fesvo:"+detvo.toString());
		
		if(detvo.getMemNum()==vo.getMemNum()) {
			System.out.println("�뜝�뙗�눦�삕�뜝�뙓�슱�삕 �뜝�떥源띿삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕孃��뜝占� �뜝�룞�삕�뜝�룞�삕�뜝�떦源띿삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�떬怨ㅼ삕�뜝�룞�삕");
			FesDetailVo edit=service.detDetail(detNum);
			model.addAttribute("vo",edit);
		}else {
			System.out.println("�뜝�룞�삕�뜝�룞�삕�뜝�떗�뙋�삕.");
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
		System.out.println("삭제오는지==");
		MemberVo vo=(MemberVo)session.getAttribute("member");
		FesDetailVo fesvo=service.getWriterD(detNum);
		
		String detPart = request.getParameter("detPart");
		
		System.out.println("==========>fesvo :" + fesvo);
		System.out.println("fesvo.getMemNum() :" + fesvo.getMemNum() + "vo.getMemNum()" + vo.getMemNum());
		if(fesvo.getMemNum()==vo.getMemNum()) {
		
			System.out.println("일치한인간");
			int n=service.fesDelete(detNum);
			System.out.println("==========>지워져라 :" +  n);
		}else {
			System.out.println("달러달러.");
			System.out.println("=================>꾸엑 ");
		}
		return "redirect:/festival/detailList";
	}
	
}
