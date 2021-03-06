package com.newdeal.ict.Dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newdeal.ict.Vo.LinkListVo;
import com.newdeal.ict.Vo.MemberVo;





@Repository
public class AdminDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "mybatis.mapper.AdminMapper";
	
	
	public List<MemberVo> memberList() {
		return session.selectList(NAMESPACE+".memberList");
	}
	
	public int memGrade(MemberVo vo) {
		return session.update(NAMESPACE+".memGrade",vo);
	}
	
	public int memState(MemberVo vo) {
		return session.update(NAMESPACE+".memState",vo);
	}
	public List<LinkListVo> linklist(){
		return session.selectList(NAMESPACE+".linklist");
	}
	public int dellink(int linkNum) {
		return session.delete(NAMESPACE+".dellink",linkNum);
	}
	
	public int linkadd(LinkListVo vo) {
		return session.insert(NAMESPACE+".linkadd",vo);
	}
}
