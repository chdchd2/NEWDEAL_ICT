package com.newdeal.ict.Dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.newdeal.ict.Vo.CommonFileVo;
import com.newdeal.ict.Vo.FreeBoardVo;
import com.newdeal.ict.Vo.NoticeVo;

@Repository

public class NoticeDao {
	@Inject
	SqlSession sqlSession;
	

	public void create(NoticeVo vo) throws Exception {
		sqlSession.insert("notice.insert", vo);

	}

	public int ntmaxNum() {
		return sqlSession.selectOne("notice.ntmaxNum");
	}
	
	public int ntCnt() {
		return sqlSession.selectOne("notice.ntCnt");
	}
	
	public int ntfileWrite(CommonFileVo vo) {
		return sqlSession.insert("notice.ntfileWrite",vo);
	}
	
	public NoticeVo read(int ntNum) throws Exception {
		return sqlSession.selectOne("notice.view", ntNum);
	}

	public NoticeVo ntNext(int ntNum) {
		return sqlSession.selectOne("notice.ntNext",ntNum);
	}
	public NoticeVo ntPrev(int ntNum) {
		return sqlSession.selectOne("notice.ntPrev",ntNum);
	}

	public void update(NoticeVo vo) throws Exception {
		sqlSession.update("notice.update", vo);

	}

	public void delete(int ntNum) throws Exception {
		sqlSession.delete("notice.deleteArticle", ntNum);

	}

	public List<NoticeVo> listAll(
			int start, int end, String search_option, String keyword) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("notice.listAll", map);
	}

	public void increaseViewcnt(int ntNum) {
		sqlSession.update("notice.increaseViewcnt", ntNum);

	}

	public int countArticle(String search_option, String keyword) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		return sqlSession.selectOne("notice.countArticle", map);
	}
	
	public CommonFileVo fileinfo(CommonFileVo filevo) {
		return sqlSession.selectOne("notice.fileinfo",filevo);
	}
	public int ntFileDelete(int ntNum) {
		return sqlSession.delete("notice.ntFileDelete",ntNum);
	}
	public List<CommonFileVo> ntFileDelList(int ntNum){
		return sqlSession.selectList("notice.ntFileDelList",ntNum);
	}
	public int fileDel(CommonFileVo vo) {
		return sqlSession.delete("notice.fileDel",vo);
	}
	



	/*//0718異붽�
	@Override
	public List<Boardvo> PNList(int bno) throws Exception {
		return sqlSession.selectList("board.PNList", bno);
	}
	//
*/	
}
