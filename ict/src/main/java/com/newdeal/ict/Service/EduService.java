package com.newdeal.ict.Service;


import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.newdeal.ict.Vo.CommonFileVo;
import com.newdeal.ict.Vo.EduDetailVo;
import com.newdeal.ict.Vo.IntDetailJoinVo;
import com.newdeal.ict.Vo.IntroduceVo;

public interface EduService {
	public int intWrite(IntroduceVo vo) throws Exception;
	public int intmaxNum() throws Exception;
	public HashMap<String, Object> intList(int pageNum) throws Exception;
	public HashMap<String, Object> detailList(int pageNum) throws Exception;
	public int intCnt() throws Exception;
	public IntDetailJoinVo intDetail(int intNum) throws Exception;
	public CommonFileVo fileinfo(CommonFileVo filevo) throws Exception;
	public IntroduceVo getWriter(int intNum) throws Exception;
	public int intDelete(int intNum) throws Exception;
	public int intEdit(IntroduceVo vo) throws Exception;
	public int fileDel(CommonFileVo filevo) throws Exception;
	public int detailWrite(EduDetailVo vo) throws Exception;
 
}
 