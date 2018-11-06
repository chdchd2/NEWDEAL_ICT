<%@page import="com.newdeal.ict.Vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="../../error/interror.jsp"
	%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	
	MemberVo vo = (MemberVo) session.getAttribute("member");

	if (!(vo.getMemGrade() == 2)) {
%>
<script>
	alert("기업회원만 글쓰기가 가능합니다");
	history.back();
</script>
<%
	}
%>

교육신청안내게시판 글쓰기페이지
<form action="<c:url value='/edu/intWrite'/>" method="POST" enctype="multipart/form-data">
	<table border="1">
		<tr>
			<td>제목 : <input type="text" name="intTitle" id="title">
		</tr>
		<tr>
			<td>내용:<textarea rows="" cols="" id="content" name="intContent"></textarea></td>
		</tr>
		<tr>
			<td>작성자 : <input type="text" id="writer" name="intWriter" value="${member.memNickName }"></td>
		</tr>
		<tr>
			<td>첨부파일: <input type="file" multiple="multiple" name="file">
		</tr>
	</table>
		<input type="hidden" name="memNum" value="${member.memNum }">
		<input type="submit" value="글작성하기">
</form>
