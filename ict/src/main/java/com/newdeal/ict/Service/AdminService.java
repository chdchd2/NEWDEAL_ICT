package com.newdeal.ict.Service;

import java.util.List;

import com.newdeal.ict.Vo.LinkListVo;
import com.newdeal.ict.Vo.MemberVo;

public interface AdminService {
	public List<MemberVo> memberList() throws Exception;
	public int memGrade(MemberVo vo) throws Exception;
	public int memState(MemberVo vo) throws Exception;
	public List<LinkListVo> linklist() throws Exception;
	public int dellink(int linkNum) throws Exception;
	public int linkadd(LinkListVo vo)  throws Exception;
 
}
 