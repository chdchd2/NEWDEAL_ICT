<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<section>
<div id="sectionC">
 		<div id="subMenu">
					<h2>취업지원센터</h2>
					<ul>
						<li><a href="<c:url value='/weintroduce/newdel'/>" class="subActive">뉴딜일자리 소개 <img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="<c:url value='/weintroduce/site'/>">사이트 개요</a></li>
					</ul>
				</div> 
			<div id="sectionR">
					<div id="contentHeader">
						<h2>뉴딜일자리란?</h2>	
						<div id="content">			
							
							<li class="on"><a href="javascript:multimedia('1');" id="multi1">개요</a></li>
							<li class="on"><a href="javascript:multimedia('2');" id="multi1">연혁</a></li>
							
							</div>
						</div>				
			</div>
		</div>
</div>
</section>
