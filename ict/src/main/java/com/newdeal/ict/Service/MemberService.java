package com.newdeal.ict.Service;

import java.util.HashMap;

import com.newdeal.ict.Vo.MemberVo;

public interface MemberService {
	public MemberVo ismember(HashMap<String, Object> map) throws Exception;
	public int signin(MemberVo vo) throws Exception;
	public int companysignin(MemberVo vo) throws Exception;
	public boolean nickNameChk(String nickname) throws Exception;
	public MemberVo iscompanymember(MemberVo vo) throws Exception;
}
