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
				document.form.action="${path}/freeboard/delete.do";
				document.form.submit();
			}
		});
		$("#btnList").click(function(){
			document.form.action="${path}/freeboard/list.do";
			document.form.submit();
		});

		$("#btnUpdate").click(function(){
		//첨부파일 이름들을 폼에 추가
			
			document.form.action="${path}/freeboard/updateView.do";
			document.form.submit();
		});
		
		$("#btnSave").click(function(){
			//태그.each(function(){})모든 태그 반복
			var str="";
			//폼에 hidden 태그들을 추가
			$("#form").append(str);
			document.form.submit();
		});
	
	
});
function comment(){
	var comContent=$("#comContent").val();
	var memNum=$("#memNum").val();
	var comBnum=${vo.fbNum};
	console.log(comContent);
	
	$.ajax({
	type:"GET",
	url:encodeURI("<c:url value='/freeboard/comment.do?comContent="+comContent+"&memNum="+memNum+"&comBnum="+comBnum+"'/>"),
	dataType:"json",
	success:function(data){
		console.log(data);
		
		$("#comContent").val("");
		for(var i=0; i<data.commentList.length; i++){
		$("#commentlist").append(data.commentList[i].memNum+"===>"+data.commentList[i].comContent+"<br>");	
			
		}

	}
}); 
}
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>자유게시판</h2>
<form id="form" name="form" method="post" action="${path}/freeboard/insert.do">
<!-- 사용자 -->
		<div>
			조회수 : ${vo.fbViewcnt}
		</div>
		<div>
			<div>
			제목: ${vo.fbTitle}
			</div>
		</div>
		<div>
			작성자 : ${vo.fbWriter}
		</div>
		<div>
			작성일 : <fmt:formatDate value="${vo.fbRegdate}" pattern="yyyy.MM.dd"/> 
		</div>
		<div style="width:800px;">
			<div>
			내용: ${vo.fbContent}
			</div>
			
		</div>
	    <div>
	   		파일목록 : <c:forEach var="list" items="${vo.list }">
	   					<a href="<c:url value='/freeboard/fileDown?fileNum=${list.fileNum }'/>">${list.fileOrgName }</a><br>
	   				</c:forEach>
	    </div>

	<div>
	<!-- 수정, 삭제에 필요한 글번호를 hidden 태그에 저장 -->
		<input type="hidden" name="fbNum" value="${vo.fbNum}" />
	<!-- 본인 게시물만 수정,삭제 버튼 표시 -->	
	<c:if test="${sessionScope.member.memNickName == vo.fbWriter }"> 
		<button type="button" id="btnUpdate">수정</button>
		<button type="button" id="btnDelete">삭제</button>
	</c:if> 
		<button type="button" id="btnList">목록</button>
	</div>
	<span id="commentlist">
	</span>
	<div id="comment">
		댓글쓰기 : <textarea id="comContent"></textarea>
		<input type="hidden" value="${sessionScope.member.memNum }" id="memNum">
		<a onclick="comment()">등록</a>
	</div>
</form>
</body>
</html>