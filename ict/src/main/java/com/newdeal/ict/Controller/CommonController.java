package com.newdeal.ict.Controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class CommonController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	   public String home() {
	      System.out.println("Ȩ�����̵��ϱ�");
	      return ".main";
	   }
	   
	
	
	 @RequestMapping(value="/ckImage")
	    public void CKEditorImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload ){
	    
	    	OutputStream out = null;
	        PrintWriter printWriter = null;
	        response.setCharacterEncoding("utf-8");
	        response.setContentType("text/html;charset=utf-8");
	 
	        try{
	        	String path="C:\\Users\\Lenovo\\git\\NEWDEAL_ICT\\";
	            String fileName = upload.getOriginalFilename();
	            byte[] bytes = upload.getBytes();
	            String uploadPath = path + fileName;//저장경로
	 
	            out = new FileOutputStream(new File(uploadPath));
	            out.write(bytes);
	            String callback = request.getParameter("CKEditorFuncNum");
	 
	            printWriter = response.getWriter();
	            String fileUrl = path+ fileName;//url경로
	 
	            printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
	                    + callback
	                    + ",'"
	                    + fileUrl
	                    + "','이미지를 업로드 하였습니다.'"
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
