package com.newdeal.ict.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newdeal.ict.Dao.AdminDao;
import com.newdeal.ict.Service.AdminService;
import com.newdeal.ict.Vo.LinkListVo;
import com.newdeal.ict.Vo.MemberVo;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDao dao;

	@Override
	public List<MemberVo> memberList() throws Exception {
		return dao.memberList();
	}

	@Override
	public int memGrade(MemberVo vo) throws Exception {
		return dao.memGrade(vo);
	}

	@Override
	public int memState(MemberVo vo) throws Exception {
		return dao.memState(vo);
	}

	@Override
	public List<LinkListVo> linklist() throws Exception {
		return dao.linklist();
	}

	@Override
	public int dellink(int linkNum) throws Exception {
		return dao.dellink(linkNum);
	}

	@Override
	public int linkadd(LinkListVo vo) throws Exception {
		return dao.linkadd(vo);
	}



	

	

	

}
