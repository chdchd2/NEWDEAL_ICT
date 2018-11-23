package com.newdeal.ict.Service.Impl;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.newdeal.ict.Dao.NoticeDao;
import com.newdeal.ict.Service.NoticeService;
import com.newdeal.ict.Vo.NoticeVo;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Inject
	NoticeDao dao;

	@Transactional
	@Override
	public void create(NoticeVo vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public NoticeVo read(int ntNum) throws Exception {
		return dao.read(ntNum);
	}
	
	@Transactional//트랜잭션처리
	@Override
	public void update(NoticeVo vo) throws Exception {
		dao.update(vo);//board테이블 수정
	}

	@Override
	public void delete(int ntNum) throws Exception {
		dao.delete(ntNum);
	}

	@Override
	public List<NoticeVo> listAll(int start, int end, String search_option, String keyword) throws Exception {
		return dao.listAll(
				start, end, search_option, keyword);
	}

	@Override
	public void increaseViewcnt(int ntNum, HttpSession session) throws Exception {
		long update_time = 0;
		//세션에 저장된 게시물의 조회시간 검색
		if(session.getAttribute("update_time_"+ntNum)!=null){
			update_time=(Long)session.getAttribute(
					"update_time_"+ntNum);
		}
		//현재 시간
		long current_time=System.currentTimeMillis();
		//일정 시간이 경과된 후 조회수 증가 처리
		if(current_time - update_time > 5*1000){
			dao.increaseViewcnt(ntNum);
			session.setAttribute(
					"update_time_"+ntNum, current_time);
		}
	}

	@Override
	public int countArticle(String search_option, String keyword) throws Exception {
		return dao.countArticle(search_option, keyword);
	}

	/*//0718추가
	@Override
	public List<Boardvo> PNList(int bno) throws Exception {
		return boardDao.PNList(bno);
	}
	//
*/}
