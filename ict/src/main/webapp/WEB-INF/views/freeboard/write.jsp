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
});
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
	<div>
		제목 <input name="fbTitle" id="fbTitle" size="80"/>
	</div>
	<div>
		작성자 <input name="fbWriter" id="fbWriter" size="80"/>
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
		</div>
		<!-- 첨부파일 목록이 표시되는 영역
		<div id="uploadedList"></div> -->
	</div>
	<div style="width:800px;">
		내용 <textarea id="fbContent" name="fbContent" rows="3" cols="80"></textarea>
		<!-- <script>
		CKEDITOR.replace("fbContent",{
			filebrowserUploadUrl : "${path}/imageUpload.do"
		});
		</script> -->
	</div>
	<div style="width:700px; text-align:center;">
		<button type="button" id="btnSave">등록</button>
	</div>
</form>
</body>
</html>