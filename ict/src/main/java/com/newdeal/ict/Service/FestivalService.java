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
	public HashMap<String, Object> list(HashMap<String, Object> map) throws Exception;
	public int fesCnt(HashMap<String, Object> map) throws Exception;
	public int fesmaxNum() throws Exception;
	public int intfileWrite(List<MultipartFile> filelist, int num) throws Exception;
	public FestivalVo fesDetail(int fesNum) throws Exception ;
	public CommonFileVo fileinfo(CommonFileVo filevo) throws Exception;
	public FestivalVo getWriter(int fesNum) throws Exception;
	public int fesDelete(int fesNum) throws Exception;
	public int fesEdit(FestivalVo vo) throws Exception;
	public int fileDel(CommonFileVo filevo) throws Exception;
	public int detailWrite(FesDetailVo vo) throws Exception;
	public HashMap<String, Object> detailList(int pageNum) throws Exception;
	public FestivalVo intPrev(int fesNum) throws Exception;
	public FestivalVo intNext(int fesNum) throws Exception;
	public FesDetailVo detPrev(int detNum) throws Exception;
	public FesDetailVo detNext(int detNum) throws Exception;
	public FesDetailVo detailWriter(int detNum)throws Exception ;
	public FesDetailVo detDetail(int detNum)throws Exception ;
	public int detEdit(FesDetailVo vo)throws Exception;

}
