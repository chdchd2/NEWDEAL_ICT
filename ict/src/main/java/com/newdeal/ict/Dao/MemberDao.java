package com.newdeal.ict.Dao;

import java.util.HashMap;
import java.util.List;

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
	public int signin(MemberVo vo) {
		return session.insert(NAMESPACE+".signin",vo);
	}
	public String nickNameChk(String nickname){
		return session.selectOne(NAMESPACE+".nickNameChk",nickname);
	}
	
}
