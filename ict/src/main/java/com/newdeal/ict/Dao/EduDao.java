package com.newdeal.ict.Dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class EduDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "mybatis.mapper.EduMapper";
	
	
	
}
