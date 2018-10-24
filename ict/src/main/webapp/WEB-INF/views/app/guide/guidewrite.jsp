<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//cdn.ckeditor.com/4.10.1/standard/ckeditor.js"></script>
</head>
<body>
<textarea name="contents" id="contents" rows="50" cols="10"></textarea>
<script>


	CKEDITOR.replace( 'contents', {

	filebrowserUploadUrl: "<c:url value='/ckeditorImageUpload'/>"

	});

</script>

</body>
</html>