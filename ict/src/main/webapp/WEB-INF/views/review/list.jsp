<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<script>
		function tabMenu(rvPart){
			console.log(rvPart);
			var searchType=$("#searchType option:selected").val();
			var searchWord=$("#searchWord").val();
			//var detPart=$("#detPart");
			
			location.href="<c:url value='/review/rvList?searchType="+searchType+"&searchWord="+searchWord+"'/>";
		}
		
		function tabMenu2(rvPart){
			console.log(rvPart);
			  location.href="<c:url value='/review/rvList?rvPart="+rvPart+"'/>";
		}
		</script>
<section>
<div id="sectionC">
<div id="subMenu">
					<h2>커뮤니티</h2>
					<ul>
						<li><a href="<c:url value='/notice/list.do'/>" >공지사항 <img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="<c:url value='/freeboard/list.do'/>">자유게시판<img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="<c:url value='/review/rvList'/>" class="subActive">후기게시판</a></li>
						<li><a href="<c:url value='/qaboard/list.do'/>">질문게시판<img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
					</ul>
				</div>
<div id="sectionR">
					<div id="contentHeader">
						<h2>후기게시판 </h2>				
					</div>
						<div id="content">
						
							<p id="count">총<span>${pu.totalRowCount}건</span></p>
					<a href="<c:url value='/review/rvList'/>" >[ 전체 ]</a>&emsp;|
						&emsp;<a href="javascript:tabMenu2('현장후기');" >현장후기</a>&emsp;|
						&emsp;<a href="javascript:tabMenu2('교육후기');">교육후기</a>&emsp;|
						&emsp;<a href="javascript:tabMenu2('기타후기');">기타후기</a>&emsp;
							
								<ul id="search">
							<li>
								<select id="searchType">
								    <option value="RV_TITLE">제목</option>
								    <option value="RV_CONTENT">내용</option>
								</select>
								<input type="hidden" name="rvPart" id="rvPart" value="${rvPart }">
							</li>
							<li><input type="text" name="searchWord" id="searchWord" value="${searchWord }"></li>
							<li><a onclick="tabMenu(rvPart)">조회</a></li>
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
									<td>${vo.rvNum}</td>
									<td><a href="<c:url value='/review/rvDetail?rvNum=${vo.rvNum }'/>">[ ${vo.rvPart} ]  ${vo.rvTitle}</a></td>
									 <td>${vo.rvWriter}</td>
      								  <td>${vo.rvDate}</td>
       								 <td>${vo.rvHit}</td>
								</tr>
								</c:forEach>
								</tbody>
								</table>
								
								
								<div id="page">
			<c:choose>
				<c:when test="${pu.startPageNum>9 }">
					<p><a href="<c:url value='/review/rvList?pageNum=${pu.startPageNum-1 }&fieldnum=${fieldnum }&classnum=${classnum }&searchWord=${searchWord }&searchType=${searchType }&rvPart=${rvPart }'/>"><img src="<c:url value='/resources/images/page_Leftbtn.png'/>" alt="페이지왼쪽버튼"></a></p>
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
						 <li><a href="<c:url value='/review/rvList?pageNum=${i }&fieldnum=${fieldnum }&classnum=${classnum }&searchWord=${searchWord }&searchType=${searchType }&rvPart=${rvPart }'/>" class="pageActive">${i }</a></li>
					</c:when>
					<c:otherwise>
					 <li><a href="<c:url value='/review/rvList?pageNum=${i }&fieldnum=${fieldnum }&classnum=${classnum }&searchWord=${searchWord }&searchType=${searchType }&rvPart=${rvPart }'/>">${i }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			</ul> 
			
			
			
		<c:choose>
			<c:when test="${pu.endPageNum<pu.totalPageCount }">
				<p><a href="<c:url value='/review/rvList?pageNum=${pu.endPageNum+1 }&classnum=${classnum }&fieldnum=${fieldnum }&searchWord=${searchWord }&searchType=${searchType }&rvPart=${rvPart }'/>"><img src="<c:url value='/resources/images/page_Rightbtn.png'/>" alt="페이지오른쪽버튼"></a></p>
			</c:when>
			<c:otherwise>
			<p><a><img src="<c:url value='/resources/images/page_Rightbtn.png'/>" alt="페이지오른쪽버튼"></a></p>
			
	</c:otherwise>
		</c:choose>
		
						</div>
						
						<c:if test="${sessionScope.member != null }">
						<p id="submit">
							<a href="<c:url value='/review/rvWrite'/>">등록</a>
						</p>
						</c:if>
					
					
</div>


</div>
</div>
</section>



