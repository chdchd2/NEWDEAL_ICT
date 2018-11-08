<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<div style="text-align: right;">
<c:choose>
	<c:when test="${sessionScope.member == null }">
	<!-- 로그인하지 않은 상태 -->
		<a href="${path}/login">로그인</a> |
		<a href="${path}/signup">회원가입</a>
<%-- 		<a href="${path}/admin/login.do">관리자 로그인</a> --%>
	</c:when>
	<c:otherwise>
	<!-- 로그인한 상태 -->
		${member.memNickName}님 환영합니다.
		<a href="${path}/logout">로그아웃</a> |
		<a href="#">마이페이지</a>
	</c:otherwise>
</c:choose>
</div>

<a href="${path}">HOME</a> |
<a href="#">소개</a> |
<a href="#">취업지원센터</a> |
<a href="#">교육안내</a> |
<a href="${path}/notice/list.do">커뮤니티</a> 

<hr>