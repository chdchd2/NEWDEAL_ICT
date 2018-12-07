<%@page import="com.newdeal.ict.Vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="../../error/interror.jsp"
	%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	
	MemberVo vo = (MemberVo) session.getAttribute("member");

	if (!(vo.getMemGrade() == 2)) {
%>
<script>
	alert("기업회원만 글쓰기가 가능합니다");
	history.back();
</script>
<%
	}
%>
<link rel="stylesheet" href="<c:url value='/resources/css/community_QNA03.css'/>">
<section>
<script src="<c:url value='/resources/ckeditor/ckeditor.js'/>"></script>
<script>
$(function(){
	
	$(".btnSave").click(function(){
		//태그.each(function(){})모든 태그 반복
		var str="";
		//폼에 hidden 태그들을 추가
		$("#form").append(str);
		document.form.submit();
	});
	$(".btnList").click(function(){
		/*location.href="${path}/board/list.do";
		//document.form.action="${path}/board/list.do";
		//document.form.submit(); */
		document.form.action="<c:url value='/edu/detList'/>";
		document.form.submit();
	});
});
</script>
<div id="sectionC">
<div id="subMenu">
						<h2>교육신청</h2>
				<ul>
						<li><a href="<c:url value='/edu/intList'/>" >교육신청안내 </a></li>
						<li><a href="<c:url value='/edu/detailList'/>" class="subActive">프로그램상세<img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="#">교육신청 바로가기</a></li>
					</ul>
				</div>


<div id="sectionR">
					<div id="contentHeader">
						<h2>프로그램 상세</h2>
					</div>
					
<form id="form" name="form" method="post" enctype="multipart/form-data" action="<c:url value='/edu/detWrite'/>">
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
										<input type="text" name="detTitle" id="detTitle">
									</td>
								</tr>
								<tr>
									<td>작성자</td>
									<td><input type="hidden" name="detWriter" value="${member.memNickName}" />
										<input type="hidden" name="memNum" value="${member.memNum }"/>${member.memNickName}</td>
								</tr>
								<tr>
									<td>첨부파일</td>
									<td>
										 <input type="file" value="파일첨부" id="file" name="file">
										 <label for="file">파일첨부1</label>
										 <input type="file" value="파일첨부" id="file2" name="file2">
										 <label for="file2">파일첨부2</label>
										 <input type="file" value="파일첨부" id="file3" name="file3">
										 <label for="file3">파일첨부3</label>
									
									</td>
								</tr>
								<tr>
									<td>내용</td>
									<td><textarea name="detContent" id="detContent" cols="30" rows="10"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
	
						<ul>
							<li>
								<a id="input"  class="btnSave">등록</a>
							</li>
							<li>
								<a id="cancel"  class="btnList">취소</a>
							</li>
						</ul>
	
</div>	
</form>
<script>
CKEDITOR.replace('detContent',{
	filebrowserUploadUrl:"<c:url value='/ckImage'/>"
});
</script>
</div>
</div>
</section>
