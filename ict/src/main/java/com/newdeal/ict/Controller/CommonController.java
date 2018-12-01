package com.newdeal.ict.Controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.newdeal.ict.Service.AdminService;
import com.newdeal.ict.Vo.LinkListVo;

@Controller
public class CommonController {
	@Autowired
	private AdminService service;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	   public String home(HttpSession session) throws Exception {
		  List<LinkListVo> linklist = service.linklist();
		  
		  session.setAttribute("linklist", linklist);
	      System.out.println("홈으로이동하기");
	      return ".main";
	   }
	   
	
	
	 @RequestMapping(value="/ckImage")
	    public void CKEditorImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload ){
	    
	    	OutputStream out = null;
	        PrintWriter printWriter = null;
	        response.setCharacterEncoding("utf-8");
	        response.setContentType("text/html;charset=utf-8");
	 
	        try{
	        	String path="C:\\Users\\haces\\git\\NEWDEAL_ICT\\";
	            String fileName = upload.getOriginalFilename();
	            byte[] bytes = upload.getBytes();
	            String uploadPath = path + fileName;//���옣寃쎈줈
	 
	            out = new FileOutputStream(new File(uploadPath));
	            out.write(bytes);
	            String callback = request.getParameter("CKEditorFuncNum");
	 
	            printWriter = response.getWriter();
	            String fileUrl = path+ fileName;//url寃쎈줈
	 
	            printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
	                    + callback
	                    + ",'"
	                    + fileUrl
	                    + "','�씠誘몄�瑜� �뾽濡쒕뱶 �븯���뒿�땲�떎.'"
	                    + ")</script>");
	            printWriter.flush();
	 
	        }catch(IOException e){
	            e.printStackTrace();
	        } finally {
	            try {
	                if (out != null) {
	                    out.close();
	                }
	                if (printWriter != null) {
	                    printWriter.close();
	                }
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        }
	 
	        return;
	    }
}
