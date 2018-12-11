package com.newdeal.ict.Service.Impl;


import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.newdeal.ict.Dao.EduDao;
import com.newdeal.ict.Service.EduService;
import com.newdeal.ict.Util.PageUtil;
import com.newdeal.ict.Vo.CommonFileVo;
import com.newdeal.ict.Vo.EduDetailVo;
import com.newdeal.ict.Vo.IntDetailJoinVo;
import com.newdeal.ict.Vo.IntroduceVo;
import com.newdeal.ict.Vo.MemberVo;

@Service
public class EduServiceImpl implements EduService{
	@Autowired
	private EduDao dao;

	@Override
	public int intWrite(IntroduceVo vo) throws Exception {
		
		return dao.intWrite(vo);
	}
	
	@Override
	public int detWrite(EduDetailVo vo) throws Exception {
		
		return dao.detWrite(vo);
	}


	@Override
	public int intmaxNum() throws Exception {
		
		return dao.intmaxNum();
	}
	
	@Override
	public int detmaxNum() throws Exception {
		
		return dao.detmaxNum();
	}

	@Override
	public HashMap<String, Object> intList(HashMap<String, Object> map) throws Exception {
		int totalRowCount = dao.intCnt(map);
		int pageNum=Integer.parseInt(map.get("pageNum").toString());
		PageUtil pu=new PageUtil(pageNum, 10, 10, totalRowCount);
		map.put("pu",pu);
		List<IntroduceVo> list =dao.intList(map);
		map.put("list", list);
		return map;
	}
	
	@Override
	public HashMap<String, Object> detList(HashMap<String, Object> map) throws Exception {
		int totalRowCount = dao.detCnt(map);
		int pageNum=Integer.parseInt(map.get("pageNum").toString());
		PageUtil pu=new PageUtil(pageNum, 10, 10, totalRowCount);
		map.put("pu",pu);
		List<EduDetailVo> list =dao.detList(map);
		map.put("list", list);
		return map;
	}
	
	

	@Override
	public int intCnt(HashMap<String, Object> map) throws Exception {
		
		return dao.intCnt(map);
	}
	
	@Override
	public int detCnt(HashMap<String, Object> map) throws Exception {
		
		return dao.detCnt(map);
	}

	@Override
	public IntDetailJoinVo intDetail(int intNum) throws Exception {
		dao.detailCntUp(intNum);
		return dao.intDetail(intNum);
	}
	
	@Override
	public EduDetailVo detDetail(int detNum) throws Exception {
		dao.detaildetailCntUp(detNum);
		return dao.detDetail(detNum);
	}
	
	public IntDetailJoinVo intNext(int intNum) throws Exception {
		return dao.intNext(intNum);
	}
	
	public IntDetailJoinVo intPrev(int intNum) throws Exception {
		return dao.intPrev(intNum);
	}
	
	public EduDetailVo detNext(int detNum) throws Exception {
		return dao.detNext(detNum);
	}
	
	public EduDetailVo detPrev(int detNum) throws Exception {
		return dao.detPrev(detNum);
	}

	@Override
	public CommonFileVo fileinfo(CommonFileVo filevo) throws Exception {
		return dao.fileinfo(filevo);
	}

	@Override
	public IntroduceVo getWriter(int intNum) throws Exception {
		return dao.getWriter(intNum);
	}
	
	@Override
	public EduDetailVo detgetWriter(int detNum) throws Exception {
		return dao.detgetWriter(detNum);
	}

	@Override
	public int intDelete(int intNum) throws Exception {
		System.out.println("여기는오는지????");
			List<CommonFileVo> filelist = dao.intFileDelList(intNum);
			if(filelist.size()>0) {
			for(CommonFileVo vo:filelist) {
				String files=vo.getFilePath()+vo.getFileName();
				File file=new File(vo.getFilePath()+"/"+vo.getFileName());
				if( file.exists() ){
		            if(file.delete()){
		                dao.intFileDelete(intNum);
		            }else{
		            	System.out.println("파일삭제실패");
		            }
		            
		        }else{
		        }
				

			}
			}
			dao.intDelete(intNum);
		return 0;
	}
	
	@Override
	public int detDelete(int detNum) throws Exception {
		System.out.println("여기는오는지????");
			List<CommonFileVo> filelist = dao.detFileDelList(detNum);
			System.out.println("�뙆�씪由ъ뒪�듃異쒕젰"+filelist.toString());
			if(filelist.size()>0) {
			for(CommonFileVo vo:filelist) {
				String files=vo.getFilePath()+vo.getFileName();
				System.out.println("�뙆�씪�뵒�젆�넗由�+�뙆�씪�씠由� 異쒕젰�빐蹂닿린"+files);
				File file=new File(vo.getFilePath()+"\\"+vo.getFileName());
				if( file.exists() ){
		            if(file.delete()){
		                dao.detFileDelete(detNum);
		            }else{
		            	System.out.println("파일삭제실패");
		            }
		            
		        }else{
		        }
				

			}
			}
			dao.detDelete(detNum);
		return 0;
	}

	@Override
	public int intEdit(IntroduceVo vo) throws Exception {
		
		return dao.intEdit(vo);
	}
	
	@Override
	public int detEdit(EduDetailVo vo) throws Exception {
		
		return dao.detEdit(vo);
	}

	@Override
	public int fileDel(CommonFileVo filevo) throws Exception {
		
		CommonFileVo vo=dao.fileinfo(filevo);
		File file=new File(vo.getFilePath()+"/"+vo.getFileName());
		if( file.exists() ){
            if(file.delete()){
                System.out.println("�뙆�씪�"
                		+ "궘�젣 �꽦怨�");
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
	public List<MemberVo> companymember() throws Exception {
		return dao.companymember();
	}
	
	

	

}
