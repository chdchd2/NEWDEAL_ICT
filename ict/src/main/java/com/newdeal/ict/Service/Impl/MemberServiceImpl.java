package com.newdeal.ict.Service.Impl;


import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newdeal.ict.Dao.MemberDao;
import com.newdeal.ict.Service.MemberService;
import com.newdeal.ict.Vo.MemberVo;
@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao dao;
	@Override
	public MemberVo ismember(HashMap<String, Object> map) throws Exception {
	
		return dao.ismember(map);
	}

}
