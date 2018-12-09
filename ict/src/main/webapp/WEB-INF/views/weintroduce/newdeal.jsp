<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<link href="https://fonts.googleapis.com/css?family=Yeon+Sung&amp;subset=korean" rel="stylesheet">
<style>
font{font-family:'Yeon Sung', cursive, font-size:15px; }
</style>
<section>
<div id="sectionC">
 		<div id="subMenu">
					<h2>취업지원센터</h2>
					<ul>
						<li><a href="<c:url value='/newdeal'/>" class="subActive">뉴딜일자리 소개 <img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="<c:url value='/site'/>">사이트 개요</a></li>
					</ul>
		</div> 
			<div id="sectionR">
					<div id="contentHeader">
						<h2>뉴딜일자리란?</h2>	
					</div>		
					<div id="contents2">	
					<font>
						<h3>○&nbsp; 시민생활에 필요한 서비스를 제공하고 <br></h3>
						<h3>○&nbsp; 참여자에게는 일 경험 제공 및 직업역량 배양을 통해 <br></h3>
						<h3>○&nbsp; 참여자의 민간일자리 진입을 촉진하기 위한 사업입니다.</h3>
					</font>	
					
						<img src="<c:url value='/resources/images/newdel.png'/>" alt="뉴딜일자리소개 이미지">
					<a href = "http://job.seoul.go.kr/www/newdeal/board/newDealFaqWww.do?method=selectNewDealFaqWwwList&searchKeyword=&searchCondition=&faqCmmnSe=&pageIndex=1"> <b>  &nbsp;&nbsp;------> ( 더알아보기 ) </b></a><br>
					
					</div>				
			</div>
		</div>
</section>