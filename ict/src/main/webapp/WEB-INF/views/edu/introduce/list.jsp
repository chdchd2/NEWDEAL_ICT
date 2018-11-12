<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>


<h2>게시글 목록</h2>
<a href="<c:url value='/edu/intWrite'/>">글 작성하기</a>
<table border="1" width="600px">
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회수</th>
    </tr>
    <c:forEach var="vo" items="${list}">
    <tr>
        <td>${vo.intNum}</td>
        <td><a href="<c:url value='/edu/intDetail?intNum=${vo.intNum }'/>">${vo.intTitle}</a></td>
        <td>${vo.intWriter}</td>
        <td>${vo.intDate}</td>
        <td>${vo.intHit}</td>
    </tr>    
    </c:forEach>
</table>
<ul>
		<c:choose>
				<c:when test="${pu.startPageNum>9 }">
				 <li><a href="<c:url value='/edu/intList?pageNum=${pu.startPageNum-1 }&fieldnum=${fieldnum }&classnum=${classnum }'/>"><span aria-hidden="true">&laquo;</span></a></li>
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
						 <li class="active"><a href="<c:url value='/edu/intList?pageNum=${i }&fieldnum=${fieldnum }&classnum=${classnum }'/>">${i }</a></li>
					</c:when>
					<c:otherwise>
					 <li><a href="<c:url value='/edu/intList?pageNum=${i }&fieldnum=${fieldnum }&classnum=${classnum }'/>">${i }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
	

		<c:choose>
			<c:when test="${pu.endPageNum<pu.totalPageCount }">
				  <li><a href="<c:url value='/edu/intList?pageNum=${pu.endPageNum+1 }&classnum=${classnum }&fieldnum=${fieldnum }'/>" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
			</c:when>
			<c:otherwise>
		  <li><a href="#"><span>&raquo;</span></a></li>
	</c:otherwise>
		</c:choose>
</ul>

