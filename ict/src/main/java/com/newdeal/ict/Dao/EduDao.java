package com.newdeal.ict.Dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newdeal.ict.Vo.CommonFileVo;
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
	
}
