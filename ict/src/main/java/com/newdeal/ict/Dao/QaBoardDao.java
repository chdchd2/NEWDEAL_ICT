package com.newdeal.ict.Dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.newdeal.ict.Vo.QaBoardVo;

@Repository
public class QaBoardDao {
	
	@Inject
	SqlSession sqlSession;
	
	public int create(QaBoardVo vo) throws Exception {
		sqlSession.insert("qaboard.insert", vo);
		int qaNum = vo.getQaNum();
		return qaNum;

	}

	public int refMax() throws Exception {
		return sqlSession.selectOne("qaboard.refMax");
	}
	
	public int stepMax(QaBoardVo vo) throws Exception {
		return sqlSession.selectOne("qaboard.stepMax", vo);
	}
	
	public void updateStep(QaBoardVo vo) throws Exception {
		sqlSession.selectOne("qaboard.updateStep", vo);
	}
	
	
	public QaBoardVo read(int qaNum) throws Exception {
		return sqlSession.selectOne("qaboard.view", qaNum );
	}
	
	public void update(QaBoardVo vo) throws Exception {
		sqlSession.update("qaboard.update", vo);

	}

	public void delete(int qaNum) throws Exception {
		sqlSession.delete("qaboard.deleteArticle", qaNum);

	}

	public List<QaBoardVo> listAll(
			int start, int end, String search_option, String keyword) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("qaboard.listAll", map);
	}

	public void increaseViewcnt(int qaNum) {
		sqlSession.update("qaboard.increaseViewcnt", qaNum);

	}

	public int countArticle(String search_option, String keyword) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		return sqlSession.selectOne("qaboard.countArticle", map);
	}
	
	public int insertReply(QaBoardVo vo) throws Exception {
		sqlSession.insert("qaboard.insertReply", vo);
		int qaNum = vo.getQaNum();
		return qaNum;
	}
}
