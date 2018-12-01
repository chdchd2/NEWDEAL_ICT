package com.newdeal.ict.Dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newdeal.ict.Util.PageUtil;
import com.newdeal.ict.Vo.CommonFileVo;
import com.newdeal.ict.Vo.EduDetailVo;
import com.newdeal.ict.Vo.IntDetailJoinVo;
import com.newdeal.ict.Vo.IntroduceVo;



@Repository
public class EduDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "mybatis.mapper.EduMapper";
	
	public int intWrite(IntroduceVo vo) {
		return session.insert(NAMESPACE+".intWrite",vo);
	}
	
	public int intmaxNum() {
		return session.selectOne(NAMESPACE+".intmaxNum");
	}
	
	public int intfileWrite(CommonFileVo vo) {
		return session.insert(NAMESPACE+".intfileWrite",vo);
	}
	public List<IntroduceVo> intList(HashMap<String, Object> map){
		return session.selectList(NAMESPACE+".intList",map);
	}
	public List<EduDetailVo> detailList(PageUtil vo){
		return session.selectList(NAMESPACE+".detailList",vo);
	}
	public int intCnt(HashMap<String, Object> map) {
		return session.selectOne(NAMESPACE+".intCnt",map);
	}
	public int detailCnt() {
		return session.selectOne(NAMESPACE+".detailCnt");
	}
	public IntDetailJoinVo intDetail(int intNum) {
		return session.selectOne(NAMESPACE+".intDetail",intNum);
	}
	
	public IntDetailJoinVo intNext(int intNum) {
		return session.selectOne(NAMESPACE+".intNext",intNum);
	}
	public IntDetailJoinVo intPrev(int intNum) {
		return session.selectOne(NAMESPACE+".intPrev",intNum);
	}
	public CommonFileVo fileinfo(CommonFileVo filevo) {
		return session.selectOne(NAMESPACE+".fileinfo",filevo);
	}
	public IntroduceVo getWriter(int intNum) {
		return session.selectOne(NAMESPACE+".getWriter",intNum);
	}
	public int intDelete(int intNum) {
		return session.delete(NAMESPACE+".intDelete",intNum);
	}
	public int intFileDelete(int intNum) {
		return session.delete(NAMESPACE+".intFileDelete",intNum);
	}
	public List<CommonFileVo> intFileDelList(int intNum){
		return session.selectList(NAMESPACE+".intFileDelList",intNum);
	}
	public int intEdit(IntroduceVo vo) {
		return session.update(NAMESPACE+".intEdit",vo);
	}
	public int fileDel(CommonFileVo vo) {
		return session.delete(NAMESPACE+".fileDel",vo);
	}
	public int detailCntUp(int intNum) {
		return session.update(NAMESPACE+".detailCntUp",intNum);
	}
	public int detailWrite(EduDetailVo vo) {
		System.out.println("디테일까지오는지확인"+vo.toString());
		return session.insert(NAMESPACE+".detailWrite",vo);
	}
	
}
