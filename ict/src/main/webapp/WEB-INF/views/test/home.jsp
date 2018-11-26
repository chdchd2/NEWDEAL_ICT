<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Home</title>
</head>
<body>

<form method="post" action="<c:url value='/write'/>">
이름 : <input type="text" name="name" id="name">
<!-- 컨트롤러에서 매개변수를 VO로 받을테니 name에는 vo에있는 멤버변수이름과 동일하게. -->
<input type="submit" value="전송">
</form>
</body>
</html>
