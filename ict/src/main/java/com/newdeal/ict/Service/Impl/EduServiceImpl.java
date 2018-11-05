package com.newdeal.ict.Service.Impl;


import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.newdeal.ict.Dao.EduDao;
import com.newdeal.ict.Service.EduService;
import com.newdeal.ict.Vo.CommonFileVo;
import com.newdeal.ict.Vo.IntroduceVo;

@Service
public class EduServiceImpl implements EduService{
	@Autowired
	private EduDao dao;

	@Override
	public int intWrite(IntroduceVo vo) throws Exception {
		
		return dao.intWrite(vo);
	}

	@Override
	public int intfileWrite(List<MultipartFile> filelist,int num) throws Exception {
		InputStream is = null;
		FileOutputStream fos = null;
		String filePath="D:\\test";
		CommonFileVo filevo=new CommonFileVo();
		
		try {
			for(int i=0;i<filelist.size();i++) {
				is=filelist.get(i).getInputStream();
				UUID uuid=UUID.randomUUID();
				String fileOrgName=filelist.get(i).getOriginalFilename();
				String fileName=uuid+"_"+fileOrgName;
				String fileSize=filevo.byteCalculation(String.valueOf(filelist.get(i).getSize()));
				filevo.setFileName(fileName);
				filevo.setFileSize(fileSize);
				filevo.setFileOrgName(fileOrgName);
				filevo.setFilePath(filePath);
				filevo.setFileRefNum(dao.intmaxNum());
				dao.intfileWrite(filevo);
				fos=new FileOutputStream(filePath+"\\"+fileName);
				FileCopyUtils.copy(is, fos);
				
				fos.close();
				is.close();
			}
		}finally {
			
		}
		return 0;
	}

	@Override
	public int intmaxNum() throws Exception {
		
		return dao.intmaxNum();
	}

	

}
