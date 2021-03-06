package com.newdeal.ict.Controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.newdeal.ict.Service.CommonService;
import com.newdeal.ict.Service.FreeBoardService;
import com.newdeal.ict.Util.Pager;
import com.newdeal.ict.Vo.CommentVo;
import com.newdeal.ict.Vo.CommonFileVo;
import com.newdeal.ict.Vo.FreeBoardVo;

@Controller
@RequestMapping("/freeboard/*")
public class FreeBoardController {
	private static final Logger logger=
			LoggerFactory.getLogger(FreeBoardController.class);
	
	@Inject
	FreeBoardService service;
	@Inject
	CommonService commonservice;
	
	@RequestMapping("list.do")
	public ModelAndView list(
			@RequestParam(defaultValue="1") int curPage,
			@RequestParam(defaultValue="all") String search_option
			, @RequestParam(defaultValue="") String keyword) throws Exception{
		//레코드 갯수 계산
		int count = service.countArticle(
				search_option, keyword);
		//페이지의 시작번호, 끝번호 계산
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end=pager.getPageEnd();
		List<FreeBoardVo> list=service.listAll(
				start, end, search_option, keyword);
		ModelAndView mav=new ModelAndView();
		mav.setViewName(".freeboard.list");
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", list.size());
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("pager", pager);
		mav.addObject("map", map);
		/*map으로 묶지 않았을 경우
		 * mav.addObject("list", list);
		mav.addObject("count", list.size());*/
		//list.jsp로 포워딩
		return mav;
	}
	
	@RequestMapping("write.do")
	public String write(){
		return ".freeboard.write"; //views/board/write.jsp
	}
	
	
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute FreeBoardVo vo,HttpSession session, MultipartHttpServletRequest multiRequest) throws Exception{
		/*vo.setFbWriter((String)session.getAttribute("member"));*/
		System.out.println("=====================>"+vo.toString());
		service.create(vo);
		//첨부파일 처리하기
		int fileRefNum = service.fbmaxNum();
		String fileRefBoard = "FREEBOARD";
		commonservice.fileWrite(fileRefNum, fileRefBoard, multiRequest);
		return "redirect:/freeboard/list.do";
	}
	
	@RequestMapping("view.do")
	public ModelAndView view(@RequestParam int fbNum
			,HttpSession session) throws Exception {
		//조회수 증가 처리
		service.increaseViewcnt(fbNum, session);
		
		/*//0718추가
		List<BoardDTO> list2=boardService.PNList(bno);
		//
*/		
		//레코드를 리턴받음
		ModelAndView mav=new ModelAndView();
		
		/*mav.addObject("list2",list2);*/
		List<CommentVo> commentList=service.commentList(fbNum);
		mav.setViewName(".freeboard.view");
		mav.addObject("vo", service.read(fbNum));
		mav.addObject("prev", service.fbPrev(fbNum));
		mav.addObject("next", service.fbNext(fbNum));
		mav.addObject("commentList",commentList);
		return mav;
	}
	
	@RequestMapping("updateView.do")
	public ModelAndView updateView(@RequestParam int fbNum ,HttpSession session) throws Exception {
		
		ModelAndView mav=new ModelAndView();
		
		
		mav.setViewName(".freeboard.modify");
		mav.addObject("vo", service.read(fbNum));
		return mav;
	}
	
	//게시물내용수정
	@RequestMapping("update.do")
	public String update(@ModelAttribute FreeBoardVo vo, MultipartHttpServletRequest req) throws Exception {

		String fileRefBoard="FREEBOARD";
		int num=vo.getFbNum();
		commonservice.fileWrite(num,fileRefBoard,req);
		service.update(vo);
		
		//수정상세화면
		//return "redirect:/freeboard/view.do?fbNum="+vo.getFbNum();
		return "redirect:/freeboard/list.do";
	}
	
	@RequestMapping("delete.do")
	public String delete(@RequestParam int fbNum) throws Exception {
		service.delete(fbNum);
		System.out.println(fbNum);
		return "redirect:/freeboard/list.do";
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
	@RequestMapping(value = "/fileDel",method = RequestMethod.POST)
	@ResponseBody
	public void fileDel(CommonFileVo vo) throws Exception {
		System.out.println("파일번호는?"+vo);
		service.fileDel(vo);
	}
	
	@RequestMapping(value = "/comment.do",method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> comment(CommentVo vo) throws Exception {
		HashMap<String, Object> map=new HashMap<String, Object>();
		System.out.println("vodsafsdafsadfsdfaf"+vo.toString());
		vo.setComType("FreeBoard");
		service.comment(vo);
		int fbNum=vo.getComBnum();
		List<CommentVo> commentlist=service.commentList(fbNum);
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
    	FreeBoardVo vo = null;
    	service.comDel(comNum);
    	List<CommentVo> commentlist=service.commentList(vo.getFbNum());
    
    	map.put("commentList", commentlist);
    	System.out.println(commentlist.toString());
		return map;
    }
    
}
