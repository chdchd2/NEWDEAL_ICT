package com.newdeal.ict.Service;


import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.newdeal.ict.Vo.CommonFileVo;
import com.newdeal.ict.Vo.EduDetailVo;
import com.newdeal.ict.Vo.IntDetailJoinVo;
import com.newdeal.ict.Vo.IntroduceVo;
import com.newdeal.ict.Vo.MemberVo;

public interface EduService {
	public int intWrite(IntroduceVo vo) throws Exception;
	public int detWrite(EduDetailVo vo) throws Exception;
	public int intmaxNum() throws Exception;
	public int detmaxNum() throws Exception;
	public HashMap<String, Object> intList(HashMap<String, Object> map) throws Exception;
	public HashMap<String, Object> detList(HashMap<String, Object> map) throws Exception;
	public int intCnt(HashMap<String, Object> map) throws Exception;
	public int detCnt(HashMap<String, Object> map) throws Exception;
	public IntDetailJoinVo intDetail(int intNum) throws Exception;
	public IntDetailJoinVo intPrev(int intNum) throws Exception;
	public IntDetailJoinVo intNext(int intNum) throws Exception;
	public EduDetailVo detDetail(int detNum) throws Exception;
	public EduDetailVo detPrev(int detNum) throws Exception;
	public EduDetailVo detNext(int detNum) throws Exception;
	public CommonFileVo fileinfo(CommonFileVo filevo) throws Exception;
	public IntroduceVo getWriter(int intNum) throws Exception;
	public EduDetailVo detgetWriter(int detNum) throws Exception;
	public int intDelete(int intNum) throws Exception;
	public int detDelete(int detNum) throws Exception;
	public int intEdit(IntroduceVo vo) throws Exception;
	public int detEdit(EduDetailVo vo) throws Exception;
	public int fileDel(CommonFileVo filevo) throws Exception;
	public List<MemberVo> companymember() throws Exception;
 
}
 