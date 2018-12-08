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
						<li><a href="<c:url value='/weintroduce/newdel'/>">뉴딜일자리 소개 <img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="<c:url value='/weintroduce/site'/>" class="subActive">사이트 개요</a></li>
					</ul>
				</div> 
			<div id="sectionR">
					<div id="contentHeader">
					<font>
						<h2>사이트 개요</h2>
					</font>	
					</div>		
						<div id="content2">
						<font>
						<h3>1>&nbsp; 뉴딜 참여자, 참여기업, 이해관계자가 편리하게 정보지식을 공유할 수 있는 서비스를 제공합니다.<br></h3>
						
						<h3>2>&nbsp; 기존의 서울 일자리 포털에 있는 
						<font class="c">
						<a href = "http://job.seoul.go.kr/www/newdeal/board/newDealFaqWww.do?method=selectNewDealFaqWwwList&searchKeyword=&searchCondition=&faqCmmnSe=&pageIndex=1"> 
						<b>(뉴딜 일자리 파트)</b>
						</font></a>&
						<font class="c">
						<a href = "https://cafe.naver.com/seoulnewdeal"> 
						<b>(네이버 뉴딜 카페)</b></a>
						</font>
						기능을 통합한 시스템으로 최적화된 업무 프로세스 제공합니다.<br></h3>
					
						<h3>3>&nbsp; 독립적인  
						<font class="c">
						<a href = "http://job.seoul.go.kr/www/newdeal/jbhnt_mngr/newDealJbhntMngrWww.do?method=getNewDealMain"> 
						<b>(뉴딜 일자리 홈페이지)</b></a>
						를 통해 운영의 효율성 극대화합니다.<br></h3>
							
						<h3>4>&nbsp; 통합 시스템 운영을 통한 업무 효율을 높입니다.<br></h3>
							
						<h3>5>&nbsp; 뉴딜 일자리 시스템 홍보 및 커뮤니티 활성화의 효과가 있습니다.</h3>
						</font>
						<img src="<c:url value='/resources/images/newdel2.jpg'/>" alt="뉴딜일자리소개 이미지">
					
						</div>						
				</div>
		</div>
</section>
