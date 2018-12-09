<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<link href="https://fonts.googleapis.com/css?family=Yeon+Sung&amp;subset=korean" rel="stylesheet">
<style>
font{font-family:'Yeon Sung', cursive, font-size:11px; }
</style>
<section>
<div id="sectionC">
 		<div id="subMenu">
					<h2>취업지원센터</h2>
					<ul>
						<li><a href="<c:url value='/newdeal'/>">뉴딜일자리 소개 </a></li>
						<li><a href="<c:url value='/site'/>" class="subActive">사이트 개요<img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
					</ul>
				</div> 
			<div id="sectionR">
					<div id="contentHeader">
					<font>
						<h2>사이트 개요</h2>
					</font>	
					</div>		
						<div id="contents2">
						
						<img src="<c:url value='/resources/images/newdeal2.png'/>" alt="뉴딜일자리소개 이미지">
					
						</div>			
				</div>
		</div>
</section>