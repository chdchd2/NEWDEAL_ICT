<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<link rel="stylesheet" href="<c:url value='/resources/css/community_QNA03.css'/>">
<section>
<script src="<c:url value='/resources/ckeditor/ckeditor.js'/>"></script>
<script>
$(function(){
	
	$(".btnSave").click(function(){
		var str="";
	//폼에 hidden 태그들을 추가
	$("#form").append(str); 
		document.form.submit();
	});
	$(".btnList").click(function(){
		/*location.href="${path}/board/list.do";
		//document.form.action="${path}/board/list.do";
		//document.form.submit(); */
		document.form.action="/ict/qaboard/list.do";
		document.form.submit();
	});
});
</script>

<div id="sectionC">
<div id="subMenu">
					<h2>커뮤니티</h2>
					<ul>
						<li><a href="<c:url value='/notice/list.do'/>">공지사항 <img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="<c:url value='/freeboard/list.do'/>">자유게시판<img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="<c:url value='/review/rvList'/>">후기게시판</a></li>
						<li><a href="<c:url value='/qaboard/list.do'/>" class="subActive">질문게시판<img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
					</ul>
</div>
<div id="sectionR">
					<div id="contentHeader">
						<h2>질문게시판</h2>
					</div>
					
<form id="form" name="form" method="post"
action="/ict/qaboard/insert.do">
<input type="hidden" name="qaNum" value="${vo.qaNum}">
<input type="hidden" name="qaRef" value="${vo.qaRef}">
<input type="hidden" name="qaLevel" value="${vo.qaLevel}">
<input type="hidden" name="qaStep" value="${vo.qaStep}">
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
										<input type="text" name="qaTitle" id="qaTitle" value="RE:${vo.qaTitle }">
									</td>
								</tr>
								<tr>
									<td>작성자</td>
									<td><input type="hidden" name="qaWriter" value="${member.memNickName}" /> ${member.memNickName}</td>
								</tr>
								<tr>
									<td>내용</td>
									<td><textarea name="qaContent" id="qaContent" cols="30" rows="10"></textarea>
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
CKEDITOR.replace('qaContent',{
	filebrowserUploadUrl:"<c:url value='/ckImage'/>"
});
</script>
</div>
</div>
</section>