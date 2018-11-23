package com.newdeal.ict.Dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.newdeal.ict.Vo.CommonFileVo;



@Repository
public class CommonDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "mybatis.mapper.CommonMapper";
	
	public int fileWrite(CommonFileVo vo) {
		return session.insert(NAMESPACE+".fileWrite",vo);
	}

}
