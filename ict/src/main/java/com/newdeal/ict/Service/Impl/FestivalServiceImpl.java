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

import com.newdeal.ict.Dao.FestivalDao;
import com.newdeal.ict.Service.FestivalService;
import com.newdeal.ict.Util.PageUtil;
import com.newdeal.ict.Vo.CommonFileVo;
import com.newdeal.ict.Vo.EduDetailVo;
import com.newdeal.ict.Vo.FesDetailVo;
import com.newdeal.ict.Vo.FestivalVo;
@Service
public class FestivalServiceImpl  implements FestivalService {
	@Autowired
	private FestivalDao dao;

	@Override
	public int fesWrite(FestivalVo vo) {
		return dao.fesWrite(vo);
	}
	
	public FestivalVo intNext(int fesNum) throws Exception {
		return dao.intNext(fesNum);
	}
	
	public FestivalVo intPrev(int fesNum) throws Exception {
		return dao.intPrev(fesNum);
	}

	@Override
	public HashMap<String, Object> list(HashMap<String, Object> map) throws Exception {
		int totalRowCount = dao.fesCnt(map);
		int pageNum=Integer.parseInt(map.get("pageNum").toString());
		PageUtil pu=new PageUtil(pageNum, 10, 10, totalRowCount);
		map.put("pu",pu);
		List<FestivalVo> list =dao.list(map);
		map.put("list", list);
		System.out.println("pu占쎄땀占쎌뒠====>"+pu.toString());
		
		return map;
	}

	@Override
	public int fesCnt(HashMap<String, Object> map) throws Exception {
		
		return dao.fesCnt(map);
	}
	
	@Override
	public int detCnt(HashMap<String, Object> map) throws Exception {
		
		return dao.detCnt(map);
	}


	@Override
	public int intfileWrite(List<MultipartFile> filelist, int num) throws Exception {
		InputStream is = null;
		FileOutputStream fos = null;
		String filePath="C:\\Users\\git";
		CommonFileVo filevo=new CommonFileVo();
		try {
			if(filelist.size()>1) {
			for(int i=0;i<filelist.size();i++) {
				is=filelist.get(i).getInputStream();
				UUID uuid=UUID.randomUUID();
				String fileOrgName=filelist.get(i).getOriginalFilename();
				String fileName=uuid+"_"+fileOrgName;
				String fileSize=filevo.byteCalculation(String.valueOf(filelist.get(i).getSize()));
				filevo.setFileName(fileName);
				filevo.setFileSize(fileSize);
				filevo.setFileOrgName(fileOrgName);
				filevo.setFilePath(filePath);
				filevo.setFileRefNum(dao.fesmaxNum());
				dao.intfileWrite(filevo);
				fos=new FileOutputStream(filePath+"\\"+fileName);
				FileCopyUtils.copy(is, fos);
				
				fos.close();
				is.close();
				}
			}
		}finally {
			
		}
		return 0;
	}

	@Override
	public FestivalVo fesDetail(int fesNum) throws Exception {
		dao.detailCntUp(fesNum);
		System.out.println("==============>dao.detailCntUp(fesNum) :" + fesNum);
		return dao.fesDetail(fesNum);
	}
	
	@Override
	public int fesmaxNum() throws Exception {
		return dao.fesmaxNum();
	}
	
	@Override
	public CommonFileVo fileinfo(CommonFileVo filevo) throws Exception {
		return dao.fileinfo(filevo);
	}

	@Override
	public FestivalVo getWriter(int fesNum) throws Exception {
		return dao.getWriter(fesNum);
	}

