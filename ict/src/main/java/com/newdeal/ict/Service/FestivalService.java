package com.newdeal.ict.Service;


import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.newdeal.ict.Vo.CommonFileVo;
import com.newdeal.ict.Vo.EduDetailVo;
import com.newdeal.ict.Vo.FesDetailVo;
import com.newdeal.ict.Vo.FestivalVo;
import com.newdeal.ict.Vo.IntDetailJoinVo;
import com.newdeal.ict.Vo.IntroduceVo;

public interface FestivalService {
	public int fesWrite(FestivalVo vo);
	public HashMap<String, Object> list(int pageNum) throws Exception;
	public int fesCnt() throws Exception;
	public int fesmaxNum() throws Exception;
	public int intfileWrite(List<MultipartFile> filelist, int num) throws Exception;
	public FesDetailVo fesDetail(int fesNum) throws Exception ;
	public CommonFileVo fileinfo(CommonFileVo filevo) throws Exception;
	public FesDetailVo getWriter(int fesNum) throws Exception;
	public int fesDelete(int fesNum) throws Exception;
	public int fesEdit(FestivalVo vo) throws Exception;
	public int fileDel(CommonFileVo filevo) throws Exception;
	public int detailWrite(FesDetailVo vo) throws Exception;
	public HashMap<String, Object> detailList(int pageNum) throws Exception;
	

}
