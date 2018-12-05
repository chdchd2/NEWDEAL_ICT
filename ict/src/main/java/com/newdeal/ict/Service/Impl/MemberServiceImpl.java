package com.newdeal.ict.Service.Impl;


import java.util.HashMap;
import java.util.List;

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
	@Override
	public int signin(MemberVo vo) throws Exception {
		return dao.signin(vo);
	}
	@Override
	public boolean nickNameChk(String nickname) throws Exception {
		boolean able=true;
		String yn =dao.nickNameChk(nickname);
		if(yn!=null) {
			if(yn.equals(nickname)) {
				System.out.println("입력값===>"+nickname);
				able=false;
			}
		}
		System.out.println("입력값2==>"+nickname);
		return able;
	}
	@Override
	public int companysignin(MemberVo vo) throws Exception {
		return dao.companysignin(vo);
	}
	@Override
	public MemberVo iscompanymember(MemberVo vo) throws Exception {
		return dao.iscompanymember(vo);
	}

}
