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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.newdeal.ict.Service.CommonService;
import com.newdeal.ict.Service.NoticeService;
import com.newdeal.ict.Util.Pager;
import com.newdeal.ict.Vo.CommonFileVo;
import com.newdeal.ict.Vo.NoticeVo;

@Controller
@RequestMapping("/notice/*")   
public class NoticeController {
	private static final Logger logger=
			LoggerFactory.getLogger(NoticeController.class);
	
	@Inject
	NoticeService service;
	@Inject
	CommonService commonservice;
	
	@RequestMapping("list.do")
	public ModelAndView list(
			@RequestParam(defaultValue="1") int curPage,
			@RequestParam(defaultValue="all") String search_option
			, @RequestParam(defaultValue="") String keyword) throws Exception{
		//�젅肄붾뱶 媛��닔 怨꾩궛
		int count = service.countArticle(
				search_option, keyword);
		//�럹�씠吏��쓽 �떆�옉踰덊샇, �걹踰덊샇 怨꾩궛
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end=pager.getPageEnd();
		List<NoticeVo> list=service.listAll(
				start, end, search_option, keyword);
		ModelAndView mav=new ModelAndView();
		mav.setViewName(".notice.list");
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", list.size());
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("pager", pager);
		mav.addObject("map", map);
		/*map�쑝濡� 臾띠� �븡�븯�쓣 寃쎌슦
		 * mav.addObject("list", list);
		mav.addObject("count", list.size());*/
		//list.jsp濡� �룷�썙�뵫
		return mav;
	}
	
	@RequestMapping("write.do")
	public String write(){
		return ".notice.write"; //views/board/write.jsp
	}
	
	
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute NoticeVo vo ,HttpSession session, MultipartHttpServletRequest multiRequest) throws Exception{
		System.out.println("=====================>"+vo.toString());
		service.create(vo);
		//泥⑤��뙆�씪 泥섎━�븯湲�
		int fileRefNum=service.ntmaxNum();
		String fileRefBoard="NOTICE";
		commonservice.fileWrite(fileRefNum,fileRefBoard,multiRequest);
		return "redirect:/notice/list.do";
	}
	
	@RequestMapping("view.do")
	public ModelAndView view(@RequestParam int ntNum
			,HttpSession session) throws Exception {
		//議고쉶�닔 利앷� 泥섎━
		service.increaseViewcnt(ntNum, session);
		
		/*//0718異붽�
		List<BoardDTO> list2=boardService.PNList(bno);
		//
*/		
		//�젅肄붾뱶瑜� 由ы꽩諛쏆쓬
		ModelAndView mav=new ModelAndView();
		
		/*mav.addObject("list2",list2);*/
		
		mav.setViewName(".notice.view");
		mav.addObject("vo", service.read(ntNum));
		mav.addObject("prev", service.ntPrev(ntNum));
		mav.addObject("next", service.ntNext(ntNum));
		return mav;
	}

	@RequestMapping("updateView.do")
	public ModelAndView updateView(@RequestParam int ntNum ,HttpSession session) throws Exception {
		
		ModelAndView mav=new ModelAndView();
		
		
		mav.setViewName(".notice.modify");
		mav.addObject("vo", service.read(ntNum));
		return mav;
	}
	
	//寃뚯떆臾쇰궡�슜�닔�젙
	@RequestMapping("update.do")
	public String update(@ModelAttribute NoticeVo vo, MultipartHttpServletRequest req) throws Exception {
		String fileRefBoard="NOTICE";
		int num=vo.getNtNum();
		commonservice.fileWrite(num,fileRefBoard,req);
		service.update(vo);
		
		//�닔�젙�긽�꽭�솕硫�
		//return "redirect:/board/view.do?bno="+dto.getBno();
		return "redirect:/notice/list.do";
	}
	
	@RequestMapping("delete.do")
	public String delete(@RequestParam int ntNum)
		throws Exception {
		service.delete(ntNum);
		return "redirect:/notice/list.do";
	}
	
	@RequestMapping(value="/fileDown" )
	public ModelAndView contactoDownload(@ModelAttribute CommonFileVo filevo) throws Exception{
		System.out.println("而⑦듃濡ㅻ윭 �뙆�씪�떎�슫遺�遺꾧퉴吏� �삩�떎.");
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
		System.out.println("�뙆�씪踰덊샇�뒗?"+vo);
		service.fileDel(vo);
	}
	
}
