package com.newdeal.ict.Service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.newdeal.ict.Vo.FreeBoardVo;

public interface FreeBoardService {

	public void deleteFile(String atFullname); //첨부파일삭제
	public List<String> getAttach(int fbNum);//첨부파일 정보
	//CRUD(Create, Read, Update, Delete)
	public void create(FreeBoardVo vo) throws Exception;//글쓰기
	public FreeBoardVo read(int fbNum) throws Exception;
	public void update(FreeBoardVo vo) throws Exception;
	public void delete(int fbNum) throws Exception;//글삭제
//	//0718추가
//	public List<BoardDTO> PNList(int bno) throws Exception;
//	//
	public List<FreeBoardVo> listAll(
			int start, int end, String search_option,
			String keyword) throws Exception;//글목록
	public void increaseViewcnt(
			int fbNum, HttpSession session) throws Exception;//조회수증가
	public int countArticle(String search_option,
			String keyword) throws Exception;
}
