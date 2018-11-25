package com.newdeal.ict.Service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.newdeal.ict.Vo.CommentVo;
import com.newdeal.ict.Vo.CommonFileVo;
import com.newdeal.ict.Vo.FreeBoardVo;

public interface FreeBoardService {
	//CRUD(Create, Read, Update, Delete)
	public void create(FreeBoardVo vo) throws Exception;//湲��벐湲�
	public FreeBoardVo read(int fbNum) throws Exception;
	public void update(FreeBoardVo vo) throws Exception;
	public void delete(int fbNum) throws Exception;//湲��궘�젣
	public List<FreeBoardVo> listAll(
			int start, int end, String search_option,
			String keyword) throws Exception;//湲�紐⑸줉
	public void increaseViewcnt(
			int fbNum, HttpSession session) throws Exception;//議고쉶�닔利앷�
	public int countArticle(String search_option,
			String keyword) throws Exception;
	public int fbfileWrite(List<MultipartFile> filelist,int num) throws Exception;
	public int fbmaxNum() throws Exception;
	public CommonFileVo fileinfo(CommonFileVo filevo) throws Exception;
	public int fileDel(CommonFileVo filevo) throws Exception;
	public int fbCnt() throws Exception;
	public int comment(CommentVo vo) throws Exception;
	public List<CommentVo> commentList() throws Exception;
}
