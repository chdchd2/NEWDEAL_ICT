<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<section>
<div id="sectionC">
<div id="subMenu">
					<h2>교육신청</h2>
					<ul>
						<li><a href="<c:url value='/edu/intList'/>">교육신청안내 <img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="<c:url value='/edu/detailList'/>" class="subActive">프로그램상세<img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="#">교육신청 바로가기</a></li>
					</ul>
				</div>
<div id="sectionR">
					<div id="contentHeader">
						<h2>프로그램상세</h2>				
					</div>
						<div id="content">
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
							 <c:forEach var="vo" items="${list}">
								<tr>
									<td>${vo.detNum}</td>
									<td><a href="<c:url value='/edu/detail?detNum=${vo.detNum }'/>">${vo.detTitle}</a></td>
									 <td>${vo.detWriter}</td>
      								  <td>${vo.detDate}</td>
       								 <td>${vo.hit}</td>
								</tr>
								</c:forEach>
								</tbody>
								</table>
								
								
								<div id="page">
			<c:choose>
				<c:when test="${pu.startPageNum>9 }">
					<p><a href="<c:url value='/edu/detailList?pageNum=${pu.startPageNum-1 }&fieldnum=${fieldnum }&classnum=${classnum }'/>"><img src="<c:url value='/resources/images/page_Leftbtn.png'/>" alt="페이지왼쪽버튼"></a></p>
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
						 <li><a href="<c:url value='/edu/detailList?pageNum=${i }&fieldnum=${fieldnum }&classnum=${classnum }'/>" class="pageActive">${i }</a></li>
					</c:when>
					<c:otherwise>
					 <li><a href="<c:url value='/edu/detailList?pageNum=${i }&fieldnum=${fieldnum }&classnum=${classnum }'/>">${i }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			</ul> 
			
			
			
		<c:choose>
			<c:when test="${pu.endPageNum<pu.totalPageCount }">
				<p><a href="<c:url value='/edu/detailList?pageNum=${pu.endPageNum+1 }&classnum=${classnum }&fieldnum=${fieldnum }'/>"><img src="<c:url value='/resources/images/page_Rightbtn.png'/>" alt="페이지오른쪽버튼"></a></p>
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
				 <li><a href="<c:url value='/edu/detailList?pageNum=${pu.startPageNum-1 }&fieldnum=${fieldnum }&classnum=${classnum }'/>"><span aria-hidden="true">&laquo;</span></a></li>
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
						 <li class="active"><a href="<c:url value='/edu/detailList?pageNum=${i }&fieldnum=${fieldnum }&classnum=${classnum }'/>">${i }</a></li>
					</c:when>
					<c:otherwise>
					 <li><a href="<c:url value='/edu/detailList?pageNum=${i }&fieldnum=${fieldnum }&classnum=${classnum }'/>">${i }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
	

		<c:choose>
			<c:when test="${pu.endPageNum<pu.totalPageCount }">
				  <li><a href="<c:url value='/edu/detailList?pageNum=${pu.endPageNum+1 }&classnum=${classnum }&fieldnum=${fieldnum }'/>" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
			</c:when>
			<c:otherwise>
		  <li><a href="#"><span>&raquo;</span></a></li>
	</c:otherwise>
		</c:choose>
</ul>



