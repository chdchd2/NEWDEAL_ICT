package com.newdeal.ict.Service.Impl;


import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.newdeal.ict.Dao.CommonDao;
import com.newdeal.ict.Service.CommonService;
import com.newdeal.ict.Vo.CommonFileVo;

@Service
public class CommonServiceImpl implements CommonService{
	@Autowired
	private CommonDao dao;

	

	@Override
	public int fileWrite(List<MultipartFile> filelist,int fileRefNum,String fileRefBoard) throws Exception {
		System.out.println("������� ������ �׽�Ʈ�ϱ�");
		InputStream is = null;
		FileOutputStream fos = null;
		String filePath="C:\\Users\\Lenovo\\git";
		CommonFileVo filevo=new CommonFileVo();
		try {
			if(filelist.size()>0) {
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
				filevo.setFileRefBoard(fileRefBoard);
				filevo.setFileRefNum(fileRefNum);
				System.out.println("���Ϻ��̿� �����==>"+filevo.toString());
				dao.fileWrite(filevo);
				fos=new FileOutputStream(filePath+"\\"+fileName);
				FileCopyUtils.copy(is, fos);
				
				fos.close();
				is.close();
				}
			}
		}finally {
			
		}
		return 0;
	}

	
	

}
