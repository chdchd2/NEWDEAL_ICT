package com.newdeal.ict.Service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.newdeal.ict.Vo.QaBoardVo;

public interface QaBoardService {
	public int create(QaBoardVo vo) throws Exception;//글쓰기
	public QaBoardVo read(int qaNum) throws Exception;
	public void update(QaBoardVo vo) throws Exception;
	public void delete(int qaNum) throws Exception;//글삭제
	public List<QaBoardVo> listAll(
			int start, int end, String search_option,
			String keyword) throws Exception;//글목록
	public void increaseViewcnt(
			int qaNum, HttpSession session) throws Exception;//조회수증가
	public int countArticle(String search_option,
			String keyword) throws Exception;
	public int insertReply(QaBoardVo vo) throws Exception;
}
