package com.newdeal.ict.Service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.newdeal.ict.Vo.NoticeVo;

public interface NoticeService {
	//CRUD(Create, Read, Update, Delete)
	public void create(NoticeVo vo) throws Exception;//글쓰기
	public NoticeVo read(int ntNum) throws Exception;
	public void update(NoticeVo vo) throws Exception;
	public void delete(int ntNum) throws Exception;//글삭제
//	//0718추가
//	public List<BoardDTO> PNList(int bno) throws Exception;
//	//
	public List<NoticeVo> listAll(
			int start, int end, String search_option,
			String keyword) throws Exception;//글목록
	public void increaseViewcnt(
			int ntNum, HttpSession session) throws Exception;//조회수증가
	public int countArticle(String search_option,
			String keyword) throws Exception;
}
