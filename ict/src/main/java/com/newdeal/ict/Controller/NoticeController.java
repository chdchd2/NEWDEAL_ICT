package com.newdeal.ict.Controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.newdeal.ict.Service.NoticeService;
import com.newdeal.ict.Util.Pager;
import com.newdeal.ict.Vo.NoticeVo;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	private static final Logger logger=
			LoggerFactory.getLogger(NoticeController.class);
	
	@Inject
	NoticeService service;
	
	@RequestMapping("list.do")
	public ModelAndView list(
			@RequestParam(defaultValue="1") int curPage,
			@RequestParam(defaultValue="all") String search_option
			, @RequestParam(defaultValue="") String keyword) throws Exception{
		//��肄��� 媛��� 怨���
		int count = service.countArticle(
				search_option, keyword);
		//���댁��� ����踰���, ��踰��� 怨���
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end=pager.getPageEnd();
		List<NoticeVo> list=service.listAll(
				start, end, search_option, keyword);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("notice/list");
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", list.size());
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("pager", pager);
		mav.addObject("map", map);
		/*map�쇰� 臾띠� ������ 寃쎌��
		 * mav.addObject("list", list);
		mav.addObject("count", list.size());*/
		//list.jsp濡� �ъ����
		return mav;
	}
	
	@RequestMapping("write.do")
	public String write(){
		return "notice/write"; //views/board/write.jsp
	}
	//REST諛⑹���� url {bno} => PathVariable濡� ����
	@RequestMapping("getAttach/{ntNum}")
	@ResponseBody// 酉곌� ���� �곗�댄�곕�� 蹂대�� 寃쎌��
	public List<String> getAttach(@PathVariable("ntNum") int ntNum){
		return service.getAttach(ntNum);
	}
	
	
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute NoticeVo vo ,HttpSession session) throws Exception{
		System.out.println("=====================>"+vo.toString());
		service.create(vo);
		return "redirect:/notice/list.do";
	}
	
	@RequestMapping("view.do")
	public ModelAndView view(@RequestParam int ntNum
			,HttpSession session) throws Exception {
		//議고���� 利�媛� 泥�由�
		service.increaseViewcnt(ntNum, session);
		
		/*//0718異�媛�
		List<BoardDTO> list2=boardService.PNList(bno);
		//
*/		
		//��肄���瑜� 由ы�대���
		ModelAndView mav=new ModelAndView();
		
		/*mav.addObject("list2",list2);*/
		
		mav.setViewName("notice/view");
		mav.addObject("vo", service.read(ntNum));
		return mav;
	}

	@RequestMapping("updateView.do")
	public ModelAndView updateView(@RequestParam int ntNum ,HttpSession session) throws Exception {
		
		ModelAndView mav=new ModelAndView();
		
		
		mav.setViewName("notice/modify");
		mav.addObject("vo", service.read(ntNum));
		return mav;
	}
	
	//寃���臾쇰�댁�⑹����
	@RequestMapping("update.do")
	public String update(@ModelAttribute NoticeVo vo) throws Exception {
		if(vo != null){
			service.update(vo);//��肄�������
		}
		//�������명��硫�
		//return "redirect:/board/view.do?bno="+dto.getBno();
		return "redirect:/notice/list.do";
	}
	
	@RequestMapping("delete.do")
	public String delete(@RequestParam int ntNum)
		throws Exception {
		service.delete(ntNum);
		return "redirect:/notice/list.do";
	}
}
