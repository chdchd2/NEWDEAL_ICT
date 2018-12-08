package com.newdeal.ict.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newdeal.ict.Dao.MainDao;
import com.newdeal.ict.Service.MainService;
import com.newdeal.ict.Vo.EduDetailVo;
import com.newdeal.ict.Vo.FestivalVo;
import com.newdeal.ict.Vo.IntroduceVo;
import com.newdeal.ict.Vo.LinkListVo;
import com.newdeal.ict.Vo.NoticeVo;
@Service
public class MainServiceImpl implements MainService{
@Autowired
private MainDao dao;

@Override
public List<LinkListVo> linklist() throws Exception {
	return dao.linklist();
}

public List<NoticeVo> noticelist() throws Exception {
	return dao.noticelist();
}

@Override
public List<FestivalVo> festivallist() throws Exception {
	return dao.festivallist();
}

@Override
public List<IntroduceVo> intlist() throws Exception {
	return dao.intlist();
}

@Override
public List<EduDetailVo> detlist() throws Exception {
	return dao.detlist();
}
}
