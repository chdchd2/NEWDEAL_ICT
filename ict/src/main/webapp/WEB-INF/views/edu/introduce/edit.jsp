<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="<c:url value='/resources/ckeditor/ckeditor.js'/>"></script>
<body>
<h2>게시글 상세보기</h2>
<form name="form1" action="<c:url value='/edu/intEdit'/>" method="POST" enctype="multipart/form-data">
    <div>
   파일목록 : <c:forEach var="list" items="${vo.list }"><a href="<c:url value='/edu/fileDown?fileNum=${list.fileNum }'/>">${list.fileOrgName }</a><br></c:forEach>
    </div>
    <div>
        제목 : 
      <input type="text" value="${vo.intTitle }" name="intTitle">
    </div>
    <div>
        내용
        <textarea name="intContent" id="content" rows="4" cols="80" placeholder="내용을 입력해주세요">${vo.intContent}</textarea>
    </div>
    <div>
        이름
       ${vo.intWriter}
    </div>
    <div style="width:650px; text-align: center;">
        <!-- 게시물번호를 hidden으로 처리 -->
        <input type="hidden" name="intNum" value="${vo.intNum}">
       <button type="submit" id="btnUpdete">수정</button>
    </div>
</form>
</body>
<script>
CKEDITOR.replace('intContent',{
	filebrowserUploadUrl:"<c:url value='/ckImage.do'/>"
});
</script>