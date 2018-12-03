package com.newdeal.ict.Service.Impl;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.newdeal.ict.Dao.NoticeDao;
import com.newdeal.ict.Service.NoticeService;
import com.newdeal.ict.Vo.CommonFileVo;
import com.newdeal.ict.Vo.FreeBoardVo;
import com.newdeal.ict.Vo.NoticeVo;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Inject
	NoticeDao dao;

	@Transactional
	@Override
	public void create(NoticeVo vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public NoticeVo read(int ntNum) throws Exception {
		return dao.read(ntNum);
	}
	
	@Transactional//�듃�옖�옲�뀡泥섎━
	@Override
	public void update(NoticeVo vo) throws Exception {
		dao.update(vo);//board�뀒�씠釉� �닔�젙
	}

	public NoticeVo ntNext(int ntNum) throws Exception {
		return dao.ntNext(ntNum);
	}
	
	public NoticeVo ntPrev(int ntNum) throws Exception {
		return dao.ntPrev(ntNum);
	}

	@Override
	public void delete(int ntNum) throws Exception {
		dao.delete(ntNum);
	}

	@Override
	public List<NoticeVo> listAll(int start, int end, String search_option, String keyword) throws Exception {
		return dao.listAll(
				start, end, search_option, keyword);
	}

	@Override
	public void increaseViewcnt(int ntNum, HttpSession session) throws Exception {
		long update_time = 0;
		//�꽭�뀡�뿉 ���옣�맂 寃뚯떆臾쇱쓽 議고쉶�떆媛� 寃��깋
		if(session.getAttribute("update_time_"+ntNum)!=null){
			update_time=(Long)session.getAttribute(
					"update_time_"+ntNum);
		}
		//�쁽�옱 �떆媛�
		long current_time=System.currentTimeMillis();
		//�씪�젙 �떆媛꾩씠 寃쎄낵�맂 �썑 議고쉶�닔 利앷� 泥섎━
		if(current_time - update_time > 5*1000){
			dao.increaseViewcnt(ntNum);
			session.setAttribute(
					"update_time_"+ntNum, current_time);
		}
	}

	@Override
	public int countArticle(String search_option, String keyword) throws Exception {
		return dao.countArticle(search_option, keyword);
	}

	@Override
	public int ntmaxNum() throws Exception {
		return dao.ntmaxNum();
	}

	@Override
	public CommonFileVo fileinfo(CommonFileVo filevo) throws Exception {
		return dao.fileinfo(filevo);
	}

	@Override
	public int fileDel(CommonFileVo filevo) throws Exception {
		
		CommonFileVo vo=dao.fileinfo(filevo);
		File file=new File(vo.getFilePath()+"\\"+vo.getFileName());
		if( file.exists() ){
            if(file.delete()){
                System.out.println("파일삭제 성공");
                dao.fileDel(filevo);
            }else{
                System.out.println("파일삭제 실패");
            }
        }else{
            System.out.println("파일이 존재하지 않습니다.");
        }
		return 1;
	}

	@Override
	public int ntCnt() throws Exception {
		return dao.ntCnt();
	}

	

}
