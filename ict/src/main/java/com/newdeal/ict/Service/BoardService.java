package com.newdeal.ict.Service;

import java.util.List;
import java.util.Map;

import com.newdeal.ict.Vo.BoardVO;
import com.newdeal.ict.Vo.Criteria;
import com.newdeal.ict.Vo.SearchCriteria;

public interface BoardService {
	public void regist(BoardVO board) throws Exception;
	
	public BoardVO read(int bno) throws Exception;
	
	public void modify(Map map) throws Exception;
//	public void modify(BoardVO board) throws Exception;
	
	public void remove(Map map) throws Exception;
//	public void remove(int bno) throws Exception;
	
	public List<BoardVO> listAll() throws Exception;
		
	public List<BoardVO> listCriteria(Criteria cri) throws Exception;
	
	public int listCountCriteria(Criteria cri) throws Exception;

	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri) throws Exception;

}
