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
		document.form.action="${path}/qaboard/replyok.do";
		document.form.submit();
	});
	$("#btnList").click(function(){
		/*location.href="${path}/board/list.do";
		//document.form.action="${path}/board/list.do";
		//document.form.submit(); */
		document.form.action="${path}/qaboard/list.do";
		document.form.submit();
	});

});


</script>
</head>
<body>

<%@ include file="../include/menu.jsp" %>
<h2>질문게시판</h2>
<form id="form" name="form" method="post" enctype="multipart/form-data"
action="${path}/qaboard/insert.do">
	
	<%-- <input type="hidden" name="qaWriter" value="${member.memNickName}"/> --%>
	
	<div>
		제목 <input name="qaTitle" id="qaTitle" size="80" value="RE:${vo.qaTitle }"/>
	</div>
	<div>
		작성자 : <input type="hidden" name="qaWriter" value="${member.memNickName}" /> ${member.memNickName}
	</div>
	<div style="width:800px;">
		내용 <textarea id="qaContent" name="qaContent" rows="3" cols="80"></textarea>
	</div>
	<div>
		<div>첨부파일: <input type="file" multiple="multiple" name="file"></div>
	</div>
	<div style="width:700px; text-align:center;">
		<button type="button" id="btnSave">등록</button>
		<button type="button" id="btnList">취소</button>
	</div>
</form>
<script>
CKEDITOR.replace('qaContent',{
	filebrowserUploadUrl:"<c:url value='/ckImage'/>"
});
</script>
</body>
</html>