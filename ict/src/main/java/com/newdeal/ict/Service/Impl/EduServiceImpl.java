package com.newdeal.ict.Service.Impl;


import java.util.HashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.newdeal.ict.Dao.EduDao;
import com.newdeal.ict.Service.EduService;

@Service
public class EduServiceImpl implements EduService{
	@Autowired
	private EduDao dao;

	

}
