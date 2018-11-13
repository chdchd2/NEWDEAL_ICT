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

import com.newdeal.ict.Service.FreeBoardService;
import com.newdeal.ict.Util.Pager;
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
		//��肄��� 媛��� 怨���
		int count = service.countArticle(
				search_option, keyword);
		//���댁��� ����踰���, ��踰��� 怨���
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
		/*map�쇰� 臾띠� ������ 寃쎌��
		 * mav.addObject("list", list);
		mav.addObject("count", list.size());*/
		//list.jsp濡� �ъ����
		return mav;
	}
	
	@RequestMapping("write.do")
	public String write(){
		return "freeboard/write"; //views/board/write.jsp
	}
	//REST諛⑹���� url {bno} => PathVariable濡� ����
	@RequestMapping("getAttach/{fbNum}")
	@ResponseBody// 酉곌� ���� �곗�댄�곕�� 蹂대�� 寃쎌��
	public List<String> getAttach(@PathVariable("fbNum") int fbNum){
		return service.getAttach(fbNum);
	}
	
	
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute FreeBoardVo vo,HttpSession session) throws Exception{
		vo.setFbWriter((String)session.getAttribute("member"));
		
		System.out.println("=====================>"+vo.toString());
		service.create(vo);
		return "redirect:/freeboard/list.do";
	}
	
	@RequestMapping("view.do")
	public ModelAndView view(@RequestParam int fbNum
			,HttpSession session) throws Exception {
		//議고���� 利�媛� 泥�由�
		service.increaseViewcnt(fbNum, session);
		
		/*//0718異�媛�
		List<BoardDTO> list2=boardService.PNList(bno);
		//
*/		
		//��肄���瑜� 由ы�대���
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
	
	//寃���臾쇰�댁�⑹����
	@RequestMapping("update.do")
	public String update(@ModelAttribute FreeBoardVo vo) throws Exception {
		if(vo != null){
			service.update(vo);//��肄�������
			System.out.println("=====================>"+vo.toString());
		}
		//�������명��硫�
		//return "redirect:/freeboard/view.do?fbNum="+vo.getFbNum();
		return "redirect:/freeboard/list.do";
	}
	
	@RequestMapping("delete.do")
	public String delete(@RequestParam int fbNum)
		throws Exception {
		service.delete(fbNum);
		return "redirect:/freeboard/list.do";
	}
}