	@Override
	public int fesDelete(int fesNum) throws Exception {

		List<CommonFileVo> filelist = dao.intFileDelList(fesNum);
		System.out.println("占쎈솁占쎌뵬�뵳�딅뮞占쎈뱜�빊�뮆�젾"+filelist.toString());
		for(CommonFileVo vo:filelist) {
			String files=vo.getFilePath()+vo.getFileName();
			System.out.println("占쎈솁占쎌뵬占쎈탵占쎌젂占쎈꽅�뵳占�+占쎈솁占쎌뵬占쎌뵠�뵳占� �빊�뮆�젾占쎈퉸癰귣떯由�"+files);
			File file=new File(vo.getFilePath()+"\\"+vo.getFileName());
			if( file.exists() ){
	            if(file.delete()){
	                System.out.println("占쎈솁占쎌뵬占쎄텣占쎌젫 占쎄쉐�⑨옙");
	            }else{
	                System.out.println("占쎈솁占쎌뵬占쎄텣占쎌젫 占쎈뼄占쎈솭");
	            }
	        }else{
	            System.out.println("占쎈솁占쎌뵬占쎌뵠 鈺곕똻�삺占쎈릭筌욑옙 占쎈륫占쎈뮸占쎈빍占쎈뼄.");
	        }
		//	dao.intFileDelete(fesNum);
			dao.fesDelete(fesNum);
			 System.out.println("占쎌뿫占쎈탣占쎈퓠占쎄퐣占쎈즲占쎄텣占쎌젫 占쎄쉐�⑨옙 :"+dao.fesDelete(fesNum));
		}
		dao.intFileDelete(fesNum);
		dao.fesDelete(fesNum);
	return 0;
	}

	@Override
	public int fesEdit(FestivalVo vo) throws Exception {
		return dao.fesEdit(vo);
	}

	@Override
	public int fileDel(CommonFileVo filevo) throws Exception {
		CommonFileVo vo=dao.fileinfo(filevo);
		File file=new File(vo.getFilePath()+"\\"+vo.getFileName());
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
	public int detailWrite(FesDetailVo vo) throws Exception {
		return dao.detailWrite(vo);
	}
	
	@Override
	public HashMap<String, Object> detailList(HashMap<String, Object> map) throws Exception {
		int totalRowCount = dao.detCnt(map);
		System.out.println("totalRowCount :" + totalRowCount);
		int pageNum=Integer.parseInt(map.get("pageNum").toString());
		PageUtil pu=new PageUtil(pageNum, 10, 10, totalRowCount);
		map.put("pu",pu);
		System.out.println("pu : " + pu);
		List<FesDetailVo> list =dao.detailList(map);
		map.put("list", list);
		return map;
	}

	@Override
	public FesDetailVo getWriterD(int detNum) throws Exception {
		return dao.getWriterD(detNum);
	}

	@Override
	public FesDetailVo detDetail(int detNum) throws Exception {
		dao.DeldetailCntUp(detNum);
		System.out.println("==============>dao.DeldetailCntUp(detNum) :" +detNum);
		return dao.detDetail(detNum);
	}

	@Override
	public int detEdit(FesDetailVo vo) throws Exception {
		return dao.detEdit(vo);
	}

	@Override
	public FesDetailVo detPrev(int detNum) throws Exception {
		return dao.detPrev(detNum);
	}

	@Override
	public FesDetailVo detNext(int detNum) throws Exception {
		return dao.detNext(detNum);
	}

	@Override
	public int detDelete(int detNum) throws Exception {
		System.out.println("여기");
		List<CommonFileVo> filelist = dao.detFileDelList(detNum);
		System.out.println("서비스임플에서찍어보기 ==>"+filelist.toString());
		
		for(CommonFileVo vo:filelist) {
			String files=vo.getFilePath()+vo.getFileName();
			System.out.println("ㄱㄱㄱㅁㅁㅁㅁㅁㅁ"+files);
			File file=new File(vo.getFilePath()+"\\"+vo.getFileName());
			if( file.exists() ){
	            if(file.delete()){
	                System.out.println("파일삭제");
	            }else{
	                System.out.println("파일삭제안함");
	            }
	        }else{
	            System.out.println("파일이 존재하지 않을경우.");
	        }
			dao.intFileDelete(detNum);
			dao.fesDelete(detNum);
			System.out.println("임플부분에서 1번");
			dao.detDelete(detNum);
			System.out.println("임플부분에서 2번");
			
		}
		dao.intFileDelete(detNum);
		System.out.println("detNum :"+detNum);
		dao.detDelete(detNum );
		System.out.println("detNum :"+detNum);
	return 0;
	}


	@Override
	public List<FesDetailVo> detPart() throws Exception {
		return dao.detPart();
	}
	
}
