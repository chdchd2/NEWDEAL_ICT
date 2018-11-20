package com.newdeal.ict.Controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
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

import com.newdeal.ict.Service.FreeBoardService;
import com.newdeal.ict.Util.Pager;
import com.newdeal.ict.Vo.CommonFileVo;
import com.newdeal.ict.Vo.FreeBoardVo;

@Controller
@RequestMapping("/freeboard/*")
public class FreeBoardController {
	private static final Logger logger=
			LoggerFactory.getLogger(FreeBoardController.class);
	
	@Inject
	FreeBoardService service;
	
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
		mav.setViewName("freeboard/list");
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
		return "freeboard/write"; //views/board/write.jsp
	}
	
	
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute FreeBoardVo vo,HttpSession session, MultipartHttpServletRequest req) throws Exception{
		/*vo.setFbWriter((String)session.getAttribute("member"));*/
		System.out.println("=====================>"+vo.toString());
		service.create(vo);
		//첨부파일 처리하기
		List<MultipartFile> filelist = req.getFiles("file"); 
		System.out.println("파일리스트"+filelist.toString());
		System.out.println("파일사이즈"+filelist.size());
		int num=service.fbmaxNum();
		service.fbfileWrite(filelist, num);
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
		
		mav.setViewName("freeboard/view");
		mav.addObject("vo", service.read(fbNum));
		return mav;
	}
	
	@RequestMapping("updateView.do")
	public ModelAndView updateView(@RequestParam int fbNum ,HttpSession session) throws Exception {
		
		ModelAndView mav=new ModelAndView();
		
		
		mav.setViewName("freeboard/modify");
		mav.addObject("vo", service.read(fbNum));
		return mav;
	}
	
	//게시물내용수정
	@RequestMapping("update.do")
	public String update(@ModelAttribute FreeBoardVo vo, MultipartHttpServletRequest req) throws Exception {
		if(vo != null){
			System.out.println("=====================>"+vo.toString());
			List<MultipartFile> filelist = req.getFiles("file"); 
			int num=service.fbmaxNum();
			service.fbfileWrite(filelist, num);
			service.update(vo);//레코드수정
		}
		//수정상세화면
		//return "redirect:/freeboard/view.do?fbNum="+vo.getFbNum();
		return "redirect:/freeboard/list.do";
	}
	
	@RequestMapping("delete.do")
	public String delete(@RequestParam int fbNum) throws Exception {
		service.delete(fbNum);
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
}
