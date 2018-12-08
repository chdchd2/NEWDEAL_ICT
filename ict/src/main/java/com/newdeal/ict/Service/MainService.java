package com.newdeal.ict.Service;

import java.util.List;

import com.newdeal.ict.Vo.EduDetailVo;
import com.newdeal.ict.Vo.FestivalVo;
import com.newdeal.ict.Vo.IntroduceVo;
import com.newdeal.ict.Vo.LinkListVo;
import com.newdeal.ict.Vo.NoticeVo;

public interface MainService {

	public List<LinkListVo> linklist() throws Exception;
	public List<NoticeVo> noticelist() throws Exception;
	public List<FestivalVo> festivallist() throws Exception;
	public List<IntroduceVo> intlist() throws Exception;
	public List<EduDetailVo> detlist() throws Exception;
}
