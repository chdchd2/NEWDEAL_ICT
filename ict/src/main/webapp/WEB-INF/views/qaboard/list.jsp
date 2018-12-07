<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<section>
<script>
$(function(){
	$(".btnWrite").click(function(){
		location.href="/ict/qaboard/write.do";
	});
});
function list(page){
	location.href="/ict/qaboard/list.do?curPage="+page
	+"&search_option=${map.search_option}"
	+"&keyword=${map.keyword}";
}
function view(qaNum){
	document.form.qaNum.value=qaNum;
	document.form.action="/ict/qaboard/view.do";
	document.form.submit();
}
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

<form name="form" method="post" 
action="/ict/qaboard/list.do">
					<div id="content">
						<div id="tapMenu">
							<a href="<c:url value='/qaboard/list.do'/>" style="font-weight:bold">Q&A</a>&emsp;|&emsp;
							<a href="<c:url value='/qaboard/faq.do'/>">FAQ</a>
						</div>
						<p id="count">총<span>${map.count}건</span></p>
						
							<ul id="search">
								<li>
									<select id="searchType" name="search_option">
									<c:choose>
										<c:when test="${map.search_option == 'all' }">
											<option value="all" selected>전체</option>
											<option value="qaWriter">이름</option>
											<option value="qaContent">내용</option>
											<option value="qaTitle">제목</option>
										</c:when>
										<c:when test="${map.search_option == 'qaWriter' }">
											<option value="all">전체</option>
											<option value="qaWriter" selected>이름</option>
											<option value="qaContent">내용</option>
											<option value="qaTitle">제목</option>
										</c:when>
										<c:when test="${map.search_option == 'qaContent' }">
											<option value="all">전체</option>
											<option value="qaWriter">이름</option>
											<option value="qaContent" selected>내용</option>
											<option value="qaTitle">제목</option>
										</c:when>
										<c:when test="${map.search_option == 'qaTitle' }">
											<option value="all">전체</option>
											<option value="qaWriter">이름</option>
											<option value="qaContent">내용</option>
											<option value="qaTitle" selected>제목</option>
										</c:when>
										<c:otherwise>
											<option value="all" selected>전체</option>
											<option value="qaWriter">이름</option>
											<option value="qaContent">내용</option>
											<option value="qaTitle">제목</option>
										</c:otherwise>
									</c:choose>	
									</select>
								</li>
								<li><input type="text" name="keyword" id="searchWord" value="${searchWord }"></li>
								<li><a><input type="submit" value="조회"></a></li>
							
							</ul>
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
										<td>${row.qaNum}</td>
										<td>
										<a href="<c:url value='/qaboard/view.do?qaNum=${row.qaNum}'/>">${row.qaTitle}</a> 
										<%-- <a href="#" onclick="view('${row.bno}')">${row.title}</a> --%>
										</td>
										<td>${row.qaWriter}</td>
										<td><fmt:formatDate value="${row.qaRegdate}" pattern="yyyy.MM.dd "/></td>
										<td>${row.qaViewcnt}</td>
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

	<input type="hidden" name="qaNum" />

</div>	
</div>
</form>
</div>
</div>
</section>