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
	
	@Transactional//�듃�옖�옲�뀡泥섎━
	@Override
	public void update(NoticeVo vo) throws Exception {
		dao.update(vo);//board�뀒�씠釉� �닔�젙
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
		//�꽭�뀡�뿉 ���옣�맂 寃뚯떆臾쇱쓽 議고쉶�떆媛� 寃��깋
		if(session.getAttribute("update_time_"+ntNum)!=null){
			update_time=(Long)session.getAttribute(
					"update_time_"+ntNum);
		}
		//�쁽�옱 �떆媛�
		long current_time=System.currentTimeMillis();
		//�씪�젙 �떆媛꾩씠 寃쎄낵�맂 �썑 議고쉶�닔 利앷� 泥섎━
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

	@Override
	public List<NoticeVo> listAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.listAll();
	}

	/*//0718異붽�
	@Override
	public List<Boardvo> PNList(int bno) throws Exception {
		return boardDao.PNList(bno);
	}
	//
*/}
