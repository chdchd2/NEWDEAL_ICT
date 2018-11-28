<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<section> 
<script>
$(function(){
	$(".btnWrite").click(function(){
		location.href="/ict/notice/write.do";
	}); 
});
function list(page){
	location.href="/ict/notice/list.do?curPage="+page
			+"&search_option=${map.search_option}"
			+"&keyword=${map.keyword}";
}
function view(ntNum){ 
	document.form.ntNum.value=ntNum;
	document.form.action="/ict/notice/view.do";
	document.form.submit();
}
</script>

<%-- <%@ include file="../include/menu.jsp" %>
<%@ include file="../include/community_submenu.jsp" %> --%>
<div id="sectionC">
<div id="subMenu">
					<h2>커뮤니티</h2>
					<ul>
						<li><a href="<c:url value='/notice/list.do'/>" class="subActive">공지사항 <img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="<c:url value='/freeboard/list.do'/>">자유게시판<img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="#">후기게시판</a></li>
						<li><a href="<c:url value='/qaboard/list.do'/>">질문게시판<img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
					</ul>
</div>

<div id="sectionR">
					<div id="contentHeader">
						<h2>공지사항</h2>
					</div>
<%-- <!-- 검색폼 -->
<form name="form" method="post" 
action="${path}/notice/list.do"> --%>
					<div id="content">
						<p id="count">총<span>${map.count}건</span></p>
						<ol id="search">
								<li><a href="#a">전체 <img src="<c:url value='/resources/images/search_Active.png'/>" alt="검색창더보기"></a>
									<ul id="detail">
										<li><a href="#a">전체</a></li>
										<li><a href="#a">제목</a></li>
										<li><a href="#a">내용</a></li>
									</ul>
								</li>
								<li><input type="text"></li>
								<li><a href="#a">조회</a></li>
							
							</ol>

						<table id="table">
						<colgroup>
							<col>
							<col>
							<col>
							<col>
						</colgroup>
						<thead>
							<tr>
								<td>번호</td>
								<td>제목</td>
								<td>이름</td>
								<td>날짜</td>
								<td>조회수</td>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="row" items="${map.list}">
									<tr>
										<td>${row.ntNum}</td>
										<td>
										<a href="<c:url value='/notice/view.do?ntNum=${row.ntNum}'/>">${row.ntTitle}</a> 
										<%-- <a href="#" onclick="view('${row.bno}')">${row.title}</a> --%>
										</td>
										<td>${row.ntWriter}</td>
										<td><fmt:formatDate value="${row.ntRegdate}" pattern="yyyy.MM.dd "/></td>
										<td>${row.ntViewcnt}</td>
									</tr>
						</c:forEach>	
						</tbody>
						</table>

						<div id="page">
	<!-- 페이지 네비게이션 -->
	<c:choose>
		<c:when test="${map.pager.curBlock >= 1 }">
			<p><a href="javascript:list('${map.pager.prevPage}')"><img src="<c:url value='/resources/images/page_Leftbtn.png'/>" alt="페이지왼쪽버튼"></a></p>
		</c:when>
		<c:otherwise>
			<p><a href="#"><img src="<c:url value='/resources/images/page_Leftbtn.png'/>" alt="페이지왼쪽버튼"></a></p>			
		</c:otherwise>
	</c:choose>
	
	<ul>
		<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
			<c:choose>
				<c:when test="${num == map.pager.curPage}">
					<li><a href="javascript:list('${num}')" class="pageActive">${num}</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="javascript:list('${num}')">${num}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</ul>
	<c:choose>
		<c:when test="${map.pager.curBlock <= map.pager.totPage}">
			<p><a href="javascript:list('${map.pager.nextPage}')"><img src="<c:url value='/resources/images/page_Rightbtn.png'/>" alt="페이지오른쪽버튼"></a></p>
		</c:when>
		<c:otherwise>
			<p><img src="<c:url value='/resources/images/page_Rightbtn.png'/>" alt="페이지오른쪽버튼"></p>
		</c:otherwise>
	</c:choose>

<c:if test="${sessionScope.member != null }">
	<a id="list" class="btnWrite">등록</a>
</c:if>
<!-- <button type="button" id="btnWrite">등록</button> -->

<form name="form" method="post">
	<input type="hidden" name="ntNum" />
</form>

</div>	
</div>
</div>
</div>
</section>