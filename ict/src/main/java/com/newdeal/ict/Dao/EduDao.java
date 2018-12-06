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
import com.newdeal.ict.Vo.MemberVo;



@Repository
public class EduDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "mybatis.mapper.EduMapper";
	
	public int intWrite(IntroduceVo vo) {
		return session.insert(NAMESPACE+".intWrite",vo);
	}
	
	public int detWrite(EduDetailVo vo) {
		return session.insert(NAMESPACE+".detWrite",vo);
	}
	
	
	public int intmaxNum() {
		return session.selectOne(NAMESPACE+".intmaxNum");
	}
	
	public int detmaxNum() {
		return session.selectOne(NAMESPACE+".detmaxNum");
	}
	
	public int intfileWrite(CommonFileVo vo) {
		return session.insert(NAMESPACE+".intfileWrite",vo);
	}
	
	public int detfileWrite(CommonFileVo vo) {
		return session.insert(NAMESPACE+".detfileWrite",vo);
	}
	public List<IntroduceVo> intList(HashMap<String, Object> map){
		return session.selectList(NAMESPACE+".intList",map);
	}
	
	public List<EduDetailVo> detList(HashMap<String, Object> map){
		return session.selectList(NAMESPACE+".detList",map);
	}
	
	public int intCnt(HashMap<String, Object> map) {
		return session.selectOne(NAMESPACE+".intCnt",map);
	}
	public int detCnt(HashMap<String, Object> map) {
		return session.selectOne(NAMESPACE+".detCnt",map);
	}
	
	public IntDetailJoinVo intDetail(int intNum) {
		return session.selectOne(NAMESPACE+".intDetail",intNum);
	}
	
	public EduDetailVo detDetail(int intNum) {
		return session.selectOne(NAMESPACE+".detDetail",intNum);
	}
	
	public IntDetailJoinVo intNext(int intNum) {
		return session.selectOne(NAMESPACE+".intNext",intNum);
	}
	public IntDetailJoinVo intPrev(int intNum) {
		return session.selectOne(NAMESPACE+".intPrev",intNum);
	}
	
	public EduDetailVo detNext(int detNum) {
		return session.selectOne(NAMESPACE+".detNext",detNum);
	}
	public EduDetailVo detPrev(int detNum) {
		return session.selectOne(NAMESPACE+".detPrev",detNum);
	}
	public CommonFileVo fileinfo(CommonFileVo filevo) {
		return session.selectOne(NAMESPACE+".fileinfo",filevo);
	}
	public IntroduceVo getWriter(int intNum) {
		return session.selectOne(NAMESPACE+".getWriter",intNum);
	}
	
	public EduDetailVo detgetWriter(int detNum) {
		return session.selectOne(NAMESPACE+".detgetWriter",detNum);
	}
	public int intDelete(int intNum) {
		System.out.println("여기오는지 체크하기ㅇㅇㅇㅇ");
		return session.delete(NAMESPACE+".intDelete",intNum);
	}
	
	public int detDelete(int detNum) {
		return session.delete(NAMESPACE+".detDelete",detNum);
	}
	public int intFileDelete(int intNum) {
		return session.delete(NAMESPACE+".intFileDelete",intNum);
	}
	public int detFileDelete(int detNum) {
		return session.delete(NAMESPACE+".detFileDelete",detNum);
	}
	public List<CommonFileVo> intFileDelList(int intNum){
		return session.selectList(NAMESPACE+".intFileDelList",intNum);
	}
	public List<CommonFileVo> detFileDelList(int detNum){
		return session.selectList(NAMESPACE+".detFileDelList",detNum);
	}
	public int intEdit(IntroduceVo vo) {
		return session.update(NAMESPACE+".intEdit",vo);
	}
	public int detEdit(EduDetailVo vo) {
		return session.update(NAMESPACE+".detEdit",vo);
	}
	public int fileDel(CommonFileVo vo) {
		return session.delete(NAMESPACE+".fileDel",vo);
	}
	public int detailCntUp(int intNum) {
		return session.update(NAMESPACE+".detailCntUp",intNum);
	}
	
	public int detaildetailCntUp(int detNum) {
		return session.update(NAMESPACE+".detaildetailCntUp",detNum);
	}

	
	public List<MemberVo> companymember(){
		return session.selectList(NAMESPACE+".companymember");
	}
	
}
