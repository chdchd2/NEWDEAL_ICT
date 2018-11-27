package com.newdeal.ict.Service.Impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.newdeal.ict.Dao.QaBoardDao;
import com.newdeal.ict.Service.QaBoardService;
import com.newdeal.ict.Vo.CommonFileVo;
import com.newdeal.ict.Vo.QaBoardVo;

@Service
public class QaBoardServiceImpl implements QaBoardService{

	@Inject
	QaBoardDao dao;

	@Transactional
	@Override
	public void create(QaBoardVo vo) throws Exception {
		dao.create(vo);
		
	}



	@Override
	public QaBoardVo read(int qaNum) throws Exception {
		return dao.read(qaNum);
	}


	@Transactional
	@Override
	public void update(QaBoardVo vo) throws Exception {
		dao.update(vo);// board테이블 수정
		
	}



	@Override
	public void delete(int qaNum) throws Exception {
		List<CommonFileVo> filelist = dao.qaFileDelList(qaNum);
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
		dao.qaFileDelete(qaNum);
		dao.delete(qaNum);
		}
		
	}



	@Override
	public List<QaBoardVo> listAll(int start, int end, String search_option, String keyword) throws Exception {
		return dao.listAll(start, end, search_option, keyword);
	}



	@Override
	public void increaseViewcnt(int qaNum, HttpSession session) throws Exception {
		long update_time = 0;
		// 세션에 저장된 게시물의 조회시간 검색
		if (session.getAttribute("update_time_" + qaNum) != null) {
			update_time = (Long) session.getAttribute("update_time_" + qaNum);
		}
		// 현재 시간
		long current_time = System.currentTimeMillis();
		// 일정 시간이 경과된 후 조회수 증가 처리
		if (current_time - update_time > 5 * 1000) {
			dao.increaseViewcnt(qaNum);
			session.setAttribute("update_time_" + qaNum, current_time);
		}
		
	}



	@Override
	public int countArticle(String search_option, String keyword) throws Exception {
		return dao.countArticle(search_option, keyword);
	}



	@Override
	public int qafileWrite(List<MultipartFile> filelist, int num) throws Exception {
		InputStream is = null;
		FileOutputStream fos = null;
		String filePath = "C:\\Users\\Lenovo\\git\\NEWDEAL_ICT";
		CommonFileVo filevo = new CommonFileVo();
		try {
			if (filelist.size() > 1) {
				for (int i = 0; i < filelist.size(); i++) {
					is = filelist.get(i).getInputStream();
					UUID uuid = UUID.randomUUID();
					String fileOrgName = filelist.get(i).getOriginalFilename();
					String fileName = uuid + "_" + fileOrgName;
					String fileSize = filevo.byteCalculation(String.valueOf(filelist.get(i).getSize()));
					filevo.setFileName(fileName);
					filevo.setFileSize(fileSize);
					filevo.setFileOrgName(fileOrgName);
					filevo.setFilePath(filePath);
					filevo.setFileRefNum(dao.qamaxNum());
					dao.qafileWrite(filevo);
					fos = new FileOutputStream(filePath + "\\" + fileName);
					FileCopyUtils.copy(is, fos);

					fos.close();
					is.close();
				}
			}
		} finally {

		}
		return 0;
	}



	@Override
	public int qamaxNum() throws Exception {
		
		return dao.qamaxNum();
	}



	@Override
	public CommonFileVo fileinfo(CommonFileVo filevo) throws Exception {
		return dao.fileinfo(filevo);
	}



	@Override
	public int fileDel(CommonFileVo filevo) throws Exception {
		
		CommonFileVo vo=dao.fileinfo(filevo);
		File file=new File(vo.getFilePath()+"\\"+vo.getFileName());
		if( file.exists() ){
            if(file.delete()){
                System.out.println("파일삭제 성공");
                dao.fileDel(filevo);
            }else{
                System.out.println("파일삭제 실패");
            }
        }else{
            System.out.println("파일이 존재하지 않습니다.");
        }
		return 1;
	}



	@Override
	public int qaCnt() throws Exception {
		return dao.qaCnt();
	}	
	
	@Transactional
	@Override
	public int insertReply(QaBoardVo vo) throws Exception {
		this.dao.updateStep(vo);
		
		int qaStep = this.dao.stepMax(vo);
		vo.setQaStep(qaStep);
		return this.dao.insertReply(vo);
	}
}
