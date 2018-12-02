package com.newdeal.ict.Service.Impl;


import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.newdeal.ict.Dao.CommonDao;
import com.newdeal.ict.Service.CommonService;
import com.newdeal.ict.Vo.CommonFileVo;

@Service
public class CommonServiceImpl implements CommonService{
	@Autowired
	private CommonDao dao;

	

	@Override

	public int fileWrite(int fileRefNum,String fileRefBoard,MultipartHttpServletRequest multiRequest) throws Exception {

	System.out.println("여기까지 오는지 테스트하기");

		String filePath="C:\\Users\\git";
		CommonFileVo filevo=new CommonFileVo();
		 Iterator<String> iterator = multiRequest.getFileNames();
		    MultipartFile multipartFile = null;
		    while(iterator.hasNext()){
		        multipartFile = multiRequest.getFile(iterator.next());
		        if(!multipartFile.isEmpty()){
		        	UUID uuid=UUID.randomUUID();
		        	String fileOrgName=multipartFile.getOriginalFilename();
		        	String fileName=uuid+"_"+fileOrgName;
		        	String fileSize=filevo.byteCalculation(String.valueOf(multipartFile.getSize()));
		        	File file=new File(filePath+fileName);
		        	try {
		        	multipartFile.transferTo(file);
		        	}catch (IOException ipe) {
						System.out.println("파일 등록에 문제가 있습니다");
					}
		        	filevo.setFileName(fileName);
					filevo.setFileSize(fileSize);
					filevo.setFileOrgName(fileOrgName);
					filevo.setFilePath(filePath);
					filevo.setFileRefBoard(fileRefBoard);
					filevo.setFileRefNum(fileRefNum);
					dao.fileWrite(filevo);
					
		        	
		        }
		   }
		return 0;
	}

	
	

}
