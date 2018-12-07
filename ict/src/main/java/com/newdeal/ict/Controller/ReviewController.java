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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.newdeal.ict.Service.CommonService;
import com.newdeal.ict.Service.ReviewService;
import com.newdeal.ict.Vo.CommentVo;
import com.newdeal.ict.Vo.CommonFileVo;
import com.newdeal.ict.Vo.FreeBoardVo;
import com.newdeal.ict.Vo.MemberVo;
import com.newdeal.ict.Vo.ReviewVo;

@Controller
@RequestMapping(value = "/review")
public class ReviewController {
	@Autowired
	private ReviewService service;
	@Autowired
	private CommonService commonservice;
	
	@RequestMapping(value = "/rvWrite",method = RequestMethod.GET)
	public String rvWrite() {
		
		return ".review.write";
	}
	
	@RequestMapping(value = "/rvWrite", method = RequestMethod.POST)
	public String rvWriteOk(ReviewVo vo,MultipartHttpServletRequest multiRequest,HttpSession session, HttpServletRequest request) throws Exception {
		MemberVo member=(MemberVo)session.getAttribute("member");

		String rvPart = request.getParameter("rvPart");
		service.rvWrite(vo);
		int fileRefNum=service.rvmaxNum();
		String fileRefBoard="REVIEW";
		commonservice.fileWrite(fileRefNum,fileRefBoard,multiRequest);
		return "redirect:/review/rvList";
	}
	
	@RequestMapping(value = "/rvList",method = RequestMethod.GET)
	public String rvList(@RequestParam(value="pageNum",defaultValue="1")int pageNum,Model model,String searchType,String searchWord,String rvPart) throws Exception {

		System.out.println("분야구분은?=>"+rvPart);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("pageNum", pageNum);
		map.put("searchType",searchType);
		map.put("searchWord",searchWord);
		map.put("rvPart", rvPart);
		
		map = service.rvList(map);
		model.addAttribute("rvPart",rvPart);
		System.out.println("rvPart :"+rvPart);
		model.addAttribute("list",map.get("list"));
		model.addAttribute("pu",map.get("pu"));
		model.addAttribute("searchType",searchType);
		model.addAttribute("searchWord",searchWord);
		
		return ".review.list";
	}
	
	@RequestMapping(value = "/rvDetail",method = RequestMethod.GET)
	public String rvRvail(int rvNum,Model model,HttpServletRequest request) throws Exception {

		List<CommentVo> commentList=service.commentList(rvNum);
		ReviewVo vo=service.rvDetail(rvNum);
		ReviewVo prev=service.rvPrev(rvNum);
		ReviewVo next=service.rvNext(rvNum);
		

		String rvPart = request.getParameter("rvPart");
		
		model.addAttribute("vo",vo);
		model.addAttribute("prev",prev);
		model.addAttribute("next",next);
		model.addAttribute("commentList",commentList);
		
		return ".review.detail";
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
	
	@RequestMapping(value = "/rvDelete",method = RequestMethod.GET)
	public String rvDelete(int rvNum,HttpSession session, HttpServletRequest request) throws Exception {
		MemberVo vo=(MemberVo)session.getAttribute("member");
		System.out.println("삭제할 글번호는?"+rvNum);
		ReviewVo rvvo=service.rvgetWriter(rvNum);
		String rvPart = request.getParameter("rvPart");
		System.out.println(rvvo.getMemNum());
		System.out.println(vo.getMemNum());
		if(rvvo.getMemNum()==vo.getMemNum()) {
			int n=service.rvDelete(rvNum);
			
		}else {
			System.out.println("媛숈��븡�떎.");
		}
		
		
		return "redirect:/review/rvList";
	}
	
	@RequestMapping(value = "/rvEdit",method = RequestMethod.GET)
	public String rvEdit(int rvNum,HttpSession session,Model model) throws Exception {
		MemberVo vo=(MemberVo)session.getAttribute("member");
		ReviewVo rvvo=service.rvgetWriter(rvNum);
		
		if(rvvo.getMemNum()==vo.getMemNum()) {
			ReviewVo editvo=service.rvDetail(rvNum);
			model.addAttribute("vo",editvo);
		}else {
			System.out.println("媛숈��븡�떎.");
		}
		
		return ".review.edit";
	}
	
	@RequestMapping(value = "/rvEdit",method = RequestMethod.POST)
	public String intEditOk(ReviewVo vo,MultipartHttpServletRequest req) throws Exception {
		String fileRefBoard="REVIEW";
		int num=vo.getRvNum();
		commonservice.fileWrite(num,fileRefBoard,req);
		service.rvEdit(vo);
		
		return "redirect:/review/rvList";
	}
	@RequestMapping(value = "/fileDel",method = RequestMethod.POST)
	@ResponseBody
	public void fileDel(CommonFileVo vo) throws Exception {
		System.out.println("삭제요청"+vo.toString());
		service.fileDel(vo);
	}
	
	@RequestMapping(value = "/comment.do",method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> comment(CommentVo vo) throws Exception {
		HashMap<String, Object> map=new HashMap<String, Object>();
		System.out.println("vodsafsdafsadfsdfaf"+vo.toString());
		vo.setComType("REVIEW");
		service.comment(vo);
		int rvNum=vo.getComBnum();
		List<CommentVo> commentlist=service.commentList(rvNum);
		for(CommentVo vo2:commentlist){
			System.out.println(vo2.toString());
		}
		map.put("commentList", commentlist);
		System.out.println(commentlist.toString());
		
		return map;
	}
   

    @RequestMapping("/comDel")
    @ResponseBody
    public HashMap<String, Object> comDel(int comNum) throws Exception {
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	ReviewVo vo = null;
    	service.comDel(comNum);
    	List<CommentVo> commentlist=service.commentList(vo.getRvNum());
    
    	map.put("commentList", commentlist);
    	System.out.println(commentlist.toString());
		return map;
    }
	
	
	

}
