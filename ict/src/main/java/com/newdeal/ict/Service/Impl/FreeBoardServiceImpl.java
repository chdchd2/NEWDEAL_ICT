package com.newdeal.ict.Service.Impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.newdeal.ict.Dao.FreeBoardDao;
import com.newdeal.ict.Service.FreeBoardService;
import com.newdeal.ict.Vo.CommentVo;
import com.newdeal.ict.Vo.CommonFileVo;
import com.newdeal.ict.Vo.FreeBoardVo;
import com.newdeal.ict.Vo.IntDetailJoinVo;

@Service
public class FreeBoardServiceImpl implements FreeBoardService {

	@Inject
	FreeBoardDao dao;

	@Transactional
	@Override
	public void create(FreeBoardVo vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public FreeBoardVo read(int fbNum) throws Exception {
		/*dao.increaseViewcnt(fbNum);*/
		return dao.read(fbNum);
	}

	public FreeBoardVo fbNext(int fbNum) throws Exception {
		return dao.fbNext(fbNum);
	}
	
	public FreeBoardVo fbPrev(int fbNum) throws Exception {
		return dao.fbPrev(fbNum);
	}

	@Transactional // 트랜잭션처리
	@Override
	public void update(FreeBoardVo vo) throws Exception {
		dao.update(vo);// board테이블 수정
	}

	@Override
	public void delete(int fbNum) throws Exception {
		List<CommonFileVo> filelist = dao.fbFileDelList(fbNum);
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
		dao.fbFileDelete(fbNum);
		dao.delete(fbNum);
		}
	}

	@Override
	public List<FreeBoardVo> listAll(int start, int end, String search_option, String keyword) throws Exception {
		return dao.listAll(start, end, search_option, keyword);
	}

	@Override
	public void increaseViewcnt(int fbNum, HttpSession session) throws Exception {
		long update_time = 0;
		// 세션에 저장된 게시물의 조회시간 검색
		if (session.getAttribute("update_time_" + fbNum) != null) {
			update_time = (Long) session.getAttribute("update_time_" + fbNum);
		}
		// 현재 시간
		long current_time = System.currentTimeMillis();
		// 일정 시간이 경과된 후 조회수 증가 처리
		if (current_time - update_time > 5 * 1000) {
			dao.increaseViewcnt(fbNum);
			session.setAttribute("update_time_" + fbNum, current_time);
		}
	}

	@Override
	public int countArticle(String search_option, String keyword) throws Exception {
		return dao.countArticle(search_option, keyword);
	}

	/*@Override
	public int fbfileWrite(List<MultipartFile> filelist, int num) throws Exception {
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
					filevo.setFileRefNum(dao.fbmaxNum());
					dao.fbfileWrite(filevo);
					fos = new FileOutputStream(filePath + "\\" + fileName);
					FileCopyUtils.copy(is, fos);

					fos.close();
					is.close();
				}
			}
		} finally {

		}
		return 0;
	}*/

	@Override
	public int fbmaxNum() throws Exception {
		
		return dao.fbmaxNum();
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
	public int fbCnt() throws Exception {
		return dao.fbCnt();
	}

	@Override
	public int comment(CommentVo vo) throws Exception {
	
		return dao.comment(vo);
	}

	@Override
	public List<CommentVo> commentList(int fbNum) throws Exception {
		return dao.commentList(fbNum);
	}

	/*@Override
	public void comUpdate(CommentVo vo) throws Exception {
		dao.comUpdate(vo);
	}*/
	
	@Override
	public int comDel(int comNum) throws Exception {
		return dao.comDel(comNum);
	}
	
}
