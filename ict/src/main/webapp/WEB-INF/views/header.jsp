<%@page import="com.newdeal.ict.Vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% MemberVo member=(MemberVo)session.getAttribute("member");%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<script src="${path}/include/jquery-3.3.1.min.js"></script>
 <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
 <link rel="stylesheet" href="${path}/include/style.css" > 
<script>
function logout(){
	location.href="<c:url value='/logout'/>";
}

</script>

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
<a href="${path}/edu/intList.do">교육안내</a> |
<a href="${path}/notice/list.do">커뮤니티</a> 

<hr>
    <div id="header">

            <h1> HEADER</h1>
	<%if(member!=null){
	%>
	${member.memNickName}님 환영합니다. <input type="button" id="logout" value="로그아웃" onclick="logout()">
	<%
	}
	%>
    </div>

