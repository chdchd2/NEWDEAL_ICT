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
import com.newdeal.ict.Vo.NoticeVo;
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
		dao.update(vo);// board占쏙옙占싱븝옙 占쏙옙占쏙옙
		
	}

	public QaBoardVo qaNext(int qaNum) throws Exception {
		return dao.qaNext(qaNum);
	}
	
	public QaBoardVo qaPrev(int qaNum) throws Exception {
		return dao.qaPrev(qaNum);
	}


	@Override
	public void delete(int qaNum) throws Exception {
		List<CommonFileVo> filelist = dao.qaFileDelList(qaNum);
		for(CommonFileVo vo:filelist) {
			String files=vo.getFilePath()+vo.getFileName();
			File file=new File(vo.getFilePath()+"/"+vo.getFileName());
			if( file.exists() ){
	            if(file.delete()){
	            	
	            }else{
	            }
	        }else{
	        }
			dao.qaFileDelete(qaNum);
		}
		dao.delete(qaNum);
		
	}



	@Override
	public List<QaBoardVo> listAll(int start, int end, String search_option, String keyword) throws Exception {
		return dao.listAll(start, end, search_option, keyword);
	}



	@Override
	public void increaseViewcnt(int qaNum, HttpSession session) throws Exception {
		long update_time = 0;
		// 占쏙옙占실울옙 占쏙옙占쏙옙占� 占쌉시뱄옙占쏙옙 占쏙옙회占시곤옙 占싯삼옙
		if (session.getAttribute("update_time_" + qaNum) != null) {
			update_time = (Long) session.getAttribute("update_time_" + qaNum);
		}
		// 占쏙옙占쏙옙 占시곤옙
		long current_time = System.currentTimeMillis();
		// 占쏙옙占쏙옙 占시곤옙占쏙옙 占쏙옙占쏙옙占� 占쏙옙 占쏙옙회占쏙옙 占쏙옙占쏙옙 처占쏙옙
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
		File file=new File(vo.getFilePath()+"/"+vo.getFileName());
		if( file.exists() ){
            if(file.delete()){
                System.out.println("占쏙옙占싹삼옙占쏙옙 占쏙옙占쏙옙");
                dao.fileDel(filevo);
            }else{
                System.out.println("占쏙옙占싹삼옙占쏙옙 占쏙옙占쏙옙");
            }
        }else{
            System.out.println("占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占십쏙옙占싹댐옙.");
        }
		return 1;
	}



	@Override
	public int qaCnt() throws Exception {
		return dao.qaCnt();
	}	
	

	@Override
	public List<QaBoardVo> listAll() throws Exception {
		return dao.listAll();
	}



	@Override
	public QaBoardVo view(int qaNum) throws Exception {
		
		return dao.view(qaNum);
	}



	@Override
	public int answer(QaBoardVo vo) throws Exception {
		return dao.answer(vo);
	}
}