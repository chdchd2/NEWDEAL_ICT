package com.newdeal.ict.Service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.newdeal.ict.Vo.CommonFileVo;
import com.newdeal.ict.Vo.NoticeVo;
import com.newdeal.ict.Vo.QaBoardVo;

public interface QaBoardService {
	public void create(QaBoardVo vo) throws Exception;
	public QaBoardVo read(int qaNum) throws Exception;
	public QaBoardVo qaPrev(int qaNum) throws Exception;
	public QaBoardVo qaNext(int qaNum) throws Exception;
	public QaBoardVo view(int qaNum) throws Exception;
	public void update(QaBoardVo vo) throws Exception;
	public void delete(int qaNum) throws Exception;
	public List<QaBoardVo> listAll(
			int start, int end, String search_option,
			String keyword) throws Exception;
	public List<QaBoardVo> listAll() throws Exception;
	public void increaseViewcnt(
			int qaNum, HttpSession session) throws Exception;
	public int countArticle(String search_option,
			String keyword) throws Exception;
	public int qamaxNum() throws Exception;
	public CommonFileVo fileinfo(CommonFileVo filevo) throws Exception;
	public int fileDel(CommonFileVo filevo) throws Exception;
	public int qaCnt() throws Exception;
	public int answer(QaBoardVo vo) throws Exception;
}