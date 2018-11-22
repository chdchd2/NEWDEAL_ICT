package com.newdeal.ict.Controller;

import java.math.BigDecimal;
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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.newdeal.ict.Service.QaBoardService;
import com.newdeal.ict.Util.Pager;
import com.newdeal.ict.Vo.QaBoardVo;

@Controller
@RequestMapping("/qaboard/*")
public class QaBoardController {
	private static final Logger logger = LoggerFactory.getLogger(QaBoardController.class);

	@Inject
	QaBoardService service;

	@RequestMapping("list.do")
	public ModelAndView list(@RequestParam(defaultValue = "1") int curPage,
			@RequestParam(defaultValue = "all") String search_option, @RequestParam(defaultValue = "") String keyword)
			throws Exception {
		// 레코드 갯수 계산
		int count = service.countArticle(search_option, keyword);
		// 페이지의 시작번호, 끝번호 계산
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		List<QaBoardVo> list = service.listAll(start, end, search_option, keyword);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("freeboard/list");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", list.size());
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("pager", pager);
		mav.addObject("map", map);
		/*
		 * map으로 묶지 않았을 경우 mav.addObject("list", list); mav.addObject("count",
		 * list.size());
		 */
		// list.jsp로 포워딩
		return mav;
	}
	
	@RequestMapping("view.do")
	public ModelAndView view(@RequestParam int qaNum
			,HttpSession session, HttpServletRequest req, HttpServletResponse res) throws Exception {
		//조회수 증가 처리
		service.increaseViewcnt(qaNum, session);
		
		//레코드를 리턴받음
		ModelAndView mav=new ModelAndView();
		try {
		if(req.getParameter("qaNum") != null && !req.getParameter("qaNum").equals("")){
			QaBoardVo vo = service.read(new BigDecimal(req.getParameter("qaNum")));
			String qaContent = vo.getQaContent();
			qaContent = qaContent.replaceAll("\"", "'");
			vo.setQaContent(qaContent);
			mav.addObject("vo", vo);
			mav.setViewName("qaboard/view");
		} else {
			mav.setViewName("qaboard/list");
			res.sendRedirect("qabaord/list.do");
		}
	} catch (Exception e){
		
	}
		return mav;
	}
	
	@RequestMapping("write.do")
	public ModelAndView write(HttpServletRequest req, HttpServletResponse res){
		ModelAndView mav = new ModelAndView();
		if(req.getParameter("qaNum") != null && !req.getParameter("qaNum").equals("")){
			try{
				QaBoardVo vo = service.read(new BigDecimal(req.getParameter("qaNum")));
				String qaContent = vo.getQaContent();
				qaContent = qaContent.replaceAll("\"", "'");
				vo.setQaContent(qaContent);
				mav.addObject("vo", vo);
			} catch (Exception e) {

			}
		}
		mav.setViewName("qaboard/write");
		return mav;
	}
	
	@RequestMapping("insert.do")
	public void insert(HttpServletRequest req, HttpServletResponse res, QaBoardVo vo, BindingResult errors){
		if(errors.hasErrors()){
			logger.info("errors..");
		} 
		try {
			int qaNum = 0;
			if(req.getParameter("qaNum") != null && !req.getParameter("qaNum").equals("")){
				String qaContent = req.getParameter("qaContent");
				vo.setQaContent(qaContent);
				qaNum = Integer.parseInt(req.getParameter("qaNum"));
				service.update(vo);
			} else {
				String qaContent = req.getParameter("qaContent");
				vo.setQaContent(qaContent);
				qaNum = service.create(vo);
			}
			res.sendRedirect("qaboard/view.do?qaNum="+qaNum);
			
		} catch (Exception e) {
			logger.info("insert Fail...");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("reply.do")
	public ModelAndView reply(HttpServletRequest req, HttpServletResponse res){
		ModelAndView mav = new ModelAndView();
		if(req.getParameter("qaNum") != null && !req.getParameter("qaNum").equals("")){
			try{
				QaBoardVo vo = service.read(new BigDecimal(req.getParameter("qaNum")));
				String qaContent = vo.getQaContent();
				qaContent = qaContent.replaceAll("\"", "'");
				vo.setQaContent(qaContent);
				mav.addObject("vo", vo);
			} catch(Exception e){
				
			}
		}
		mav.setViewName("qaboard/reply");
		return mav;
	}
	
	@RequestMapping("replyok.do")
	public void insertReply(HttpServletRequest req, HttpServletResponse res, QaBoardVo vo, BindingResult errors){
		if(errors.hasErrors()){
			logger.info("errors...");
		}
		try {
			int qaNum = 0;
			if(req.getParameter("qaNum") != null && !req.getParameter("qaNum").equals("")){
				String qaContent = req.getParameter("qaContent");
				vo.setQaContent(qaContent);
				qaNum = service.insertReply(vo);
			}
			res.sendRedirect("/qaboard/view.do?qaNum="+qaNum);
		} catch (Exception e) {
			logger.info("insert Fail...");
			e.printStackTrace();
		}
	}
}