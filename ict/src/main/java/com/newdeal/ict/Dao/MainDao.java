package com.newdeal.ict.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newdeal.ict.Vo.EduDetailVo;
import com.newdeal.ict.Vo.FestivalVo;
import com.newdeal.ict.Vo.IntroduceVo;
import com.newdeal.ict.Vo.LinkListVo;
import com.newdeal.ict.Vo.NoticeVo;

@Repository
public class MainDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "mybatis.mapper.MainMapper";
	
	public List<LinkListVo> linklist(){
		return session.selectList(NAMESPACE+".linklist");
	}
	
	public List<NoticeVo> noticelist(){
		return session.selectList(NAMESPACE+".noticelist");
	}
	
	public List<FestivalVo> festivallist(){
		return session.selectList(NAMESPACE+".festivallist");
	}
	
	public List<IntroduceVo> intlist(){
		return session.selectList(NAMESPACE+".intlist");
	}
	
	public List<EduDetailVo> detlist(){
		return session.selectList(NAMESPACE+".detlist");
	}
}
