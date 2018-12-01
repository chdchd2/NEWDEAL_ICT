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
		document.form.action="<c:url value='/edu/intList'/>";
		document.form.submit();
	});
});
</script>
<div id="sectionC">
<div id="subMenu">
						<h2>교육신청</h2>
					<ul>
						<li><a href="<c:url value='/edu/intList'/>" class="subActive">교육신청안내 <img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="<c:url value='/edu/detailList'/>">프로그램상세</a></li>
						<li><a href="#">교육신청 바로가기</a></li>
					</ul>
				</div>


<div id="sectionR">
					<div id="contentHeader">
						<h2>교육신청 안내게시판</h2>
					</div>
					
<form id="form" name="form" method="post" enctype="multipart/form-data" action="<c:url value='/edu/intWrite'/>">
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
										<input type="text" name="intTitle" id="intTitle">
									</td>
								</tr>
								<tr>
									<td>작성자</td>
									<td><input type="hidden" name="intWriter" value="${member.memNickName}" />
										<input type="hidden" name="memNum" value="${member.memNum }"/>${member.memNickName}</td>
								</tr>
								<tr>
									<td>첨부파일</td>
									<td>
										 <input type="file" value="파일첨부" id="file" multiple="multiple" name="file">
										<label for="file">파일첨부</label> 
										 <span id="checkfile">선택된 파일이 없습니다.</span> 
										<p>
											<input type="checkbox" id="checkbox01" ><label for="checkbox01" class="checkbox"></label>
											<input type="checkbox" id="checkbox02" ><label for="checkbox02" class="checkbox"></label>
										</p>
										<a href="#a" id="fileDelete" ><img src="resources/images/delete_icon.png" alt="삭제 아이콘"></a> 
									</td>
								</tr>
								<tr>
									<td>내용</td>
									<td><textarea name="intContent" id="intContent" cols="30" rows="10"></textarea>
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
CKEDITOR.replace('intContent',{
	filebrowserUploadUrl:"<c:url value='/ckImage'/>"
});
</script>
</div>
</div>
</section>
