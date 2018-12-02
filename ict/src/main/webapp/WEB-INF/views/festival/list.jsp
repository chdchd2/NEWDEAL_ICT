<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<script>
function searchs(){
	var searchType=$("#searchType option:selected").val();
	var searchWord=$("#searchWord").val();
 	location.href="<c:url value='/festival/list?searchType="+searchType+"&searchWord="+searchWord+"'/>";
}
</script>
<section>
<div id="sectionC">
 <div id="subMenu">
					<h2>취업지원센터</h2>
					<ul>
						<li><a href="<c:url value='/festival/list'/>" class="subActive">행사안내 <img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="<c:url value='/festival/detailList'/>">채용정보</a></li>
					</ul>
				</div> 
<div id="sectionR">
					<div id="contentHeader">
						<h2>취업행사게시판</h2>				
					</div>
						<div id="content">
						<!-- 	<p id="count">총<span>134건</span></p> -->
							<ul id="search">
							<li>
								<select id="searchType">
								    <option value="FES_TITLE">제목</option>
								    <option value="FES_CONTENT">내용</option>
								</select>
							</li>
							<li><input type="text" name="searchWord" id="searchWord" value="${searchWord }"></li>
							<li><a onclick="searchs()">조회</a></li>
							</ul>
							
							<table id ="table">
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
									<td>작성자</td>
									<td>작성일</td>
									<td>조회수</td>
								</tr>
							</thead>
							<tbody>
								
			<c:forEach var="FestivalVo" items="${list}">

			<tr>
				<td>${FestivalVo.fesNum}</td>
				<td>
				<a href="<c:url value='/festival/fesDetail?fesNum=${FestivalVo.fesNum}'/>">${FestivalVo.fesTitle}</a> 
				</td>
				<td>${FestivalVo.fesWrite}</td>
				<td>${FestivalVo.fesDate}</td>
				<td><span class="badge bg-red">${FestivalVo.fesHit}</span></td>
			</tr>
			</c:forEach>
				
								</tbody>
								</table>
 <c:if test="${sessionScope.member != null }"> 
  <a id="list" href="<c:url value='/festival/write'/>">글쓰기</a>
 </c:if> 					
								<div id="page">
							<!-- <p><a href="#a"><img src="images/page_Leftbtn.png" alt="페이지왼쪽버튼"></a></p> -->
			<c:choose>
				<c:when test="${pu.startPageNum>9 }">
				<p><a href="<c:url value='/festival/list?pageNum=${pu.startPageNum-1 }&fieldnum=${fieldnum }&classnum=${classnum }&searchWord=${searchWord }&searchType=${searchType }'/>"><img src="<c:url value='/resources/images/page_Leftbtn.png'/>" alt="페이지왼쪽버튼"></a></p>		
				</c:when>
				<c:otherwise>
			<p><a href="#"><img src="<c:url value='/resources/images/page_Leftbtn.png'/>" alt="페이지왼쪽버튼"></a></p>			
	</c:otherwise>
			</c:choose>
			
			<ul>
			<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
				<c:choose>
					<c:when test="${i==pu.pageNum }">
						<!-- 현재페이지 색상 다르게 표시하기 -->
						 <li><a href="<c:url value='/festival/list?pageNum=${i }&fieldnum=${fieldnum }&classnum=${classnum }&searchWord=${searchWord }&searchType=${searchType }'/>" class="pageActive">${i }</a></li>
						</c:when>
					<c:otherwise>
					 <li><a href="<c:url value='/festival/list?pageNum=${i }&fieldnum=${fieldnum }&classnum=${classnum }'/>">${i }</a></li>
					</c:otherwise> 
				</c:choose>
			</c:forEach>
			</ul> 
			
		<c:choose>
			<c:when test="${pu.endPageNum<pu.totalPageCount }">
			<p><a href="<c:url value='/festival/list?pageNum=${pu.endPageNum+1 }&classnum=${classnum }&fieldnum=${fieldnum }&searchWord=${searchWord }&searchType=${searchType }'/>"><img src="<c:url value='/resources/images/page_Rightbtn.png'/>" alt="페이지오른쪽버튼"></a></p>
			</c:when>
			<c:otherwise>
			<p><a href="#"><img src="<c:url value='/resources/images/page_Rightbtn.png'/>" alt="페이지오른쪽버튼"></a></p>
		</c:otherwise>
		</c:choose>

						</div>				
</div>

</div>
</div>
</section>
