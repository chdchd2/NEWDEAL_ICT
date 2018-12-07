<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<script>
function searchs(){
	var searchType=$("#searchType option:selected").val();
	var searchWord=$("#searchWord").val();
	var companygubun=$("#companygubun").val();
	console.log(companygubun);
	location.href="<c:url value='/edu/detList?searchType="+searchType+"&searchWord="+searchWord+"&companygubun="+companygubun+"'/>";
}
</script>
<section>
<div id="sectionC">
<div id="subMenu">
					<h2>교육신청</h2>
					<ul>
						<li><a href="<c:url value='/edu/intList'/>" >교육신청안내 </a></li>
						<li><a href="<c:url value='/edu/detList'/>" class="subActive">프로그램상세<img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="#">교육신청 바로가기</a></li>
					</ul>
				</div>
<div id="sectionR">
					<div id="contentHeader">
						<h2>프로그램상세 </h2>				
					</div>
						<div id="content">
						<a href="<c:url value='/edu/detList'/>">[ 전체 ]</a>&emsp;|
						<c:forEach items="${companymember }" var="companymember">
						&emsp;<a href="<c:url value='/edu/detList?&companygubun=${companymember.memNickName }'/>">${companymember.memNickName }</a>&emsp;|
						</c:forEach>
							<p id="count">총<span>${pu.totalRowCount}건</span></p>
								<ul id="search">
							<li>
								<select id="searchType">
								    <option value="DET_TITLE">제목</option>
								    <option value="DET_CONTENT">내용</option>
								</select>
								<input type="hidden" name="companygubun" id="companygubun" value="${companygubun }">
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
							 <c:forEach var="vo" items="${list}">
								<tr>
									<td>${vo.detNum}</td>
									<td><a href="<c:url value='/edu/detDetail?detNum=${vo.detNum }'/>">${vo.detTitle}</a></td>
									 <td>${vo.detWriter}</td>
      								  <td>${vo.detDate}</td>
       								 <td>${vo.detHit}</td>
								</tr>
								</c:forEach>
								</tbody>
								</table>
								
								
								<div id="page">
			<c:choose>
				<c:when test="${pu.startPageNum>9 }">
					<p><a href="<c:url value='/edu/detList?pageNum=${pu.startPageNum-1 }&fieldnum=${fieldnum }&classnum=${classnum }&searchWord=${searchWord }&searchType=${searchType }&companygubun=${companygubun }'/>"><img src="<c:url value='/resources/images/page_Leftbtn.png'/>" alt="페이지왼쪽버튼"></a></p>
				</c:when>
				<c:otherwise>
			<p><a><img src="<c:url value='/resources/images/page_Leftbtn.png'/>" alt="페이지왼쪽버튼"></a></p>			
	</c:otherwise>
			</c:choose>
			
			<ul>
			<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
				<c:choose>
					<c:when test="${i==pu.pageNum }">
						<!-- 현재페이지 색상 다르게 표시하기 -->
						 <li><a href="<c:url value='/edu/detList?pageNum=${i }&fieldnum=${fieldnum }&classnum=${classnum }&searchWord=${searchWord }&searchType=${searchType }&companygubun=${companygubun }'/>" class="pageActive">${i }</a></li>
					</c:when>
					<c:otherwise>
					 <li><a href="<c:url value='/edu/detList?pageNum=${i }&fieldnum=${fieldnum }&classnum=${classnum }&searchWord=${searchWord }&searchType=${searchType }&companygubun=${companygubun }'/>">${i }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			</ul> 
			
			
			
		<c:choose>
			<c:when test="${pu.endPageNum<pu.totalPageCount }">
				<p><a href="<c:url value='/edu/detList?pageNum=${pu.endPageNum+1 }&classnum=${classnum }&fieldnum=${fieldnum }&searchWord=${searchWord }&searchType=${searchType }&companygubun=${companygubun }'/>"><img src="<c:url value='/resources/images/page_Rightbtn.png'/>" alt="페이지오른쪽버튼"></a></p>
			</c:when>
			<c:otherwise>
			<p><a><img src="<c:url value='/resources/images/page_Rightbtn.png'/>" alt="페이지오른쪽버튼"></a></p>
			
	</c:otherwise>
		</c:choose>
		
						</div>
						
						<c:if test="${member.memGrade==2 && member.memState=='allow'}">
						<p id="submit">
							<a href="<c:url value='/edu/detWrite'/>">등록</a>
						</p>
						</c:if>
					
					
</div>


</div>
</div>
</section>



