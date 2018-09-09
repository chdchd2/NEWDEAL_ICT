package com.newdeal.ict.Service;

import java.util.List;

import com.newdeal.ict.Vo.TestVo;

public interface TestService {
	public int write(TestVo vo) throws Exception;
	public List<TestVo> list() throws Exception;
}
