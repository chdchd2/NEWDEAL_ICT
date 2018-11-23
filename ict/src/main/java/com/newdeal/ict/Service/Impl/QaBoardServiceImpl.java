package com.newdeal.ict.Service.Impl;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.newdeal.ict.Dao.QaBoardDao;
import com.newdeal.ict.Service.QaBoardService;
import com.newdeal.ict.Vo.QaBoardVo;

@Service
public class QaBoardServiceImpl implements QaBoardService{

	@Inject
	QaBoardDao dao;

	@Transactional
	@Override
	public int create(QaBoardVo vo) throws Exception {
			int qaRef = this.dao.refMax();
			vo.setQaRef(qaRef);
		return this.dao.create(vo);
	}

	@Override
	public QaBoardVo read(int qaNum) throws Exception {
		return this.dao.read(qaNum);
	}
	
	@Transactional
	@Override
	public void update(QaBoardVo vo) throws Exception {
		this.dao.update(vo);
	}

	@Override
	public void delete(int qaNum) throws Exception {
		this.dao.delete(qaNum);
		
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

	@Transactional
	@Override
	public int insertReply(QaBoardVo vo) throws Exception {
		this.dao.updateStep(vo);
		
		int qaStep = this.dao.stepMax(vo);
		vo.setQaStep(qaStep);
		return this.dao.insertReply(vo);
	}

}
