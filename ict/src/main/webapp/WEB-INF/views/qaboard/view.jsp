<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/common_View.jsp" %>

<script src="${path}/include/js/common.js"></script>
<script>
$(function(){
	
		
		$("#btnDelete").click(function(){
			if(confirm("삭제하시겠습니까?")){
				document.form.action="${path}/qaboard/delete.do";
				document.form.submit();
			}
		});
		$("#btnList").click(function(){
			document.form.action="${path}/qaboard/list.do";
			document.form.submit();
		});

		$("#btnUpdate").click(function(){
		//첨부파일 이름들을 폼에 추가
			
			document.form.action="${path}/qaboard/updateView.do";
			document.form.submit();
		});
		
		$("#btnReply").click(function(){
			document.form.action="${path}/qaboard/reply.do";
			document.form.submit();
		});
	
});
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>질문게시판</h2>
<form id="form" name="form" method="post"
action="${path}/qaboard/insert.do">
<!-- 사용자 -->
		<div>
			조회수 : ${vo.qaViewcnt}
		</div>
		<div>
			<div>
			제목: ${vo.qaTitle}
			</div>
		</div>
		<div>
			작성자 : ${vo.qaWriter}
		</div>
		<div>
			작성일 : <fmt:formatDate value="${vo.qaRegdate}" pattern="yyyy.MM.dd"/> 
		</div>
		<div style="width:800px;">
			<div>
			내용: ${vo.qaContent}
			</div>
			
		</div>
	    <div>
	   		파일목록 : <c:forEach var="list" items="${vo.list }">
	   					<a href="<c:url value='/qaboard/fileDown?fileNum=${list.fileNum }'/>">${list.fileOrgName }</a><br>
	   				</c:forEach>
	    </div>

	<div>
	<!-- 수정, 삭제에 필요한 글번호를 hidden 태그에 저장 -->
		<input type="hidden" name="qaNum" value="${vo.qaNum}" />
	<!-- 본인 게시물만 수정,삭제 버튼 표시 -->	
	<c:if test="${sessionScope.member.memNickName == vo.qaWriter }"> 
		<button type="button" id="btnUpdate">수정</button>
		<button type="button" id="btnDelete">삭제</button>
	</c:if> 
		<button type="button" id="btnReply">답변</button>
		<button type="button" id="btnList">목록</button>
	</div>
</form>
</body>
</html>