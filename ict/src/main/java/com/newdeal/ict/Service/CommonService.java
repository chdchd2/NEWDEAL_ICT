package com.newdeal.ict.Service;


import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


public interface CommonService {
	public int fileWrite(int fileRefNum,String fileRefBoard,MultipartHttpServletRequest multiRequest) throws Exception;
	public int intfileWrite(int num,String fileRefBoard,MultipartHttpServletRequest req) throws Exception;

 
}
 