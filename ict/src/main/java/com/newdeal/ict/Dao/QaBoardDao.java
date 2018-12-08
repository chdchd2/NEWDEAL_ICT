package com.newdeal.ict.Dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.newdeal.ict.Vo.CommonFileVo;
import com.newdeal.ict.Vo.FreeBoardVo;
import com.newdeal.ict.Vo.QaBoardVo;

@Repository
public class QaBoardDao {
	
	@Inject
	SqlSession sqlSession;

	public void create(QaBoardVo vo) throws Exception {
		sqlSession.insert("qaboard.insert", vo);

	}

	public int qamaxNum() {
		return sqlSession.selectOne("qaboard.qamaxNum");
	}
	
	public int qaCnt() {
		return sqlSession.selectOne("qaboard.qaCnt");
	}
	
	public int qafileWrite(CommonFileVo vo) {
		return sqlSession.insert("qaboard.qafileWrite",vo);
	}
	
	public QaBoardVo read(int qaNum) throws Exception {
		return sqlSession.selectOne("qaboard.view", qaNum);
	}

	public QaBoardVo qaNext(int qaNum) {
		return sqlSession.selectOne("qaboard.qaNext",qaNum);
	}
	public QaBoardVo qaPrev(int qaNum) {
		return sqlSession.selectOne("qaboard.qaPrev",qaNum);
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
	public CommonFileVo fileinfo(CommonFileVo filevo) {
		return sqlSession.selectOne("qaboard.fileinfo",filevo);
	}
	public int qaFileDelete(int qaNum) {
		return sqlSession.delete("qaboard.qaFileDelete",qaNum);
	}
	public List<CommonFileVo> qaFileDelList(int qaNum){
		return sqlSession.selectList("qaboard.qaFileDelList",qaNum);
	}
	public int fileDel(CommonFileVo vo) {
		return sqlSession.delete("qaboard.fileDel",vo);
	}
	public int refMax() throws Exception {
		return sqlSession.selectOne("qaboard.refMax");
	}
	
	
	public List<QaBoardVo> listAll() throws Exception {
		return sqlSession.selectList("qaboard.qaListAll");
	}
	
	public QaBoardVo view(int qaNum) throws Exception {
		return sqlSession.selectOne("qaboard.adminView", qaNum);
	} 
	
	public int answer(QaBoardVo vo) throws Exception{
		System.out.println("dao���� �� vo"+vo.toString());
		sqlSession.update("qaboard.answercomplete",vo);
		return sqlSession.insert("qaboard.answer",vo);
	}
	
}
