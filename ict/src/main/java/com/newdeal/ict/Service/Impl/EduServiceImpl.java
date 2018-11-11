package com.newdeal.ict.Service.Impl;


import java.io.File;
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
import com.newdeal.ict.Util.PageUtil;
import com.newdeal.ict.Vo.CommonFileVo;
import com.newdeal.ict.Vo.IntDetailJoinVo;
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
		String filePath="C:\\Users\\haces\\git";
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

	@Override
	public HashMap<String, Object> intList(int pageNum) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int totalRowCount = dao.intCnt();
		PageUtil pu=new PageUtil(pageNum, 10, 10, totalRowCount);
		List<IntroduceVo> list =dao.intList(pu);
		map.put("list", list);
		map.put("pu",pu);
		System.out.println("pu내용====>"+pu.toString());
		return map;
	}

	@Override
	public int intCnt() throws Exception {
		
		return dao.intCnt();
	}

	@Override
	public IntDetailJoinVo intDetail(int intNum) throws Exception {
		
		return dao.intDetail(intNum);
	}

	@Override
	public CommonFileVo fileinfo(CommonFileVo filevo) throws Exception {
		return dao.fileinfo(filevo);
	}

	@Override
	public IntroduceVo getWriter(int intNum) throws Exception {
		return dao.getWriter(intNum);
	}

	@Override
	public int intDelete(int intNum) throws Exception {
			
			List<CommonFileVo> filelist = dao.intFileDelList(intNum);
			System.out.println("파일리스트출력"+filelist.toString());
			for(CommonFileVo vo:filelist) {
				String files=vo.getFilePath()+vo.getFileName();
				System.out.println("파일디렉토리+파일이름 출력해보기"+files);
				File file=new File(vo.getFilePath()+"\\"+vo.getFileName());
				if( file.exists() ){
		            if(file.delete()){
		                System.out.println("파일삭제 성공");
		            }else{
		                System.out.println("파일삭제 실패");
		            }
		        }else{
		            System.out.println("파일이 존재하지 않습니다.");
		        }
				dao.intFileDelete(intNum);
				dao.intDelete(intNum);

			}
		return 0;
	}

	@Override
	public int intEdit(int intNum) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	

	

}
