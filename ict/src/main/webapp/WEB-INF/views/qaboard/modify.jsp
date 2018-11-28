<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="<c:url value='/resources/css/community_QNA03.css'/>">
<section>
<script src="<c:url value='/resources/ckeditor/ckeditor.js'/>"></script>
<script>
$(function(){
	
		
		$(".btnDelete").click(function(){
			if(confirm("삭제하시겠습니까?")){
				document.form.action="/ict/qaboard/delete.do";
				document.form.submit();
			}
		});
		$(".btnList").click(function(){
			document.form.action="/ict/qaboard/list.do";
			document.form.submit();
		});

		$(".btnUpdate").click(function(){
		//첨부파일 이름들을 폼에 추가
			var str="";
			$("#form").append(str);
			document.form.action="/ict/qaboard/update.do";
			document.form.submit();
		});
		
		$(".btnSave").click(function(){
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
   		url:encodeURI("<c:url value='/qaboard/fileDel?fileNum="+fileNum+"'/>"),
   		dataType:"json",
   		success:function(data){
   			alert("파일이 삭제되었습니다. 파일 추가시 여러파일 선택이 가능합니다.");
   		}
     });
	
}
</script>
<div id="sectionC">
<div id="subMenu">
					<h2>커뮤니티</h2>
					<ul>
						<li><a href="<c:url value='/notice/list.do'/>">공지사항 <img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="<c:url value='/freeboard/list.do'/>">자유게시판<img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="#">후기게시판</a></li>
						<li><a href="<c:url value='/qaboard/list.do'/>" class="subActive">질문게시판<img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
					</ul>
</div>

<div id="sectionR">
					<div id="contentHeader">
						<h2>질문게시판</h2>
					</div>
					
<form id="form" name="form" method="post" enctype="multipart/form-data"
action="/ict/qaboard/insert.do">
<div id="content">
<table>
							<colgroup>
								<col>
								<col>
							</colgroup>
							<tbody>
								<tr>
									<td>제목</td>
									<td>
										<input type="text" name="qaTitle" id="qaTitle" value="${vo.qaTitle}">
									</td>
								</tr>
								<tr>
									<td>작성자</td>
									<td><input type="hidden" name="qaWriter" value="${member.memNickName}" /> ${member.memNickName}</td>
								</tr>
								<tr>
									<td>첨부파일</td>
									<td><input type="file" multiple="multiple" name="file">
										<!-- <input type="file" value="파일첨부" id="file" multiple="multiple" name="file"> -->
										<!-- <label for="file">파일첨부</label> -->
										<!-- <span id="checkfile">선택된 파일이 없습니다.</span> -->
										<p>
											<!-- <input type="checkbox" id="checkbox01" ><label for="checkbox01" class="checkbox"></label>
											<input type="checkbox" id="checkbox02" ><label for="checkbox02" class="checkbox"></label> -->
										</p>
										<!-- <a href="#a" id="fileDelete" ><img src="resources/images/delete_icon.png" alt="삭제 아이콘"></a> -->
									</td>
								</tr>
								<tr>
									<td>내용</td>
									<td><textarea name="qaContent" id="qaContent" cols="30" rows="10">${vo.qaContent}</textarea>
									</td>
								</tr>
							</tbody>
						</table>

				
						<ul>
							<li>
								<a id="input"  class="btnUpdate">저장</a>
							</li>
							<li>
								<a id="cancel"  class="btnList">취소</a>
							</li>
						</ul>
	
			<input type="hidden" name="qaNum" value="${vo.qaNum}" />
</div>	
</form>
<script>
CKEDITOR.replace('qaContent',{
	filebrowserUploadUrl:"<c:url value='/ckImage.do'/>"
});
</script>
</div>
</div>
</section>