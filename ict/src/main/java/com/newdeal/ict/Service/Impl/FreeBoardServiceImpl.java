package com.newdeal.ict.Service.Impl;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.newdeal.ict.Dao.FreeBoardDao;
import com.newdeal.ict.Service.FreeBoardService;
import com.newdeal.ict.Vo.FreeBoardVo;

@Service
public class FreeBoardServiceImpl implements FreeBoardService {

	@Inject
	FreeBoardDao dao;
	
	@Override
	public void deleteFile(String atFullname) {
		dao.deleteFile(atFullname);
	}

	@Override
	public List<String> getAttach(int fbNum) {
		return dao.getAttach(fbNum);
	}

	@Transactional
	@Override
	public void create(FreeBoardVo vo) throws Exception {
		dao.create(vo);
		//첨부파일 정보 저장
		String[] fbFiles=vo.getFbFiles();
		if(fbFiles==null) return; //첨부파일이 없으면 리턴
		for(String name : fbFiles){
			dao.addAttach(name);
		}
	}

	@Override
	public FreeBoardVo read(int fbNum) throws Exception {
		return dao.read(fbNum);
	}
	
	@Transactional//트랜잭션처리
	@Override
	public void update(FreeBoardVo vo) throws Exception {
		dao.update(vo);//board테이블 수정
		//attach 테이블 수정
		String[] fbFiles=vo.getFbFiles();
		if(fbFiles==null) return;
		for(String name : fbFiles) {
			System.out.println("첨부파일 이름:"+name);
			dao.updateAttach(name, vo.getFbNum());
		}
	}

	@Override
	public void delete(int fbNum) throws Exception {
		dao.delete(fbNum);
	}

	@Override
	public List<FreeBoardVo> listAll(int start, int end, String search_option, String keyword) throws Exception {
		return dao.listAll(
				start, end, search_option, keyword);
	}

	@Override
	public void increaseViewcnt(int fbNum, HttpSession session) throws Exception {
		long update_time = 0;
		//세션에 저장된 게시물의 조회시간 검색
		if(session.getAttribute("update_time_"+fbNum)!=null){
			update_time=(long)session.getAttribute(
					"update_time_"+fbNum);
		}
		//현재 시간
		long current_time=System.currentTimeMillis();
		//일정 시간이 경과된 후 조회수 증가 처리
		if(current_time - update_time > 5*1000){
			dao.increaseViewcnt(fbNum);
			session.setAttribute(
					"update_time_"+fbNum, current_time);
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
