<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!Doctype html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
	<link rel="shortcut icon" href="/favicon.ico">
    <link rel="apple-touch-icon" href="/apple-touch-icon.png">
	<link rel="stylesheet" href="<c:url value='/resources/css/reset.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/header_02.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/footer.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/community_notice01.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/community_notice02.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/forbidden.css'/>">
	<script src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.easing.1.3.js'/>"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.18.4/TweenLite.min.js"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.18.4/easing/EasePack.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.18.4/plugins/CSSPlugin.min.js"></script>
	<c:set var="path" value="${pageContext.request.contextPath }" />
	
</head>
<body>
		<tiles:insertAttribute name="header"/>
		<tiles:insertAttribute name="main"/>
		<tiles:insertAttribute name="footer"/>
</body>
</html>