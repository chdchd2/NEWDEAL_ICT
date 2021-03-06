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
		System.out.println("�뿬湲곕뒗�삤�뒗吏�????");
			List<CommonFileVo> filelist = dao.rvFileDelList(rvNum);
			System.out.println("占쎈솁占쎌뵬�뵳�딅뮞占쎈뱜�빊�뮆�젾"+filelist.toString());
			if(filelist.size()>0) {
			for(CommonFileVo vo:filelist) {
				String files=vo.getFilePath()+vo.getFileName();
				System.out.println("占쎈솁占쎌뵬占쎈탵占쎌젂占쎈꽅�뵳占�+占쎈솁占쎌뵬占쎌뵠�뵳占� �빊�뮆�젾占쎈퉸癰귣떯由�"+files);
				File file=new File(vo.getFilePath()+"/"+vo.getFileName());
				if( file.exists() ){
		            if(file.delete()){
		             
		            }else{
		            	System.out.println("�뙆�씪�궘�젣�떎�뙣");
		            }
		            
		        }else{
		        }
				   dao.rvFileDelete(rvNum);

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
		File file=new File(vo.getFilePath()+"/"+vo.getFileName());
		if( file.exists() ){
            if(file.delete()){
                System.out.println("占쎈솁占쎌뵬占쎄텣占쎌젫 占쎄쉐�⑨옙");
                dao.fileDel(filevo);
            }else{
                System.out.println("占쎈솁占쎌뵬占쎄텣占쎌젫 占쎈뼄占쎈솭");
            }
        }else{
            System.out.println("占쎈솁占쎌뵬占쎌뵠 鈺곕똻�삺占쎈릭筌욑옙 占쎈륫占쎈뮸占쎈빍占쎈뼄.");
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
