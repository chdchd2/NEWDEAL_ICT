<<<<<<< HEAD
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
			var str="";
			$("#form").append(str);
			document.form.action="${path}/freeboard/update.do";
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

function fileDel(fileNum){
	$("#span"+fileNum).remove();
	 $.ajax({
   		type:"POST",
   		url:encodeURI("<c:url value='/freeboard/fileDel?fileNum="+fileNum+"'/>"),
   		dataType:"json",
   		success:function(data){
   			alert("파일이 삭제되었습니다. 파일 추가시 여러파일 선택이 가능합니다.");
   		}
     });
	
}
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>자유게시판</h2>
<form id="form" name="form" method="post" enctype="multipart/form-data"
action="${path}/freeboard/insert.do">
<!-- 사용자 -->
		<div>
			조회수 : ${vo.fbViewcnt}
		</div>
		<div>
			제목 <input name="fbTitle" value="${vo.fbTitle}"/>
		</div>
		<div>
			작성자 : <input type="hidden" name="fbWriter" value="${member.memNickName}" /> ${member.memNickName}
		</div>
		<div>
			작성일 : <fmt:formatDate value="${vo.fbRegdate}" pattern="yyyy.MM.dd"/> 
		</div>
		<div style="width:800px;">
			내용 <textarea id="fbContent" name="fbContent" rows="3" cols="80">${vo.fbContent}</textarea>
			
		</div>
		<div>
	 		 파일목록 : 
	 		 <c:forEach var="list" items="${vo.list }">
		 		 <span id="span${list.fileNum }">${list.fileOrgName }
			 		 <span>&nbsp;
			 		 	<a href="#" onclick="fileDel(${list.fileNum})" style="width:20px;height:20px;display:inline-block;vertical-align:middle;font-size:16px;color:#cf2f0f;">x</a>
			 		 </span><br>
		 		 </span>
	 		 </c:forEach>
	    	<input type="file" multiple="multiple" name="file">
	    </div>
	    
	<div>
	<!-- 수정, 삭제에 필요한 글번호를 hidden 태그에 저장 -->
		<input type="hidden" name="fbNum" value="${vo.fbNum}" />
	<!-- 본인 게시물만 수정,삭제 버튼 표시 -->	
	<%-- <c:if test="${sessionScope.member == vo.fbWriter }"> --%>
		<button type="button" id="btnUpdate">저장</button>
		<button type="button" id="btnDelete">삭제</button>
	<%-- </c:if> --%>
		<button type="button" id="btnList">목록</button>
	</div>
</form>
</body>
<script>
CKEDITOR.replace('fbContent',{
	filebrowserUploadUrl:"<c:url value='/ckImage.do'/>"
});
</script>
=======
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
			var str="";
			$("#form").append(str);
			document.form.action="${path}/freeboard/update.do";
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

function fileDel(fileNum){
	$("#span"+fileNum).remove();
	 $.ajax({
   		type:"POST",
   		url:encodeURI("<c:url value='/freeboard/fileDel?fileNum="+fileNum+"'/>"),
   		dataType:"json",
   		success:function(data){
   			alert("파일이 삭제되었습니다. 파일 추가시 여러파일 선택이 가능합니다.");
   		}
     });
	
}
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>자유게시판</h2>
<form id="form" name="form" method="post" enctype="multipart/form-data"
action="${path}/freeboard/insert.do">
<!-- 사용자 -->
		<div>
			조회수 : ${vo.fbViewcnt}
		</div>
		<div>
			제목 <input name="fbTitle" value="${vo.fbTitle}"/>
		</div>
		<div>
			작성자 : <input type="hidden" name="fbWriter" value="${member.memNickName}" /> ${member.memNickName}
		</div>
		<div>
			작성일 : <fmt:formatDate value="${vo.fbRegdate}" pattern="yyyy.MM.dd"/> 
		</div>
		<div style="width:800px;">
			내용 <textarea id="fbContent" name="fbContent" rows="3" cols="80">${vo.fbContent}</textarea>
			
		</div>
		<div>
	 		 파일목록 : 
	 		 <c:forEach var="list" items="${vo.list }">
		 		 <span id="span${list.fileNum }">${list.fileOrgName }
			 		 <span>&nbsp;
			 		 	<a href="#" onclick="fileDel(${list.fileNum})" style="width:20px;height:20px;display:inline-block;vertical-align:middle;font-size:16px;color:#cf2f0f;">x</a>
			 		 </span><br>
		 		 </span>
	 		 </c:forEach>
	    	<input type="file" multiple="multiple" name="file">
	    </div>
	    
	<div>
	<!-- 수정, 삭제에 필요한 글번호를 hidden 태그에 저장 -->
		<input type="hidden" name="fbNum" value="${vo.fbNum}" />
	<!-- 본인 게시물만 수정,삭제 버튼 표시 -->	
	<%-- <c:if test="${sessionScope.member == vo.fbWriter }"> --%>
		<button type="button" id="btnUpdate">저장</button>
		<button type="button" id="btnDelete">삭제</button>
	<%-- </c:if> --%>
		<button type="button" id="btnList">목록</button>
	</div>
</form>
</body>
<script>
CKEDITOR.replace('fbContent',{
	filebrowserUploadUrl:"<c:url value='/ckImage.do'/>"
});
</script>
>>>>>>> branch 'jh' of https://github.com/ripplesiba/NEWDEAL_ICT.git
</html>