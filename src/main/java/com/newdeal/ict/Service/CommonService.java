package com.newdeal.ict.Service;


import java.util.List;

import org.springframework.web.multipart.MultipartFile;


public interface CommonService {
	public int fileWrite(List<MultipartFile> filelist,int fileRefNum,String fileRefBoard) throws Exception;
	
 
}
 