package com.newdeal.ict.Service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newdeal.ict.Dao.BoardDAO;
import com.newdeal.ict.Service.BoardService;
import com.newdeal.ict.Vo.BoardVO;
import com.newdeal.ict.Vo.Criteria;
import com.newdeal.ict.Vo.SearchCriteria;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO dao;
	
	@Override
	public void regist(BoardVO board) throws Exception {
		dao.create(board);

	}

	@Override
	public BoardVO read(int bno) throws Exception {
		return dao.read(bno);
	}

	@Override
	public void modify(Map map) throws Exception {
		dao.update(map);

	}
	/*@Override
	public void modify(BoardVO board) throws Exception {
		dao.update(board);

	}*/
	
	@Override
	public void remove(Map map) throws Exception {
		dao.delete(map);

	}
	/*@Override
	public void remove(int bno) throws Exception {
		dao.delete(bno);

	}*/

	@Override
	public List<BoardVO> listAll() throws Exception {
		return dao.listAll();
	}
	
	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		return dao.countPaging(cri);
	}

	@Override
	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearchCount(cri);
	}
	
	
}