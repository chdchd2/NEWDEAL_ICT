<%@page import="com.newdeal.ict.Vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% MemberVo member=(MemberVo)session.getAttribute("member");%>

	<title></title>
<script>


	var $mainMenu
	var $subMenu
	var $menuBg
	var $header

	$(document).ready(function(){

		$mainMenu=$(".mainmenu>a")
		$subMenu=$(".submenu_list")
		$menuBg=$("#menu_back")
		$header=$("header")

		$subMenu.css("opacity",0)
		$subMenu.hide()

		$menuBg.hide()

		$mainMenu.bind("mouseenter",onOver)
		$mainMenu.bind("focus",onOver)
		$mainMenu.bind("mouseleave",onMainColor)
		$("#header_wrap").bind("mouseleave",onOut)

	})

	function onMainColor(){

		$mainMenu.css("color","black")
	}


	function onOver(){

		$(this).css({"color":"#0131ca","font-family":"N_Square_B"})

		$menuBg.stop()
		 $menuBg.animate({"top":0},200,"easeOutCubic",function(){
			$subMenu.show()
			$subMenu.animate({opacity:1},200,"easeOutCubic")
		})

	}


	function onOut(){

		$menuBg.stop()
		
		$mainMenu.css({"font-family":"N_Square_R"})
		$subMenu.css("opacity",0)
		$subMenu.hide()
		//$menuBg.slideUp(200,"easeOutCubic")
		$menuBg.animate({"top":-160},200,"easeOutCubic")
	}

</script>
	
<script>
function logout(){
	location.href="<c:url value='/logout'/>";
}

</script>

  
 
 			<div id="header_wrap">
 	<p id="header_bar"> </p>
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
 			<a href="<c:url value='/signin'/>">
 				회원가입
 			</a></li>
		<%
 		}
		%>
 			<%-- <li><a href="<c:url value='/admin/'/>">관리자</a></li> --%>
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
 				<li><a href="<c:url value='/festival/list'/>">취업행사안내</a></li>
 			 	<li><a href="<c:url value='/festival/detailList'/>">채용정보공유</a></li>
 			 	</ul>
 			</li>

 			<li class="mainmenu">
 				<a href="#">교육신청</a>
 			 	<ul class="submenu_list">
  				<li><a href="<c:url value='/edu/intList'/>">교육신청안내</a></li>
 			 	<li><a href="<c:url value='/edu/detList'/>">프로그램상세</a></li>
 			 	<c:forEach items="${linklist }" var="linklist">
 			 	<li><a href="${linklist.linkUrl }">${linklist.linkName }</a>
 			 	</c:forEach>
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
 			

 		
 			
 		</ul>
 		
	 </div>
 	</header>
 	
 	<div id="menu_back">
 	</div>
 	
  </div>	
 	  
 	

 	

