package com.newdeal.ict.Dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class QaBoardDao {
	
	@Inject
	SqlSession sqlSession;
}
