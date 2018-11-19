package com.newdeal.ict.Dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.newdeal.ict.Vo.CommonFileVo;
import com.newdeal.ict.Vo.FreeBoardVo;

@Repository

public class FreeBoardDao {
	@Inject
	SqlSession sqlSession;
	
	public void create(FreeBoardVo vo) throws Exception {
		sqlSession.insert("freeboard.insert", vo);

	}

	public int fbmaxNum() {
		return sqlSession.selectOne("freeboard.fbmaxNum");
	}
	
	public int fbCnt() {
		return sqlSession.selectOne("freeboard.fbCnt");
	}
	
	public int fbfileWrite(CommonFileVo vo) {
		return sqlSession.insert("freeboard.fbfileWrite",vo);
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
	public CommonFileVo fileinfo(CommonFileVo filevo) {
		return sqlSession.selectOne("freeboard.fileinfo",filevo);
	}
	public int fbFileDelete(int fbNum) {
		return sqlSession.delete("freeboard.fbFileDelete",fbNum);
	}
	public List<CommonFileVo> fbFileDelList(int fbNum){
		return sqlSession.selectList("freeboard.fbFileDelList",fbNum);
	}
	public int fileDel(CommonFileVo vo) {
		return sqlSession.delete("freeboard.fileDel",vo);
	}
}
