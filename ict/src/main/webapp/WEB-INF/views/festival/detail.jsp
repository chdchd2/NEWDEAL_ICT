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
						<li><a href="<c:url value='/festival/list'/>" class="subActive">행사안내 <img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="<c:url value='/festival/detailList'/>">채용정보</a></li>
					</ul>
				</div>

				<div id="sectionR">
					<div id="contentHeader">
						<h2>취업정보안내</h2>
					</div>
					<form name="form" method="post">
					<div id="content">
						<div id="boardheader">
							<h2>${vo.intTitle }</h2>
							<ul>
								<li>작성자<span> ${member.memNickName}</span></li>
								<li>게시일자<span><fmt:formatDate value="${FestivalVo.fesDate}" pattern="yyyy-MM-dd"/></span></li>
								<li>조회수<span>${FestivalVo.fesHit}</span></li>
							</ul>
						</div>
						<div id="board">
							<div id="writing">
							 <c:out value="${FestivalVo.fesContent}" escapeXml="false"/>
							</div>
							<ul>
								
								
								<li>
									<span>이전 글</span>
									<a href="#a">이전 글이 없습니다.</a>
								</li>
								<li>
									<span>다음 글</span>
									<a href="#a">다음 글이 없습니다.</a>
								</li>
								<li>
									<span>첨부파일</span>
									<a href="#">abcd</a>
									<a href="#">bcde</a>
								<c:forEach var="list" items="${FestivalVo.list}">
								<a href="<c:url value='/festival/fileDown?fileNum=${list.fileNum }'/>">${list.fileOrgName }</a>
								</c:forEach>
								</li>
								
							</ul>
						</div>
						 <a id="list" href="<c:url value='/festival/fesDelete?fesNum=${FestivalVo.fesNum }'/>">삭제</a>
						 <a id="list"href="<c:url value='/festival/fesDelete?fesNum=${FestivalVo.fesNum }'/>" >목록</a>
					</div>
					        <input type="hidden" name="fesNum" value="${FestivalVo.fesNum}">
					</form>

				</div>
			</div>

	</section>

</body>