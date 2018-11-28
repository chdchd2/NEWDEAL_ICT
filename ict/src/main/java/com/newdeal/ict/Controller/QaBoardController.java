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


	
	@RequestMapping("list.do")
	public ModelAndView list(
			@RequestParam(defaultValue="1") int curPage,
			@RequestParam(defaultValue="all") String search_option
			, @RequestParam(defaultValue="") String keyword) throws Exception{
		//���ڵ� ���� ���
		int count = service.countArticle(
				search_option, keyword);
		//�������� ���۹�ȣ, ����ȣ ���
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
		/*map���� ���� �ʾ��� ���
		 * mav.addObject("list", list);
		mav.addObject("count", list.size());*/
		//list.jsp�� ������
		return mav;
	}
	
	@RequestMapping("write.do")
	public String write(){
		return ".qaboard.write"; //views/board/write.jsp
	}
	
	
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute QaBoardVo vo,HttpSession session, MultipartHttpServletRequest req) throws Exception{
		/*vo.setFbWriter((String)session.getAttribute("member"));*/
		System.out.println("=====================>"+vo.toString());
		service.create(vo);
		//÷������ ó���ϱ�
		List<MultipartFile> filelist = req.getFiles("file"); 
		System.out.println("���ϸ���Ʈ"+filelist.toString());
		System.out.println("���ϻ�����"+filelist.size());
		int num=service.qamaxNum();
		service.qafileWrite(filelist, num);
		return "redirect:/qaboard/list.do";
	}
	
	@RequestMapping("view.do")
	public ModelAndView view(@RequestParam int qaNum
			,HttpSession session) throws Exception {
		//��ȸ�� ���� ó��
		service.increaseViewcnt(qaNum, session);
		
		/*//0718�߰�
		List<BoardDTO> list2=boardService.PNList(bno);
		//
*/		
		//���ڵ带 ���Ϲ���
		ModelAndView mav=new ModelAndView();
		
		/*mav.addObject("list2",list2);*/
		mav.setViewName(".qaboard.view");
		mav.addObject("vo", service.read(qaNum));
		return mav;
	}
	
	@RequestMapping("updateView.do")
	public ModelAndView updateView(@RequestParam int qaNum ,HttpSession session) throws Exception {
		
		ModelAndView mav=new ModelAndView();
		
		
		mav.setViewName(".qaboard.modify");
		mav.addObject("vo", service.read(qaNum));
		return mav;
	}
	
	//�Խù��������
	@RequestMapping("update.do")
	public String update(@ModelAttribute QaBoardVo vo, MultipartHttpServletRequest req) throws Exception {
		if(vo != null){
			System.out.println("=====================>"+vo.toString());
			List<MultipartFile> filelist = req.getFiles("file"); 
			int num=service.qamaxNum();
			service.qafileWrite(filelist, num);
			service.update(vo);//���ڵ����
		}
		//������ȭ��
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
		System.out.println("��Ʈ�ѷ� ���ϴٿ�κб��� �´�.");
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
		System.out.println("���Ϲ�ȣ��?"+vo);
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
	
	@RequestMapping(value="/reply.do", method=RequestMethod.POST)
	public void insertReplyBoard(HttpServletRequest request, HttpServletResponse response, QaBoardVo vo) {
			
		try {		
			int qaNum = 0;			
			if(request.getParameter("qaNum") != null && !request.getParameter("qaNum") .equals("")) {				
				String qaContent = request.getParameter("qaContent");
				vo.setQaContent(qaContent);
				qaNum = service.insertReply(vo);
			}
			response.sendRedirect("/qaboard/view.do?qaNum="+qaNum);
		}catch(Exception e) {
			logger.info("insert Fail...");
			e.printStackTrace();
		}
	}	
}