<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<link rel="stylesheet" href="<c:url value='/resources/css/forbidden.css'/>">
<center>
<section id="forbidden_wrap" style="margin-top: 300px;">
    <div class="forbidden_top">
        <img src="<c:url value='/resources/images/forbidden.png'/>">
        <div class="forbidden_notice">
            <p>죄송합니다.</p>
            <p>요청하신 페이지에 접근권한이 없습니다.</p>
        </div>        
    </div>
    <div class="forbidden_bottom">
        <img src="<c:url value='/resources/images/forbidden_check.png'/>" alt="확인아이콘">
        <span>확인해보세요</span>
        <div class="forbidden_desc">
            <p>1> 로그인이 필요한 서비스  페이지에 접근한 경우</p>

            <p>2> 기업회원이 아닌자가 기업회원 페이지에 접근한 경우</p>

            <p>3> 관리자 권한이 없는자가 관리자 페이지에 접근한 경우</p>

            <p>** 기타 사항은 관리자에게 문의바랍니다.</p>
        </div>
    </div>
    
</section>
</center>