package com.newdeal.ict.Dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.newdeal.ict.Vo.FreeBoardVo;

@Repository

public class FreeBoardDao {
	@Inject
	SqlSession sqlSession;
	
	public void deleteFile(String atFullname) {
		sqlSession.delete("freeboard.deleteFile", atFullname);

	}

	public List<String> getAttach(int fbNum) {
		return sqlSession.selectList("freeboard.getAttach", fbNum);
	}

	public void addAttach(String atFullname) {
		sqlSession.insert("freeboard.addAttach", atFullname);

	}
//첨부파일수정
	public void updateAttach(String atFullname, int fbNum) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("atFullname", atFullname);
		map.put("fbNum", fbNum);
		sqlSession.insert("freeboard.updateAttach",map);

	}

	public void create(FreeBoardVo vo) throws Exception {
		sqlSession.insert("freeboard.insert", vo);

	}

	public FreeBoardVo read(int fbNum) throws Exception {
		return sqlSession.selectOne("freeboard.view", fbNum);
	}
	
	public void update(FreeBoardVo vo) throws Exception {
		sqlSession.update("freeboard.update", vo);

	}

	public void delete(int fbNum) throws Exception {
		sqlSession.delete("freeboard.deleteArticle", fbNum);

	}

	public List<FreeBoardVo> listAll(
			int start, int end, String search_option, String keyword) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("freeboard.listAll", map);
	}

	public void increaseViewcnt(int fbNum) {
		sqlSession.update("freeboard.increaseViewcnt", fbNum);

	}

	public int countArticle(String search_option, String keyword) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		return sqlSession.selectOne("freeboard.countArticle", map);
	}



	/*//0718추가
	@Override
	public List<Boardvo> PNList(int bno) throws Exception {
		return sqlSession.selectList("board.PNList", bno);
	}
	//
*/	
}
