package com.newdeal.ict.Service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.newdeal.ict.Vo.NoticeVo;

public interface NoticeService {
	//CRUD(Create, Read, Update, Delete)
	public void create(NoticeVo vo) throws Exception;//湲��벐湲�
	public NoticeVo read(int ntNum) throws Exception;
	public void update(NoticeVo vo) throws Exception;
	public void delete(int ntNum) throws Exception;//湲��궘�젣
//	//0718異붽�
//	public List<BoardDTO> PNList(int bno) throws Exception;
//	//
	public List<NoticeVo> listAll(
			int start, int end, String search_option,
			String keyword) throws Exception;//湲�紐⑸줉
	public List<NoticeVo> listAll() throws Exception;//湲�紐⑸줉
	public void increaseViewcnt(
			int ntNum, HttpSession session) throws Exception;//議고쉶�닔利앷�
	public int countArticle(String search_option,
			String keyword) throws Exception;
}
