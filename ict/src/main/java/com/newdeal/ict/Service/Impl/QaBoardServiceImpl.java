package com.newdeal.ict.Service.Impl;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.newdeal.ict.Dao.QaBoardDao;
import com.newdeal.ict.Service.QaBoardService;
import com.newdeal.ict.Vo.QaBoardVo;

@Service
public class QaBoardServiceImpl implements QaBoardService{

	@Inject
	QaBoardDao dao;
	
	@Override
	public void create(QaBoardVo vo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public QaBoardVo read(int qaNum) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(QaBoardVo vo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int qaNum) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<QaBoardVo> listAll(int start, int end, String search_option, String keyword) throws Exception {
		return null;
	}

	@Override
	public void increaseViewcnt(int qaNum, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int countArticle(String search_option, String keyword) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
