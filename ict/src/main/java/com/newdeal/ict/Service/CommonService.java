package com.newdeal.ict.Service;


import org.springframework.web.multipart.MultipartHttpServletRequest;


public interface CommonService {
	public int fileWrite(int fileRefNum,String fileRefBoard,MultipartHttpServletRequest multiRequest) throws Exception;
 
}
 