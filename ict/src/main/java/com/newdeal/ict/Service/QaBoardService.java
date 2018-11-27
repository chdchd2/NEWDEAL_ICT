package com.newdeal.ict.Service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.newdeal.ict.Vo.CommonFileVo;
import com.newdeal.ict.Vo.QaBoardVo;

public interface QaBoardService {
	public void create(QaBoardVo vo) throws Exception;
	public QaBoardVo read(int qaNum) throws Exception;
	public void update(QaBoardVo vo) throws Exception;
	public void delete(int qaNum) throws Exception;
	public List<QaBoardVo> listAll(
			int start, int end, String search_option,
			String keyword) throws Exception;
	public void increaseViewcnt(
			int qaNum, HttpSession session) throws Exception;
	public int countArticle(String search_option,
			String keyword) throws Exception;
	public int qafileWrite(List<MultipartFile> filelist,int num) throws Exception;
	public int qamaxNum() throws Exception;
	public CommonFileVo fileinfo(CommonFileVo filevo) throws Exception;
	public int fileDel(CommonFileVo filevo) throws Exception;
	public int qaCnt() throws Exception;
	public int insertReply(QaBoardVo vo) throws Exception;
}
