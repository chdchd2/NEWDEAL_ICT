<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<div id="subMenu">
<h3>커뮤니티</h3>
	<ul>
		<li><a href="${path}/notice/list.do" >공지사항</a></li>
		<li><a href="${path}/freeboard/list.do">자유게시판</a></li>
		<li><a href="#a">후기게시판</a></li>
		<li><a href="#a">질문게시판</a></li>
	</ul>
</div>

