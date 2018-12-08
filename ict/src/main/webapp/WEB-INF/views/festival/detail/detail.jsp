<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<body>
<section>

			<div id="sectionC">
				<div id="subMenu">
					<h2>취업정보게시판</h2>
					<ul>
						<li><a href="<c:url value='/festival/list'/>" >행사안내 <img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="<c:url value='/festival/detailList'/>" class="subActive">채용정보 <img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
					</ul>
				</div>

				<div id="sectionR">
					<div id="contentHeader">
						<h2>취업정보안내</h2>
					</div>
					<form name="form" method="post">
					<div id="content">
						<div id="boardheader">
							<h2>제목 :&ensp;[ ${FesDetailVo.detPart} ] ${FesDetailVo.detTitle }</h2>
							<ul>
								<li>작성자<span>${FesDetailVo.detWriter} </span></li>
								<li>게시일자<span><fmt:formatDate value="${FesDetailVo.detDate}" pattern="yyyy-MM-dd"/></span></li>
								<li>조회수<span>${FesDetailVo.hit}</span></li>
							</ul>
						</div>
						<div id="board">
							<div id="writing">
							 <c:out value="${FesDetailVo.detContent}" escapeXml="false"/>
							</div>
							<ul>
								
								
								<li>
									<span>이전 글</span>
									<c:choose>
									<c:when test="${prev.detTitle eq null}">
									<a href="#">이전글이 없습니다.</a>
									</c:when>
									<c:otherwise>
										<a href="<c:url value='/festival/detDetail?detNum=${prev.detNum }'/>">${prev.detTitle }</a>
									</c:otherwise>
									</c:choose>
								</li>
								<li>
									<span>다음 글</span>
									<c:choose>
									<c:when test="${next.detTitle eq null}">
									<a href="#">다음글이 없습니다.</a>
									</c:when>
									<c:otherwise>
										<a href="<c:url value='/festival/detDetail?detNum=${next.detNum }'/>">${next.detTitle }</a>
									</c:otherwise>
									</c:choose>
								</li>
								<li>
									<span>첨부파일</span>
		
								<c:forEach var="list" items="${FesDetailVo.list}">
								<a href="<c:url value='/festival/fileDown?fileNum=${list.fileNum }'/>">${list.fileOrgName }</a>
								</c:forEach>
								</li>
								
							</ul>
						</div>
						 <c:if test="${sessionScope.member != null }"> 
						 <a id="list" href="<c:url value='/festival/detDelete?detNum=${FesDetailVo.detNum}'/>">삭제</a>
						  </c:if>
						 <a id="list"href="<c:url value='/festival/detailList'/>">목록</a>
					</div>
					        <input type="hidden" name="fesNum" value="${FesDetailVo.detNum}">
					</form>

				</div>
			</div>

	</section>

</body>