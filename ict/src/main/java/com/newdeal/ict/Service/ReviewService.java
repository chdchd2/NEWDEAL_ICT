package com.newdeal.ict.Service;


import java.util.HashMap;
import java.util.List;

import com.newdeal.ict.Vo.CommentVo;
import com.newdeal.ict.Vo.CommonFileVo;
import com.newdeal.ict.Vo.ReviewVo;

public interface ReviewService {
	public int rvWrite(ReviewVo vo) throws Exception;
	public int rvmaxNum() throws Exception;
	public HashMap<String, Object> rvList(HashMap<String, Object> map) throws Exception;
	public int rvCnt(HashMap<String, Object> map) throws Exception;
	public ReviewVo rvDetail(int rvNum) throws Exception;
	public ReviewVo rvPrev(int rvNum) throws Exception;
	public ReviewVo rvNext(int rvNum) throws Exception;
	public CommonFileVo fileinfo(CommonFileVo filevo) throws Exception;
	public ReviewVo rvgetWriter(int rvNum) throws Exception;
	public int rvDelete(int rvNum) throws Exception;
	public int rvEdit(ReviewVo vo) throws Exception;
	public int fileDel(CommonFileVo filevo) throws Exception;
	public List<ReviewVo> rvPart()throws Exception;
	public int comment(CommentVo vo) throws Exception;
	public List<CommentVo> commentList(int rvNum) throws Exception;
/*	public void comUpdate(CommentVo vo) throws Exception;*/
	public int comDel(int comNum) throws Exception;
 
}
 