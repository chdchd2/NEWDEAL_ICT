package com.newdeal.ict.Service;

import java.util.HashMap;

import com.newdeal.ict.Vo.MemberVo;

public interface MemberService {
	public MemberVo ismember(HashMap<String, Object> map) throws Exception;
	public int signin(MemberVo vo) throws Exception;
}
