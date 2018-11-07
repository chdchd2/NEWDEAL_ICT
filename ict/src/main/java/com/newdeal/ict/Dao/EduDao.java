package com.newdeal.ict.Dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newdeal.ict.Util.PageUtil;
import com.newdeal.ict.Vo.CommonFileVo;
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
	public List<IntroduceVo> intList(PageUtil vo){
		return session.selectList(NAMESPACE+".intList",vo);
	}
	public int intCnt() {
		return session.selectOne(NAMESPACE+".intCnt");
	}
	public IntDetailJoinVo intDetail(int intNum) {
		return session.selectOne(NAMESPACE+".intDetail",intNum);
	}
	
}