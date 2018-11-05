package com.newdeal.ict.Service;


import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.newdeal.ict.Util.PageUtil;
import com.newdeal.ict.Vo.IntroduceVo;

public interface EduService {
	public int intWrite(IntroduceVo vo) throws Exception;
	public int intfileWrite(List<MultipartFile> filelist,int num) throws Exception;
	public int intmaxNum() throws Exception;
	public List<IntroduceVo> intList(PageUtil vo) throws Exception;
	public int intCnt() throws Exception;
	
}
