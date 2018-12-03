package com.newdeal.ict.Service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.newdeal.ict.Vo.CommentVo;
import com.newdeal.ict.Vo.CommonFileVo;
import com.newdeal.ict.Vo.FreeBoardVo;

public interface FreeBoardService {
	//CRUD(Create, Read, Update, Delete)
	public void create(FreeBoardVo vo) throws Exception;
	public FreeBoardVo read(int fbNum) throws Exception;
	public FreeBoardVo fbPrev(int fbNum) throws Exception;
	public FreeBoardVo fbNext(int fbNum) throws Exception;
	public void update(FreeBoardVo vo) throws Exception;
	public void delete(int fbNum) throws Exception;
	public List<FreeBoardVo> listAll(
			int start, int end, String search_option,
			String keyword) throws Exception;
	public void increaseViewcnt(
			int fbNum, HttpSession session) throws Exception;
	public int countArticle(String search_option,
			String keyword) throws Exception;
	/*public int fbfileWrite(List<MultipartFile> filelist,int num) throws Exception;*/
	public int fbmaxNum() throws Exception;
	public CommonFileVo fileinfo(CommonFileVo filevo) throws Exception;
	public int fileDel(CommonFileVo filevo) throws Exception;
	public int fbCnt() throws Exception;
	public int comment(CommentVo vo) throws Exception;
	public List<CommentVo> commentList(int fbNum) throws Exception;
	public void comUpdate(CommentVo vo) throws Exception;
	public void comDel(int comNum) throws Exception;
}
