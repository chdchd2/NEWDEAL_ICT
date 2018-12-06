package com.newdeal.ict.Controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.newdeal.ict.Service.CommonService;
import com.newdeal.ict.Service.QaBoardService;
import com.newdeal.ict.Util.Pager;
import com.newdeal.ict.Vo.CommentVo;
import com.newdeal.ict.Vo.CommonFileVo;
import com.newdeal.ict.Vo.QaBoardVo;

@Controller
@RequestMapping("/qaboard/*")
public class QaBoardController {
	private static final Logger logger = LoggerFactory.getLogger(QaBoardController.class);

	@Inject
	QaBoardService service;
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
		List<QaBoardVo> list=service.listAll(
				start, end, search_option, keyword);
		ModelAndView mav=new ModelAndView();
		mav.setViewName(".qaboard.list");
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
		return ".qaboard.write"; //views/board/write.jsp
	}
	
	
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute QaBoardVo vo,HttpSession session, MultipartHttpServletRequest multiRequest) throws Exception{
		/*vo.setFbWriter((String)session.getAttribute("member"));*/
		System.out.println("=====================>"+vo.toString());
		service.create(vo);
		//첨부파일 처리하기
		int fileRefNum = service.qamaxNum();
		String fileRefBoard = "QABOARD";
		commonservice.fileWrite(fileRefNum, fileRefBoard, multiRequest);
		return "redirect:/qaboard/list.do";
	}
	
	@RequestMapping("view.do")
	public ModelAndView view(@RequestParam int qaNum
			,HttpSession session) throws Exception {
		//조회수 증가 처리
		service.increaseViewcnt(qaNum, session);
		
		/*//0718추가
		List<BoardDTO> list2=boardService.PNList(bno);
		//
*/		
		//레코드를 리턴받음
		ModelAndView mav=new ModelAndView();
		
		/*mav.addObject("list2",list2);*/
		mav.setViewName(".qaboard.view");
		mav.addObject("vo", service.read(qaNum));
		mav.addObject("prev", service.qaPrev(qaNum));
		mav.addObject("next", service.qaNext(qaNum));
		return mav;
	}
	
	@RequestMapping("updateView.do")
	public ModelAndView updateView(@RequestParam int qaNum ,HttpSession session) throws Exception {
		
		ModelAndView mav=new ModelAndView();
		
		
		mav.setViewName(".qaboard.modify");
		mav.addObject("vo", service.read(qaNum));
		return mav;
	}
	
	//게시물내용수정
	@RequestMapping("update.do")
	public String update(@ModelAttribute QaBoardVo vo, MultipartHttpServletRequest req) throws Exception {

		String fileRefBoard="QABOARD";
		int num=vo.getQaNum();
		commonservice.fileWrite(num,fileRefBoard,req);
		service.update(vo);
		
		//수정상세화면
		//return "redirect:/qaboard/view.do?qaNum="+vo.getFbNum();
		return "redirect:/qaboard/list.do";
	}
	
	@RequestMapping("delete.do")
	public String delete(@RequestParam int qaNum) throws Exception {
		service.delete(qaNum);
		return "redirect:/qaboard/list.do";
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
	}/*
	
	@RequestMapping("reply.do")
	public String reply() throws Exception{
		return ".qaboard.reply";
	}
	
	@RequestMapping("replyok.do")
	public String insertReply(@ModelAttribute QaBoardVo vo,HttpSession session) throws Exception{
		System.out.println("=====================>"+vo.toString());
		service.insertReply(vo);
		return "redirect:/qaboard/list.do";
	}
	*/
	@RequestMapping(value="/reply.do", method=RequestMethod.GET)
	public ModelAndView replyBoard(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		if(request.getParameter("qaNum") != null && !request.getParameter("qaNum") .equals("")) {
			try {		
				QaBoardVo vo = service.read(Integer.parseInt(request.getParameter("qaNum")));
				String qaContent = vo.getQaContent();
				qaContent = qaContent.replaceAll ("\"", "'");
				vo.setQaContent(qaContent);
				mav.addObject("vo", vo);
			}catch(Exception e) {
			
			}
		}
		mav.setViewName(".qaboard.reply");
		return mav;
	}
	
	@RequestMapping("faq.do")
	public String faq(){
		return "qaboard/faqboard"; //views/board/write.jsp
	}
	
	
}