<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
			
			document.form.action="/ict/qaboard/updateView.do";
			document.form.submit();
		});
		
		$(".btnReply").click(function(){
			document.form.action="/ict/qaboard/reply.do";
			document.form.submit();
			
		});
	
});
</script>
<section>
<div id="sectionC">
<div id="subMenu">
					<h2>커뮤니티</h2>
					<ul>
						<li><a href="<c:url value='/notice/list.do'/>" >공지사항 <img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="<c:url value='/freeboard/list.do'/>" >자유게시판<img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="<c:url value='/review/rvList'/>">후기게시판</a></li>
						<li><a href="<c:url value='/qaboard/list.do'/>" class="subActive">질문게시판<img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
					</ul>
</div>

<div id="sectionR">
					<div id="contentHeader">
						<h2>질문게시판</h2>
					</div>
<form id="form" name="form" method="post"
<%-- action="${path}/notice/insert.do" --%>>
<div id="content">
						<div id="boardheader">
							<h2>${vo.qaTitle}</h2>
							<ul>
								<li>작성자<span>${vo.qaWriter}</span></li>
								<li>게시일자<span><fmt:formatDate value="${vo.qaRegdate}" pattern="yyyy-MM-dd"/></span></li>
								<li>조회수<span>${vo.qaViewcnt }</span></li>
							</ul>
						</div>
						<div id="board">
							<div id="writing">
							 <c:out value="${vo.qaContent}" escapeXml="false"/>
							</div>
							<ul>
								<li>
									<span>첨부파일</span>
								<c:choose>
								<c:when test="${fn:length(vo.list) > 0 }">
								<c:forEach var="list" items="${vo.list }">
								<a class="add_file" href="<c:url value='/qaboard/fileDown?fileNum=${list.fileNum }'/>">${list.fileOrgName }</a>
								</c:forEach>																
								</c:when>
								<c:otherwise>
								<a href="#a">첨부파일이 없습니다.</a>
								</c:otherwise>
								</c:choose>
								</li>
								<li>
									<span>이전 글</span>
									<c:choose>
									<c:when test="${prev.qaTitle eq null}">
									<a href="#">이전글이 없습니다.</a>
									</c:when>
									<c:otherwise>
										<a href="<c:url value='/qaboard/view.do?qaNum=${prev.qaNum }'/>">${prev.qaTitle }</a>
									</c:otherwise>
									</c:choose>
								</li>
								<li>
									<span>다음 글</span>
									<c:choose>
									<c:when test="${next.qaTitle eq null}">
									<a href="#">다음글이 없습니다.</a>
									</c:when>
									<c:otherwise>
										<a href="<c:url value='/qaboard/view.do?qaNum=${next.qaNum }'/>">${next.qaTitle }</a>
									</c:otherwise>
									</c:choose>
								</li>
								
							</ul>
						</div>

		<a id="list" class="btnList">목록</a>
	<!-- 본인 게시물만 수정,삭제 버튼 표시 -->	
	<c:if test="${sessionScope.member.memNickName == vo.qaWriter }"> 
		<a id="list" class="btnDelete">삭제</a>
		<a id="list" class="btnUpdate">수정</a>
	</c:if> 
	</div>
	<!-- 수정, 삭제에 필요한 글번호를 hidden 태그에 저장 -->
		<input type="hidden" name="qaNum" value="${vo.qaNum}" />
	
</form>
</div>
</div>
</section>