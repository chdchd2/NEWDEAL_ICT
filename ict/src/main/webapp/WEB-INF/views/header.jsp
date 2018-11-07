<%@page import="com.newdeal.ict.Vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% MemberVo member=(MemberVo)session.getAttribute("member");%>
<script>
function logout(){
	location.href="<c:url value='/logout'/>";
}

</script>
    <div id="header">

            <h1> HEADER</h1>
	<%if(member!=null){
	%>
	${member.memNickName}님 환영합니다. <input type="button" id="logout" value="로그아웃" onclick="logout()">
	<%
	}
	%>
    </div>

