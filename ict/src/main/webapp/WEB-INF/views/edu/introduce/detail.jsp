<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<body>
<section>

			<div id="sectionC">
				<div id="subMenu">
					<h2>교육신청</h2>
					<ul>
						<li><a href="<c:url value='/edu/intList'/>" class="subActive">교육신청안내 <img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="<c:url value='/edu/detList'/>">프로그램상세</a></li>
						<li><a href="#">교육신청 바로가기</a></li>
					</ul>
				</div>

				<div id="sectionR">
					<div id="contentHeader">
						<h2>교육신청안내</h2>
					</div>
					<form name="form1" method="post">
					<div id="content">
						<div id="boardheader">
							<h2>${vo.intTitle }</h2>
							<ul>
								<li>작성자<span>${vo.intWriter}</span></li>
								<li>게시일자<span><fmt:formatDate value="${vo.intDate}" pattern="yyyy-MM-dd"/></span></li>
								<li>조회수<span>${vo.intHit }</span></li>
							</ul>
						</div>
						<div id="board">
							<div id="writing">
							 <c:out value="${vo.intContent}" escapeXml="false"/>
							</div>
							<ul>
								
								
								<li>
									<span>이전 글</span>
									<c:choose>
									<c:when test="${prev.intTitle eq null}">
									<a href="#">이전글이 없습니다.</a>
									</c:when>
									<c:otherwise>
										<a href="<c:url value='/edu/intDetail?intNum=${prev.intNum }'/>">${prev.intTitle }</a>
									</c:otherwise>
									</c:choose>
								</li>
								<li>
									<span>다음 글</span>
									<c:choose>
									<c:when test="${next.intTitle eq null}">
									<a href="#">다음글이 없습니다.</a>
									</c:when>
									<c:otherwise>
										<a href="<c:url value='/edu/intDetail?intNum=${next.intNum }'/>">${next.intTitle }</a>
									</c:otherwise>
									</c:choose>
								</li>
								<li>
									<span>첨부파일</span>
									
								<c:forEach var="list" items="${vo.list }">
								<a href="<c:url value='/edu/fileDown?fileNum=${list.fileNum }'/>" class="add_file">${list.fileOrgName }</a>
								</c:forEach>
								</li>
								
							</ul>
						</div>
						<c:if test="${member.memGrade==2 && member.memState=='allow' && sessionScope.member.memNickName eq vo.intWriter }">
						 <a id="list" href="<c:url value='/edu/intDelete?intNum=${vo.intNum }'/>">삭제</a>
						 <a id="list" href="<c:url value='/edu/intEdit?intNum=${vo.intNum }'/>">수정</a>
						 </c:if>
						<a id="list"href="<c:url value='/edu/intList'/>" >목록</a>
					</div>
					        <input type="hidden" name="bno" value="${vo.intNum}">
					</form>

				</div>
			</div>

	</section>

  
   
   
</body>