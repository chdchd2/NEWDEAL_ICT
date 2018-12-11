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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.newdeal.ict.Service.AdminService;
import com.newdeal.ict.Vo.LinkListVo;

@Controller
public class CommonController {

	
	
	 @RequestMapping(value="/ckImage")
	    public void CKEditorImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload ){
	    
	    	OutputStream out = null;
	        PrintWriter printWriter = null;
	        response.setCharacterEncoding("utf-8");
	        response.setContentType("text/html;charset=utf-8");
	 
	        try{
	        	String path="/usr/local/tomcatIct/webapps/ROOT/resources/download/";
	        	String callURL="/resources/download/";
	            String fileName = upload.getOriginalFilename();
	            byte[] bytes = upload.getBytes();
	            String uploadPath = path + fileName;
	 
	            out = new FileOutputStream(new File(uploadPath));
	            out.write(bytes);
	            String callback = request.getParameter("CKEditorFuncNum");
	 
	            printWriter = response.getWriter();
	            String fileUrl = callURL+ fileName;//url寃쎈줈
	 
	            printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
	                    + callback
	                    + ",'"
	                    + fileUrl
	                    + "','이미지를 업로드하였습니다.'"
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
	 
	 @RequestMapping(value = "/newdeal",method = RequestMethod.GET)
		public String NewDel(Model model) throws Exception {
		
			return ".weintroduce.newdeal";
		}
		
		@RequestMapping(value = "/site",method = RequestMethod.GET)
		public String Site(Model model) throws Exception {
		
			return ".weintroduce.site";
		}
}
