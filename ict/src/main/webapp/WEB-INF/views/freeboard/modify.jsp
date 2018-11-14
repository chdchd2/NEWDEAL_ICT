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
			/*location.href="${path}/board/list.do";
			//document.form.action="${path}/board/list.do";
			//document.form.submit(); */
			document.form.action="${path}/freeboard/list.do";
			document.form.submit();
		});

		$("#btnUpdate").click(function(){
		//첨부파일 이름들을 폼에 추가
			var str="";
			$("#uploadedList .file").each(function(i){
				str+=
					"<input type='hidden' name='fbFiles["+i+"]' value='"
					+$(this).val()+"'>";
			});
			$("#form").append(str);
			document.form.action="${path}/freeboard/update.do";
			document.form.submit();
		});
		
		$("#btnSave").click(function(){
			//태그.each(function(){})모든 태그 반복
			var str="";
			$("#uploadedList .file").each(function(i){
				str+="<input type='hidden' name='fbFiles["+i+"]' value='"
				+$(this).val()+"'>";
			});
			//폼에 hidden 태그들을 추가
			$("#form").append(str);
			document.form.submit();
		});
	listAttach(); //첨부파일 목록 로딩

	
	//첨부파일삭제
	$("#uploadedList").on("click",".file_del",function(e){
		var that=$(this);
		//data:{fileName:$(this).attr("data-src")},
		$.ajax({
			type:"post",
			url:"${path}/upload/deleteFile",
			data:"fileName="+ $(this).attr("data-src"),
			dataType:"text",
			success:function(result){
				if(result=="deleted"){
					//화면에서 태그제거
					that.parent("div").remove();
				}
			}
		});
	});
	
	
	//드래그 기본효과 막음
	$(".fileDrop").on("dragenter dragover", function(e){
		e.preventDefault();
	});
	$(".fileDrop").on("drop",function(e){
		e.preventDefault();
		//드롭한 파일을 폼데이터에 추가함
		var fbFiles = e.originalEvent.dataTransfer.fbFiles;
		var file=fbFiles[0];
		var formData=new FormData();
		//폼데이터에 추가
		formData.append("file", file);
		//processData: false -header가 아닌 body로 전송
		$.ajax({
			url: "${path}/upload/uploadAjax",
			data: formData,
			dataType: "text",
			processData: false,
			contentType: false,
			type: "post",
			success: function(data){//콜백함수
				var fileInfo=getFileInfo(data);//첨부파일정보
				var html="<a href='"+fileInfo.getLink+"'>"+
				fileInfo.fileName+"</a><br>";//첨부파일링크
				html+="<input type='hidden' class='file' value='"
				+fileInfo.fullName+"'>"; //hidden태그 추가
				$("#uploadedList").append(html);//div에 추가
			}
		});
	});

	
});
function listAttach(){
	$.ajax({
		type: "post",
		url: "${path}/freeboard/getAttach/${vo.fbNum}",
		success:function(list){
			//list => json 형식의 데이터
			console.log(list);
			$(list).each(function(){
				var fileInfo=getFileInfo(this);
				console.log(fileInfo);
				var html=
					"<div><a href='"+fileInfo.getLink+"'>"+fileInfo.fileName+"</a>&nbsp;&nbsp;";
				<c:if test="${sessionScope.member == vo.fbWriter}">	
					html+="<a href='#' class='file_del' data-src='"
					+this+"'>[삭제]</a></div>";
					/* html+="<input type='button' class='file_del' value='삭제' data-src='" 
					+this+"'></div>"; */
				</c:if> 
					$("#uploadedList").append(html);
			});
		}
	});
}
</script>
<style>
.fileDrop {
	width: 300px;
	height: 80px;
	border: 1px solid #ededed;
}
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>자유게시판</h2>
<form id="form" name="form" method="post"
action="${path}/freeboard/insert.do">
<!-- 관리자 -->
<%-- <c:choose>
	<c:when test="${sessionScope.userid == dto.writer }">
		<div>
			제목 <input name="title" value="${dto.title}"/>
		</div>
		<div>
			작성자 : ${dto.name}
		</div>
		<div>
			작성일 : <fmt:formatDate value="${dto.regdate}" pattern="yyyy.MM.dd"/> 
		</div>
		<div>
			첨부 파일<br>
				
			<!-- 0717추가 -->
			<div>
				<input type="file" name="file" id="btnUpload">
			</div>
		
			<!-- 첨부파일을 드래그할 영역 -->
			<div class="fileDrop">
				<!-- 첨부파일 목록이 표시되는 영역 -->
				<div id="uploadedList"></div>
			</div><!-- 
			첨부파일 목록이 표시되는 영역
			<div id="uploadedList"></div> -->
		</div>
		<div style="width:800px;">
			내용 <textarea id="content" name="content" rows="3" cols="80">${dto.content}</textarea>
			<script>
			CKEDITOR.replace("content",{
				filebrowserUploadUrl : "${path}/imageUpload.do"
			});
			</script>
		</div>
	</c:when>
	<c:otherwise> --%>
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
			첨부 파일  : 
			<!-- 첨부파일을 드래그할 영역 --> 
			<div class="fileDrop"></div> 
			<!-- 첨부파일 목록이 표시되는 영역 -->
			<div id="uploadedList"></div>
		</div>
	<%-- </c:otherwise>
</c:choose> --%>

<!-- 0718추가 -->
<%-- <c:choose>
	<c:when test="$fn:length(list2) == 2 and board.bno ==list2[0].bno">
		<tr>
			<td><span class="prev">이전</span>이전글이 없습니다.</td>
		</tr>
		<tr>
			<td><span class="next">다음</span><a href="/view.do?bno=${list2[1].bno}">${list2[1].title}</a></td>
		</tr>
	</c:when>
	
</c:choose> --%>
<!--  -->

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
</html>