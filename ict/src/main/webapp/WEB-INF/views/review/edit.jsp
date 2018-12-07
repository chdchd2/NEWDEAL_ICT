<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="<c:url value='/resources/ckeditor/ckeditor.js'/>"></script>
<script>
function fileDel(fileNum){
	$("#span"+fileNum).remove();
	 $.ajax({
   		type:"POST",
   		url:encodeURI("<c:url value='/review/fileDel?fileNum="+fileNum+"'/>"),
   		dataType:"json",
   		success:function(data){
   			alert("파일이 삭제되었습니다. 파일 추가시 여러파일 선택이 가능합니다.");
   		}
     });
	
	
	
	
}
</script>
<body>
<h2>게시글 상세보기</h2>
<form name="form1" action="<c:url value='/review/rvEdit'/>" method="POST" enctype="multipart/form-data">
    <div>
   파일목록 : <c:forEach var="list" items="${vo.list }"><span id="span${list.fileNum }">${list.fileOrgName }<span>&nbsp;<a href="#" onclick="fileDel(${list.fileNum})" style="width:20px;height:20px;display:inline-block;vertical-align:middle;font-size:16px;color:#cf2f0f;">x</a></span><br></span></c:forEach>
    <input type="file" multiple="multiple" name="file">
    </div>
    <div>
        제목 : 
      <input type="text" value="${vo.rvTitle }" name="rvTitle">
    </div>
    <div>
        내용
        <textarea name="rvContent" id="content" rows="4" cols="80" placeholder="내용을 입력해주세요">${vo.rvContent}</textarea>
    </div>
    <div>
        이름
       ${vo.rvWriter}
    </div>
    <div style="width:650px; text-align: center;">
        <!-- 게시물번호를 hidden으로 처리 -->
        <input type="hidden" name="rvNum" value="${vo.rvNum}">
       <button type="submit" id="btnUpdate">수정</button>
    </div>
</form>
</body>
<script>
CKEDITOR.replace('rvContent',{
	filebrowserUploadUrl:"<c:url value='/ckImage.do'/>"
});
</script>