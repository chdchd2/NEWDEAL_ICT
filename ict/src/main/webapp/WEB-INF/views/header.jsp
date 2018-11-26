<%@page import="com.newdeal.ict.Vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% MemberVo member=(MemberVo)session.getAttribute("member");%>

	<title></title>

	
<script>
function logout(){
	location.href="<c:url value='/logout'/>";
}

</script>

  
 
 			<div id="header_wrap">
 	<header>
 		
 	  <div id="nav_pc">
 		
 		<ul class="topmenu_list">
 		<%if(member!=null){
		%>
		<li><a>${member.memNickName}</a></li>
		<li><a href="<c:url value='/logout'/>">로그아웃</a></li>
		<%
 		}else{
		%>
 			<li>
 			<a href="<c:url value='/login'/>">
 				로그인
 			</a></li>
 			<li>
 			<a href="#">
 				회원가입
 			</a></li>
		<%
 		}
		%>
 			
 		</ul>
 		
 	
 		<ul id="mainmenu_list">
	 			
	 		<h1 id="logo">
	 			<a href="<c:url value='/'/>">
	 				<img src="<c:url value='/resources/images/logo.png'/>" alt="뉴딜커뮤니티홈">
	 			</a>
	 		</h1>
 			
 			<li class="mainmenu"> 			 
 				<a href="#">뉴딜 일자리</a>			 
 			 	<ul class="submenu_list">
 			 		<li><a href="#">뉴딜일자리 소개</a></li>
 			 		<li><a href="#">사이트개요</a></li>
 			 	</ul>
 			</li>
 			
 			<li class="mainmenu">
 				<a href="#">취업지원센터</a>
 			 	<ul class="submenu_list">
 				<li><a href="#">취업행사안내</a></li>
 			 	<li><a href="#">채용정보공유</a></li>
 			 	</ul>
 			</li>

 			<li class="mainmenu">
 				<a href="#">교육신청</a>
 			 	<ul class="submenu_list">
  				<li><a href="<c:url value='/edu/intList'/>">교육신청안내</a></li>
 			 	<li><a href="<c:url value='/edu/detailList'/>">프로그램상세</a></li>
 			 	<li><a href="#">교육신청바로가기</a></li>
 			 	</ul>
 			</li>
 			
 			<li class="mainmenu">
 				<a href="#">커뮤니티</a>
	 			 <ul class="submenu_list">
	 				<li><a href="<c:url value='/notice/list.do'/>">공지사항</a></li>
	 			 	<li><a href="<c:url value='/freeboard/list.do'/>">자유게시판</a></li>
	 			 	<li><a href="#">후기게시판</a></li>
	 			 	<li><a href="<c:url value='/qaboard/list.do'/>">질문게시판</a></li>
 			 	</ul>
 			</li>
 			

 			</li>
 			
 		</ul>
 		
	 </div>
 	</header>
 	
 	<div id="menu_back">
 	</div>
 	
  </div>	
 	  
 	

 	

