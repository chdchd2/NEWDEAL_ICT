package com.newdeal.ict.Dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newdeal.ict.Vo.CommentVo;
import com.newdeal.ict.Vo.CommonFileVo;
import com.newdeal.ict.Vo.ReviewVo;



@Repository
public class ReviewDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "mybatis.mapper.ReviewMapper";
	
	public int rvWrite(ReviewVo vo) {
		return session.insert(NAMESPACE+".rvWrite",vo);
	}
	
	public int rvmaxNum() {
		return session.selectOne(NAMESPACE+".rvmaxNum");
	}
	
	public int rvfileWrite(CommonFileVo vo) {
		return session.insert(NAMESPACE+".rvfileWrite",vo);
	}
	
	public List<ReviewVo> rvList(HashMap<String, Object> map){
		String sss=(String)map.get("rvPart");
		System.out.println("asdfsadfsadfsadf===>"+sss);
		return session.selectList(NAMESPACE+".rvList",map);
	}
	
	public int rvCnt(HashMap<String, Object> map) {
		return session.selectOne(NAMESPACE+".rvCnt",map);
	}
	
	public ReviewVo rvDetail(int intNum) {
		return session.selectOne(NAMESPACE+".rvDetail",intNum);
	}
	
	public ReviewVo rvNext(int rvNum) {
		return session.selectOne(NAMESPACE+".rvNext",rvNum);
	}
	public ReviewVo rvPrev(int rvNum) {
		return session.selectOne(NAMESPACE+".rvPrev",rvNum);
	}
	public CommonFileVo fileinfo(CommonFileVo filevo) {
		return session.selectOne(NAMESPACE+".fileinfo",filevo);
	}
	
	public ReviewVo rvgetWriter(int rvNum) {
		return session.selectOne(NAMESPACE+".rvgetWriter",rvNum);
	}
	
	public int rvDelete(int rvNum) {
		return session.delete(NAMESPACE+".rvDelete",rvNum);
	}
	
	public int rvFileDelete(int rvNum) {
		return session.delete(NAMESPACE+".rvFileDelete",rvNum);
	}
	
	public List<CommonFileVo> rvFileDelList(int rvNum){
		return session.selectList(NAMESPACE+".rvFileDelList",rvNum);
	}
	
	public int rvEdit(ReviewVo vo) {
		return session.update(NAMESPACE+".rvEdit",vo);
	}
	public int fileDel(CommonFileVo vo) {
		return session.delete(NAMESPACE+".fileDel",vo);
	}
	
	public int rvCntUp(int rvNum) {
		return session.update(NAMESPACE+".rvCntUp",rvNum);
	}
	public List<ReviewVo> rvPart() {
		return session.selectList(NAMESPACE+".rvPart");
	}

	public int comment(CommentVo vo) {
		return session.insert(NAMESPACE+".comment",vo);
	}
	
	public List<CommentVo> commentList(int rvNum){
		return session.selectList(NAMESPACE+".commentList",rvNum);
	}
	
	/*public void comUpdate(CommentVo vo) throws Exception {
		sqlSession.update("freeboard.comUpdate", vo);
    }
*/

	public int comDel(int comNum) throws Exception {
		return session.delete(NAMESPACE+".comDel", comNum);
	}
	
}
