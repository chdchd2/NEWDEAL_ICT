<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<section>
<div id="sectionC">
 <div id="subMenu">
					<h2>취업지원센터</h2>
					<ul>
						<li><a href="<c:url value='/festival/list'/>">행사안내 <img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="<c:url value='/festival/detailList'/>" class="subActive">채용정보</a></li>
					</ul>
				</div> 
<div id="sectionR">
					<div id="contentHeader">
						<h2>채용정보상세</h2>				
					</div>
						<div id="content">
						
						<a href="">[ 전체 ]</a>&emsp;|
						&emsp;<a href="javascript:fnWmTab('0');">경제/교육</a>&emsp;|  
						&emsp;<a href="">IT/혁신</a>&emsp;|
						&emsp;<a href="">문화/복지</a>&emsp;|
						&emsp;<a href="">환경/안전</a>&emsp;|
						&emsp;<a href="">[ 기타 ]</a>&emsp;
		
						
							<p id="count">총<span>${pu.totalRowCount}건</span></p>
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
							 <c:forEach var="FesDetailVo" items="${list}">
								<tr>
									<td>${FesDetailVo.detNum}</td>
									<td><a href="<c:url value='/festival/detDetail?detNum=${FesDetailVo.detNum }'/>">[ ${FesDetailVo.detPart} ]  ${FesDetailVo.detTitle}</a></td>
									 <td>${FesDetailVo.detWriter}</td>
      								  <td>${FesDetailVo.detDate}</td>
       								 <td>${FesDetailVo.hit}</td>
								</tr>
								</c:forEach>
								</tbody>
								</table>
<c:if test="${sessionScope.member != null }"> 
  <a id="list" href="<c:url value='/festival/detailwrite'/>">글쓰기</a>
 </c:if>	
								
								<div id="page">
			<c:choose>
				<c:when test="${pu.startPageNum>9 }">
					<p><a href="<c:url value='/festival/detailList?pageNum=${pu.startPageNum-1 }&fieldnum=${fieldnum }&classnum=${classnum }'/>"><img src="<c:url value='/resources/images/page_Leftbtn.png'/>" alt="페이지왼쪽버튼"></a></p>
				</c:when>
				 <c:otherwise>
			<p><a href="#"><img src="<c:url value='/resources/images/page_Leftbtn.png'/>" alt="페이지왼쪽버튼"></a></p>			
	</c:otherwise>
			</c:choose>
			 
			<ul>
			<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
				<c:choose>
					<c:when test="${i==pu.pageNum}">
						<!-- 현재페이지 색상 다르게 표시하기 -->
						 <li><a href="<c:url value='/festival/detailList?pageNum=${i }&fieldnum=${fieldnum }&classnum=${classnum }'/>" class="pageActive">${i }</a></li>
					</c:when>
					<c:otherwise>
					 <li><a href="<c:url value='/festival/detailList?pageNum=${i }&fieldnum=${fieldnum }&classnum=${classnum }'/>">${i }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			</ul> 
			
			
			
		<c:choose>
			<c:when test="${pu.endPageNum<pu.totalPageCount }">
				<p><a href="<c:url value='/festival/detailList?pageNum=${pu.endPageNum+1 }&classnum=${classnum }&fieldnum=${fieldnum }'/>"><img src="<c:url value='/resources/images/page_Rightbtn.png'/>" alt="페이지오른쪽버튼"></a></p>
			</c:when>
			<c:otherwise>
			<p><a><img src="<c:url value='/resources/images/page_Rightbtn.png'/>" alt="페이지오른쪽버튼"></a></p>
			
	</c:otherwise>
		</c:choose>
		
						</div>
						
					
</div>


</div>
</div>
</section>

<ul>
		<c:choose>
				<c:when test="${pu.startPageNum>9 }">
				 <li><a href="<c:url value='/festival/detailList?pageNum=${pu.startPageNum-1 }&fieldnum=${fieldnum }&classnum=${classnum }'/>"><span aria-hidden="true">&laquo;</span></a></li>
				</c:when>
				<c:otherwise>
		<li><a href="#"><span>&laquo;</span></a> </li>
	</c:otherwise>
			</c:choose>
			

				<c:forEach var="i" begin="${pu.startPageNum }"
				end="${pu.endPageNum }">
				<c:choose>
					<c:when test="${i==pu.pageNum }">
						<!-- 현재페이지 색상 다르게 표시하기 -->
						 <li class="active"><a href="<c:url value='/festival/detailList?pageNum=${i }&fieldnum=${fieldnum }&classnum=${classnum }'/>">${i }</a></li>
					</c:when>
					<c:otherwise>
					 <li><a href="<c:url value='/festival/detailList?pageNum=${i }&fieldnum=${fieldnum }&classnum=${classnum }'/>">${i }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
	

		<c:choose>
			<c:when test="${pu.endPageNum<pu.totalPageCount }">
				  <li><a href="<c:url value='/festival/detailList?pageNum=${pu.endPageNum+1 }&classnum=${classnum }&fieldnum=${fieldnum }'/>" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
			</c:when>
			<c:otherwise>
		  <li><a href="#"><span>&raquo;</span></a></li>
	</c:otherwise>
		</c:choose>
</ul>



