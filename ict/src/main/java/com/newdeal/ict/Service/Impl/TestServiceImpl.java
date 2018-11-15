package com.newdeal.ict.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newdeal.ict.Dao.TestDao;
import com.newdeal.ict.Service.TestService;
import com.newdeal.ict.Vo.TestVo;
@Service
public class TestServiceImpl implements TestService{
	@Autowired
	private TestDao dao;
	@Override
	public int write(TestVo vo) throws Exception {
		dao.write(vo);
		System.out.println("리턴값받을수있는지");
		return 1;
	}
	@Override
	public List<TestVo> list() throws Exception {
		return dao.list();
	}
	
	
	
}
