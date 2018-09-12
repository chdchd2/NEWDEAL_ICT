package com.newdeal.ict.Dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newdeal.ict.Vo.MemberVo;

@Repository
public class MemberDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "mybatis.mapper.MemberMapper";
	
	public MemberVo ismember(HashMap<String, Object> map) {
		return session.selectOne(NAMESPACE+".ismember",map);
	}
	
}
