package com.newdeal.ict.Service;


import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


public interface CommonService {
	public int intfileWrite(int fileRefNum,String fileRefBoard,MultipartHttpServletRequest multiRequest) throws Exception;
	
}
 