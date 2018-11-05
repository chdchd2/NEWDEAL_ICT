<%@page import="com.newdeal.ict.Vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberVo vo=(MemberVo)session.getAttribute("member");
System.out.println(vo.getMemNickName());
if(!(vo.getMemNickName()=="유니에스"&&vo.getMemNickName()=="KSA")){
	%>
	<script>
	alert("${member.getNickName}");
	alert("기업회원만 글쓰기가 가능합니다");
	history.back();
	</script>
	<% 
}else{
	
}
%>
    교육신청안내게시판 글쓰기페이지
    <form>
    <table border="1">
    <tr>
    <td>작성자 : <input type="text" value="${vo.getNickName }"></td>
    </tr>
    </table>
    </form>