<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="${path}/include/js/common.js"></script>
<script>
$(function(){
	
	$("#btnSave").click(function(){
		//태그.each(function(){})모든 태그 반복
		var str="";
		//폼에 hidden 태그들을 추가
		$("#form").append(str);
		document.form.submit();
	});
});


</script>
</head>
<body>

<%@ include file="../include/menu.jsp" %>
<h2>자유게시판</h2>
<form id="form" name="form" method="post" enctype="multipart/form-data"
action="${path}/freeboard/insert.do">
	
	<%-- <input type="hidden" name="fbWriter" value="${member.memNickName}"/> --%>
	
	<div>
		제목 <input name="fbTitle" id="fbTitle" size="80"/>
	</div>
	<div>
		작성자 : <input type="hidden" name="fbWriter" value="${member.memNickName}" /> ${member.memNickName}
	</div>
	<div style="width:800px;">
		내용 <textarea id="fbContent" name="fbContent" rows="3" cols="80"></textarea>
	</div>
	<div>
		<div>첨부파일: <input type="file" multiple="multiple" name="file"></div>
	</div>
	<div style="width:700px; text-align:center;">
		<button type="button" id="btnSave">등록</button>
	</div>
</form>
<script>
CKEDITOR.replace('fbContent',{
	filebrowserUploadUrl:"<c:url value='/ckImage'/>"
});
</script>
</body>
</html>