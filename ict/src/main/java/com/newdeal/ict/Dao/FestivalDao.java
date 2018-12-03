package com.newdeal.ict.Dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newdeal.ict.Util.PageUtil;
import com.newdeal.ict.Vo.CommonFileVo;
import com.newdeal.ict.Vo.EduDetailVo;
import com.newdeal.ict.Vo.FesDetailVo;
import com.newdeal.ict.Vo.FestivalVo;
import com.newdeal.ict.Vo.IntDetailJoinVo;
import com.newdeal.ict.Vo.IntroduceVo;

@Repository
public class FestivalDao {
	@Autowired 
	private SqlSession session;
	private final String NAMESPACE = "mybatis.mapper.FestivalMapper";
	
	public int fesWrite(FestivalVo vo) {
		return session.insert(NAMESPACE+".fesWrite",vo);
	}
	
	public FestivalVo intNext(int fesNum) {
		return session.selectOne(NAMESPACE+".intNext",fesNum);
	}
	public FestivalVo intPrev(int fesNum) {
		return session.selectOne(NAMESPACE+".intPrev",fesNum);
	}
	
	public List<FestivalVo> list(HashMap<String, Object> map){
		return session.selectList(NAMESPACE+".list",map);
	}

	public int fesCnt(HashMap<String, Object> map) {
		return session.selectOne(NAMESPACE+".fesCnt",map);
	}
	
	public FestivalVo fesDetail(int fesNum) {
		return session.selectOne(NAMESPACE+".fesDetail",fesNum);
	}
	
	
	public int fesmaxNum() {
		return session.selectOne(NAMESPACE+".fesmaxNum");
	}

	public int detailCntUp(int fesNum) {
		return session.update(NAMESPACE+".detailCntUp",fesNum);
	}
	
	public int DeldetailCntUp(int detNum) {
		return session.update(NAMESPACE+".DeldetailCntUp",detNum);
	}

	public FestivalVo getWriter(int fesNum) {
		return session.selectOne(NAMESPACE+".getWriter",fesNum);
	}

	public CommonFileVo fileinfo(CommonFileVo filevo) {
		return session.selectOne(NAMESPACE+".fileinfo",filevo);
	}

	public int intfileWrite(CommonFileVo vo) {
		return session.insert(NAMESPACE+".intfileWrite",vo);
	}

	public int fesDelete(int fesNum) {
		return session.delete(NAMESPACE+".fesDelete",fesNum);
	}
	public int intFileDelete(int fesNum) {
		return session.delete(NAMESPACE+".intFileDelete",fesNum);
	}
	public List<CommonFileVo> intFileDelList(int fesNum){
		return session.selectList(NAMESPACE+".intFileDelList",fesNum);
	}
	public int fesEdit(FestivalVo vo) {
		return session.update(NAMESPACE+".fesEdit",vo);
	}
	public int fileDel(CommonFileVo vo) {
		return session.delete(NAMESPACE+".fileDel",vo);
	}

	public int detailWrite(FesDetailVo vo) {
		System.out.println("�����ϱ���������Ȯ��"+vo.toString());
		return session.insert(NAMESPACE+".detailWrite",vo);
	}

	public int detailCnt() {
		return session.selectOne(NAMESPACE+".detailCnt");
	}

	public List<FesDetailVo> detailList(HashMap<String,Object> map) {
		String sss=(String)map.get("detPart");
		System.out.println("asdfsadfsadfsadf===>"+sss);
		return session.selectList(NAMESPACE+".detailList",map);
	}

	public FesDetailVo getWriterD(int detNum) {
		return session.selectOne(NAMESPACE+".getWriterD",detNum);
	}

	public FesDetailVo detDetail(int detNum) {
		return session.selectOne(NAMESPACE+".detDetail",detNum);
	}

	public int detEdit(FesDetailVo vo) {
		return session.update(NAMESPACE+".detEdit",vo);
	}

	public FesDetailVo detPrev(int detNum) {
		return session.selectOne(NAMESPACE+".detPrev",detNum);
	}

	public FesDetailVo detNext(int detNum) {
		return session.selectOne(NAMESPACE+".detNext",detNum);
	}
	
	public int detDelete(int detNum) {
		return session.delete(NAMESPACE+".detDelete",detNum);
	}


	public List<FesDetailVo> detPart() {
		return session.selectList(NAMESPACE+".detPart");
	}

	public int detCnt(HashMap<String, Object> map) {
		return session.selectOne(NAMESPACE+".detCnt",map);
	}
	
}
