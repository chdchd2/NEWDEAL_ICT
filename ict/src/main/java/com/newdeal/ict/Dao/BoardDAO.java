package com.newdeal.ict.Dao;

import java.util.List;
import java.util.Map;

import com.newdeal.ict.Vo.BoardVO;
import com.newdeal.ict.Vo.Criteria;
import com.newdeal.ict.Vo.SearchCriteria;

public interface BoardDAO {
	public void create(BoardVO vo) throws Exception;
	
	public BoardVO read(int bno) throws Exception;
	
//	public void update(BoardVO vo) throws Exception;
	public void update(Map map) throws Exception;
	
//	public void delete(int bno) throws Exception;
	public void delete(Map map) throws Exception;
	
	public List<BoardVO> listAll() throws Exception;
	
	public List<BoardVO> listPage(int page) throws Exception;
	
	public List<BoardVO> listCriteria(Criteria cri) throws Exception;
	
	public int countPaging(Criteria cri) throws Exception;
	
	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri) throws Exception;

}
