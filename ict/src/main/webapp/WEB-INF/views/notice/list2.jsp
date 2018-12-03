<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/common_List.jsp" %> 
<script>
$(function(){
	$("#btnWrite").click(function(){
		location.href="${path}/notice/write.do";
	});
});
function list(page){
	
	
	location.href="${path}/notice/list.do?curPage="+page
			+"&search_option=${map.search_option}"
			+"&keyword=${map.keyword}";
}
function view(ntNum){
	document.form.ntNum.value=ntNum;
	document.form.action="${path}/notice/view.do";
	document.form.submit();
}
</script>
</head>
<body>

<%@ include file="../include/menu.jsp" %>
<%@ include file="../include/community_submenu.jsp" %>
<h2>공지사항</h2>

<!-- 검색폼 -->
<form name="form" method="post" 
action="${path}/notice/list.do">
총 ${map.count}건
	<select name="search_option">
		<c:choose>
			<c:when test="${map.search_option == 'all' }">
				<option value="all" selected>전체</option>
				<option value="ntWriter">이름</option>
				<option value="ntContent">내용</option>
				<option value="ntTitle">제목</option>
			</c:when>
			<c:when test="${map.search_option == 'ntWriter' }">
				<option value="all">전체</option>
				<option value="ntWriter" selected>이름</option>
				<option value="ntContent">내용</option>
				<option value="ntTitle">제목</option>
			</c:when>
			<c:when test="${map.search_option == 'ntContent' }">
				<option value="all">전체</option>
				<option value="ntWriter">이름</option>
				<option value="ntContent" selected>내용</option>
				<option value="ntTitle">제목</option>
			</c:when>
			<c:when test="${map.search_option == 'ntTitle' }">
				<option value="all">전체</option>
				<option value="ntWriter">이름</option>
				<option value="ntContent">내용</option>
				<option value="ntTitle" selected>제목</option>
			</c:when>
			<c:otherwise>
				<option value="all" selected>전체</option>
				<option value="ntWriter">이름</option>
				<option value="ntContent">내용</option>
				<option value="ntTitle">제목</option>
			</c:otherwise>
		</c:choose>	
	</select>
	<input type="text" name="keyword" value="${map.keyword}">
	<input type="submit" value="조회">
</form>
<table border="1" width="600px">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>이름</th>
		<th>날짜</th>
		<th>조회수</th>
	</tr>
	
<c:forEach var="row" items="${map.list}">
	<c:choose>
		<c:when test="${row.ntShow == 'Y' }">  
			<tr>
				<td>${row.ntNum}</td>
				<td>
				<a href="${path}/notice/view.do?ntNum=${row.ntNum}">${row.ntTitle}</a> 
				<%-- <a href="#" onclick="view('${row.bno}')">${row.title}</a> --%>
				</td>
				<td>${row.ntWriter}</td>
				<td><fmt:formatDate value="${row.ntRegdate}" pattern="yyyy.MM.dd "/></td>
				<td>${row.ntViewcnt}</td>
			</tr>
		</c:when>
		<c:otherwise>
			<!-- 숨김처리한 게시물 -->
			<tr>
				<td>${row.ntNum}</td>
				<td colspan="4" align="center">삭제된 게시물입니다.</td>
			</tr>
		</c:otherwise>
	</c:choose> 
</c:forEach>	
	<!-- 페이지 네비게이션 -->
	<tr>
		<td colspan="5" align="center">
	<c:if test="${map.pager.curBlock > 1 }">
		<a href="javascript:list('1')">[처음]</a>
	</c:if>	
	<c:if test="${map.pager.curBlock >= 1 }">
		<a href="javascript:list('${map.pager.prevPage}')">[이전]</a>
	</c:if>
	<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
		<c:choose>
			<c:when test="${num == map.pager.curPage}">
				<span style="color:red">${num}</span>&nbsp;
			</c:when>
			<c:otherwise>
				<a href="javascript:list('${num}')">${num}</a>&nbsp;
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${map.pager.curBlock <= map.pager.totPage}">
		<a href="javascript:list('${map.pager.nextPage}')">[다음]</a>
	</c:if>
	<c:if test="${map.pager.curPage <= map.pager.totPage}">
		<a href="javascript:list('${map.pager.totPage}')">[끝]</a>
	</c:if> 
		</td>
	</tr>
</table>

<c:if test="${sessionScope.member != null }">
	<button type="button" id="btnWrite">등록</button>
</c:if>
<!-- <button type="button" id="btnWrite">등록</button> -->

<form name="form" method="post">
	<input type="hidden" name="ntNum" />
</form>
</body>
</html>