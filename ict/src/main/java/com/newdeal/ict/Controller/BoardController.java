package com.newdeal.ict.Controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.newdeal.ict.Service.BoardService;
import com.newdeal.ict.Vo.BoardVO;
import com.newdeal.ict.Vo.Criteria;
import com.newdeal.ict.Vo.PageMaker;

@Controller
@RequestMapping("board")
public class BoardController {
	
	/**/

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService service;
	
	@RequestMapping(value="register", method = RequestMethod.GET)
	public void registerGET(BoardVO board, Model model) throws Exception{
		logger.info("register get ..... ");
	}
	/*@RequestMapping(value="register", method = RequestMethod.POST)
	public String registerPOST(BoardVO board, Model model) throws Exception{
		logger.info("register post ..... ");
		logger.info(board.toString());
		
		service.regist(board);
		model.addAttribute("result", "success");
		
		return "board/success";
	}*/
	/*@RequestMapping(value="register", method = RequestMethod.POST)
	public void registerPOST(BoardVO board, Model model, HttpServletRequest req, HttpServletResponse res) throws Exception{
		logger.info("register post ..... ");
		logger.info(board.toString());
		
		service.regist(board);
		//model.addAttribute("result", "success");
		res.sendRedirect("/board/listAll");
	}*/
	@RequestMapping(value="register", method = RequestMethod.POST)
	public String registerPOST(BoardVO board, Model model, RedirectAttributes ra) throws Exception{
		logger.info("register post ..... ");
		logger.info(board.toString());
		
		service.regist(board);
		ra.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/board/list";
	}
	@RequestMapping(value="listAll", method = RequestMethod.GET)
	public void listAll(Model model) throws Exception{
		logger.info("show all list ..... ");
		model.addAttribute("list", service.listAll());
	}
	
	@RequestMapping(value="read", method = RequestMethod.GET)
	public void read(@RequestParam Map<String, String> map, Model model) throws Exception{
		model.addAttribute("list", service.listAll());
		map.get("bno");
	}
	
	@RequestMapping(value="readPage", method = RequestMethod.GET)
	public void read(@RequestParam ("bno") int bno, Model model,@ModelAttribute("cri") Criteria cri) throws Exception{
		model.addAttribute(service.read(bno));
	}
	
	@RequestMapping(value="removePage", method = RequestMethod.POST)
	public String remove(@RequestParam Map map,@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) throws Exception{
		service.remove(map);
		rttr.addFlashAttribute("page", cri.getPage());
		rttr.addFlashAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/board/listPage";
	}
	/*@RequestMapping(value="remove", method = RequestMethod.POST)
	public String remove(@RequestParam ("bno") int bno,RedirectAttributes rttr) throws Exception{
		service.remove(bno);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/board/listAll";
	}*/
	@RequestMapping(value="modifyPage", method = RequestMethod.GET)
	public String modifyPage(@RequestParam ("bno") int bno,@ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		model.addAttribute("boardVO", service.read(bno));
		//model.addAttribute(service.read(bno));
		return "board/modifyPage";
	}
	
	@RequestMapping(value="modifyPage", method = RequestMethod.POST)
	public String modifyPagePOST(@RequestParam Map map,@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) throws Exception{
		service.modify(map);
		
		rttr.addFlashAttribute("page", cri.getPage());
		rttr.addFlashAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/board/listPage";
	}
	@RequestMapping(value="modify", method = RequestMethod.GET)
	public String modifyGET(@RequestParam Map map, Model model) throws Exception{
		model.addAttribute(service.read(Integer.parseInt((String) map.get("bno"))));
		return "board/modify";
	}

	@RequestMapping(value="modify", method = RequestMethod.POST)
	public String modifyPOST(@RequestParam Map map, RedirectAttributes rttr) throws Exception{
		service.modify(map);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/board/listAll";
	}
	/*@RequestMapping(value="listPage", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam(defaultValue="1") int curPage,
							 @RequestParam(defaultValue="all") String search_option,
							 @RequestParam(defaultValue="") String keyword) throws Exception{
		int count = service.countArticle(search_option, keyword);
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		List<BoardVO> list = service.listPage(start, end, search_option, keyword);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/listPage");
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", list.size());
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("pager", pager);
		mav.addObject("map", map);
		
		return mav;
	}*/
	@RequestMapping(value="listCri", method = RequestMethod.GET)
	public String listCri(Criteria cri, Model model) throws Exception{
		model.addAttribute("list", service.listCriteria(cri));
		return "board/listCri";
	}
	
	@RequestMapping(value="listPage", method = RequestMethod.GET)
	public String listPage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		logger.info(cri.toString());
		
		model.addAttribute("list", service.listCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCountCriteria(cri));
		model.addAttribute("pageMaker", pageMaker);
		return "board/listPage";
	}
	
	

}
