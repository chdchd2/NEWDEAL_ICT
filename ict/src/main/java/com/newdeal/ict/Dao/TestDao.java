package com.newdeal.ict.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newdeal.ict.Vo.TestVo;



@Repository
public class TestDao {
@Autowired private SqlSession session;
	
	private final String NAMESPACE = "mybatis.TestMapper";
	
	public int write(TestVo vo){
		session.insert(NAMESPACE+".write",vo);
		return 1;
	}
	
	public List<TestVo> list(){
		return session.selectList(NAMESPACE+".list");
		
	}
	
}
