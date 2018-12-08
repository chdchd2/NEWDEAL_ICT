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
		dao.update(vo);// board���̺� ����
		
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
		System.out.println("���ϸ���Ʈ���"+filelist.toString());
		for(CommonFileVo vo:filelist) {
			String files=vo.getFilePath()+vo.getFileName();
			System.out.println("���ϵ��丮+�����̸� ����غ���"+files);
			File file=new File(vo.getFilePath()+"\\"+vo.getFileName());
			if( file.exists() ){
	            if(file.delete()){
	                System.out.println("���ϻ��� ����");
	            }else{
	                System.out.println("���ϻ��� ����");
	            }
	        }else{
	            System.out.println("������ �������� �ʽ��ϴ�.");
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
		// ���ǿ� ����� �Խù��� ��ȸ�ð� �˻�
		if (session.getAttribute("update_time_" + qaNum) != null) {
			update_time = (Long) session.getAttribute("update_time_" + qaNum);
		}
		// ���� �ð�
		long current_time = System.currentTimeMillis();
		// ���� �ð��� ����� �� ��ȸ�� ���� ó��
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
		File file=new File(vo.getFilePath()+"\\"+vo.getFileName());
		if( file.exists() ){
            if(file.delete()){
                System.out.println("���ϻ��� ����");
                dao.fileDel(filevo);
            }else{
                System.out.println("���ϻ��� ����");
            }
        }else{
            System.out.println("������ �������� �ʽ��ϴ�.");
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