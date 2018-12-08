package com.newdeal.ict.Service.Impl;


import java.io.File;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newdeal.ict.Dao.ReviewDao;
import com.newdeal.ict.Service.ReviewService;
import com.newdeal.ict.Util.PageUtil;
import com.newdeal.ict.Vo.CommentVo;
import com.newdeal.ict.Vo.CommonFileVo;
import com.newdeal.ict.Vo.ReviewVo;

@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private ReviewDao dao;

	@Override
	public int rvWrite(ReviewVo vo) throws Exception {
		
		return dao.rvWrite(vo);
	}
	
	@Override
	public int rvmaxNum() throws Exception {
		
		return dao.rvmaxNum();
	}

	@Override
	public HashMap<String, Object> rvList(HashMap<String, Object> map) throws Exception {
		int totalRowCount = dao.rvCnt(map);
		int pageNum=Integer.parseInt(map.get("pageNum").toString());
		PageUtil pu=new PageUtil(pageNum, 10, 10, totalRowCount);
		map.put("pu",pu);
		List<ReviewVo> list =dao.rvList(map);
		map.put("list", list);
		return map;
	}
	
	@Override
	public int rvCnt(HashMap<String, Object> map) throws Exception {
		
		return dao.rvCnt(map);
	}
	
	@Override
	public ReviewVo rvDetail(int rvNum) throws Exception {
		dao.rvCntUp(rvNum);
		return dao.rvDetail(rvNum);
	}

	public ReviewVo rvNext(int rvNum) throws Exception {
		return dao.rvNext(rvNum);
	}
	
	public ReviewVo rvPrev(int rvNum) throws Exception {
		return dao.rvPrev(rvNum);
	}

	@Override
	public CommonFileVo fileinfo(CommonFileVo filevo) throws Exception {
		return dao.fileinfo(filevo);
	}

	@Override
	public ReviewVo rvgetWriter(int rvNum) throws Exception {
		return dao.rvgetWriter(rvNum);
	}

	@Override
	public int rvDelete(int rvNum) throws Exception {
		System.out.println("여기는오는지????");
			List<CommonFileVo> filelist = dao.rvFileDelList(rvNum);
			System.out.println("�뙆�씪由ъ뒪�듃異쒕젰"+filelist.toString());
			if(filelist.size()>0) {
			for(CommonFileVo vo:filelist) {
				String files=vo.getFilePath()+vo.getFileName();
				System.out.println("�뙆�씪�뵒�젆�넗由�+�뙆�씪�씠由� 異쒕젰�빐蹂닿린"+files);
				File file=new File(vo.getFilePath()+"\\"+vo.getFileName());
				if( file.exists() ){
		            if(file.delete()){
		                dao.rvFileDelete(rvNum);
		            }else{
		            	System.out.println("파일삭제실패");
		            }
		            
		        }else{
		        }
				

			}
			}
			dao.rvDelete(rvNum);
		return 0;
	}
	
	@Override
	public int rvEdit(ReviewVo vo) throws Exception {
		
		return dao.rvEdit(vo);
	}

	@Override
	public int fileDel(CommonFileVo filevo) throws Exception {
		
		CommonFileVo vo=dao.fileinfo(filevo);
		File file=new File(vo.getFilePath()+"\\"+vo.getFileName());
		if( file.exists() ){
            if(file.delete()){
                System.out.println("�뙆�씪�궘�젣 �꽦怨�");
                dao.fileDel(filevo);
            }else{
                System.out.println("�뙆�씪�궘�젣 �떎�뙣");
            }
        }else{
            System.out.println("�뙆�씪�씠 議댁옱�븯吏� �븡�뒿�땲�떎.");
        }
		return 1;
	}

	@Override
	public List<ReviewVo> rvPart() throws Exception {
		return dao.rvPart();
	}

	@Override
	public int comment(CommentVo vo) throws Exception {
	
		return dao.comment(vo);
	}

	@Override
	public List<CommentVo> commentList(int rvNum) throws Exception {
		return dao.commentList(rvNum);
	}

	@Override
	public int comDel(int comNum) throws Exception {
		return dao.comDel(comNum);
	}

	

}
