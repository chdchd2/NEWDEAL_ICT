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
@RequestMapping("/festival")
public class FestivalController {
	@Autowired
	private FestivalService service;
	@Autowired
	private CommonService commonservice;
	
	@RequestMapping(value = "/write",method = RequestMethod.GET)
	public String write() {
		System.out.println("오는지=>?");
		return ".festival.write";
	}
	
	@RequestMapping(value="/write", method = RequestMethod.POST)
	public String writePOST(@ModelAttribute FestivalVo vo, HttpSession session, MultipartHttpServletRequest multiRequest)  
			throws Exception{
		System.out.println("이쪽으로 오는지 체크===>");
	 service.fesWrite(vo);
	 System.out.println("service.write======>"+vo.toString());
	//筌ｂ벂�쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 筌ｌ꼪�쐻占쎈짗占쎌굲占쎈쐻占쎈뼣繹먮씮�굲
			
			int fileRefNum=service.fesmaxNum();
			String fileRefBoard="FESTIVAL";
			
			commonservice.intfileWrite(fileRefNum,fileRefBoard,multiRequest);
			System.out.println("占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈뼣占쎈섣占쎌굲占쎈쐻占쎈뱟�겫占썽뇡�빘�굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲");
		
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
		System.out.println("占쎈쐻占쎈짗占쎌굲占쎈뱜占쎈쐻占쎈뼩筌뚭쑴�굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈뼣占쎈뼄占쎌뒻占쎌굲欲뀐옙占쎈샵占쎈쐻占쎈짗占쎌굲占쎈쐻�뜝占� 占쎈쐻占쎈뱟占쎈솇占쎌굲.");
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
			System.out.println("�뜝�럩�굚�뜝�럡�뎽�뜝�럩�겱�뜝�룞�삕 �슖�돦裕꾬옙�쟽�뜝�럩逾ε뜝�럥由� �뜝�럡�뀬�뜝�럩�뮔�뜝�럩�겱�뤆�룊�삕 �뤆�룇�듌占쎈さ�뜝�럥鍮띸뭐癒뀁삕 �뜝�럡�뀭�뜝�럩�젷嶺뚳퐣瑗띰옙遊�");
			int n=service.fesDelete(fesNum);
			System.out.println("==========>�뜝�럡�뀭�뜝�럩�젷�뜝�럩�걦占쎈쇀�뜝占� :" +  n);
		}else {
			System.out.println("�뤆�룇�듌�뜝占� �뜝�럥瑜ュ뜝�럩踰�.");
			System.out.println("=================>�뜝�럡�뀭�뜝�럩�젷�뜝�럥堉꾢뜝�럥�넮 ");
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
			System.out.println("占쎈쐻占쎈솙占쎈닰占쎌굲占쎈쐻占쎈솓占쎌뒻占쎌굲 占쎈쐻占쎈뼢繹먮씮�굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲耶껓옙占쎈쐻�뜝占� 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈뼣繹먮씮�굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈뼩�ⓦ끉�굲占쎈쐻占쎈짗占쎌굲");
			FestivalVo edit=service.fesDetail(fesNum);
			model.addAttribute("vo",edit);
		}else {
			System.out.println("占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈뼏占쎈솇占쎌굲.");
		}
		
		return ".festival.edit";
	}
	
	@RequestMapping(value = "/fesEdit",method = RequestMethod.POST)
	public String fesEditOk(FestivalVo vo,MultipartHttpServletRequest req) throws Exception {
		String fileRefBoard="FESTIVAL";
		int num=vo.getFesNum();
		
		commonservice.intfileWrite(num,fileRefBoard,req);
		service.fesEdit(vo);
	
		
		return "redirect:/festival/list";
	}
	
	
	@RequestMapping(value = "/fileDel",method = RequestMethod.POST)
	@ResponseBody
	public void fileDel(CommonFileVo vo) throws Exception{
		System.out.println("占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈뼣獄�袁⑹굲占쎌깈占쎈쐻占쎈짗占쎌굲?"+vo);
		service.fileDel(vo);
	}
	
	@RequestMapping(value = "/detailwrite",method = RequestMethod.GET)
	public String DetailWrite() {
		
		return ".festival.detail.write";
	}
	
	@RequestMapping(value = "/detailwrite", method = RequestMethod.POST)
	public String DetailWriteOk(FesDetailVo vo,MultipartHttpServletRequest req, HttpServletRequest request) throws Exception {
		System.out.println("占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈뼣占쎈꺋占쎌굲占쎈쐻占쎈짗占쎌굲=>"+vo.toString());
		List<MultipartFile> filelist = req.getFiles("file"); 
		
		String detPart = request.getParameter("detPart");
		
		service.detailWrite(vo);
		int detNum = vo.getDetNum();
		
		String fileRefBoard="FESTIVALDEL";
		commonservice.intfileWrite(detNum,fileRefBoard,req);
		
		return "redirect:/festival/detailList";
	}
	
	@RequestMapping(value = "/detailList",method = RequestMethod.GET)
	public String detailList(@RequestParam(value="pageNum",defaultValue="1")int pageNum,Model model,String searchType,String searchWord,String detPart) throws Exception {
	

		System.out.println("遺꾩빞援щ텇��?=>"+detPart);
		
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
			System.out.println("占쎈쐻占쎈솙占쎈닰占쎌굲占쎈쐻占쎈솓占쎌뒻占쎌굲 占쎈쐻占쎈뼢繹먮씮�굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲耶껓옙占쎈쐻�뜝占� 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈뼣繹먮씮�굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈뼩�ⓦ끉�굲占쎈쐻占쎈짗占쎌굲");
			FesDetailVo edit=service.detDetail(detNum);
			model.addAttribute("vo",edit);
		}else {
			System.out.println("占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈뼏占쎈솇占쎌굲.");
		}
		
		return ".festival.detail.edit";
	}
	
	@RequestMapping(value = "/detEdit",method = RequestMethod.POST)
	public String detEditOk(FesDetailVo vo,MultipartHttpServletRequest req) throws Exception {
		String fileRefBoard="FESTIVAL";
		int num=vo.getDetNum();
		
		commonservice.intfileWrite(num,fileRefBoard,req);
		service.detEdit(vo);
	
		
		return "redirect:/festival/list";
	}
	
	@RequestMapping(value = "/detDelete",method = RequestMethod.GET)
	public String detDelete(int detNum,HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println("�궘�젣�삤�뒗吏�==");
		MemberVo vo=(MemberVo)session.getAttribute("member");
		FesDetailVo fesvo=service.getWriterD(detNum);
		
		String detPart = request.getParameter("detPart");
		
		System.out.println("==========>fesvo :" + fesvo);
		System.out.println("fesvo.getMemNum() :" + fesvo.getMemNum() + "vo.getMemNum()" + vo.getMemNum());
		if(fesvo.getMemNum()==vo.getMemNum()) {
		
			System.out.println("�씪移섑븳�씤媛�");
			System.out.println("�꽆�뼱�삩 �닽�옄�솗�씤"+detNum);
			int n=service.detDelete(detNum);
			System.out.println("==========>吏��썙�졇�씪 :" +  n);
		}else {
			System.out.println("�떖�윭�떖�윭.");
			System.out.println("=================>袁몄뿊 ");
		}
		return "redirect:/festival/detailList";
	}
	
}