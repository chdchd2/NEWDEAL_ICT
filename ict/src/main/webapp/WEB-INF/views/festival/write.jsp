<%@page import="com.newdeal.ict.Vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="../../error/interror.jsp"
	%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
 <script src="<c:url value='/resources/ckeditor/ckeditor.js'/>"></script>
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

취업정보게시판 글쓰기
<form action="<c:url value='/festival/write'/>" method="POST" enctype="multipart/form-data">
	<table border="1">
		<tr>
			<td>제목 : <input type="text" name="fesTitle" id="title">
		</tr>
		<tr>
			<td>내용:<textarea rows="" cols="" id="content" name="fesContent"></textarea></td>
		</tr>
		<tr>
			<td>작성자 : <input type="text" id="write" name="fesWrite" value="${member.memNickName }"></td>
		</tr>
		<tr>
			<td>첨부파일: <input type="file" multiple="multiple" name="file">
		</tr>
	</table>
		<input type="hidden" name="memNum" value="${member.memNum }"> 
		<input type="submit" value="글작성하기">
</form>
<script>
CKEDITOR.replace('fesContent',{
	filebrowserUploadUrl:"<c:url value='/ckImage'/>"
});
</script>
