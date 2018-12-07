<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<body>
<script>

function comment(){
	var comContent=$("#comContent").val();
	var memNum=$("#memNum").val();
	var comBnum=${vo.rvNum};
	console.log(comContent);
	
	$.ajax({
	type:"GET",
	url:encodeURI("<c:url value='/review/comment.do?comContent="+comContent+"&memNum="+memNum+"&comBnum="+comBnum+"'/>"),
	dataType:"json",
	success:function(data){
		console.log(data);
		
		$("#comContent").val("");
		$("#commentlist").text("");
		for(var i=0; i<data.commentList.length; i++){
		$("#commentlist").append(data.commentList[i].memNickName+"♥♥♥"+data.commentList[i].comContent+data.commentList[i].comDate+"<br>");	
			
		}

	}
}); 
}

var rvNum = '${vo.rvNum}';
function comDel(comNum) {
    if (!confirm("댓글을 삭제하시겠습니까?")) {
        return;
    }
	console.log(comNum);
	location.href="/ict/review/rvDetail?rvNum="+rvNum;
	 $.ajax({
		type:"POST",
		url:encodeURI("<c:url value='/review/comDel?comNum="+comNum+"'/>"),
		dataType:"json",
		success:function(data){
			if(data == 1)commentList(fbNum);
		}
	}); 
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
						<h2>후기게시판</h2>
					</div>
					<form name="form1" method="post">
					<div id="content">
						<div id="boardheader">
							<h2>[ ${vo.rvPart} ] ${vo.rvTitle }</h2>
							<ul>
								<li>작성자<span>${vo.rvWriter}</span></li>
								<li>게시일자<span><fmt:formatDate value="${vo.rvDate}" pattern="yyyy-MM-dd"/></span></li>
								<li>조회수<span>${vo.rvHit }</span></li>
							</ul>
						</div>
						<div id="board">
							<div id="writing">
							 <c:out value="${vo.rvContent}" escapeXml="false"/>
							</div>
							<ul>
								<li>
									<span>첨부파일</span>
								<c:choose>
								<c:when test="${fn:length(vo.list) > 0 }">
								<c:forEach var="list" items="${vo.list }">
								<a class="add_file" href="<c:url value='/freeboard/fileDown?fileNum=${list.fileNum }'/>">${list.fileOrgName }</a>
								</c:forEach>																
								</c:when>
								<c:otherwise>
								<a href="#a">첨부파일이 없습니다.</a>
								</c:otherwise>
								</c:choose>
								</li>
								
								
								<li>
									<span>이전 글</span>
									<c:choose>
									<c:when test="${prev.rvTitle eq null}">
									<a href="#">이전글이 없습니다.</a>
									</c:when>
									<c:otherwise>
										<a href="<c:url value='/review/rvDetail?rvNum=${prev.rvNum }'/>">${prev.rvTitle }</a>
									</c:otherwise>
									</c:choose>
								</li>
								<li>
									<span>다음 글</span>
									<c:choose>
									<c:when test="${next.rvTitle eq null}">
									<a href="#">다음글이 없습니다.</a>
									</c:when>
									<c:otherwise>
										<a href="<c:url value='/review/rvDetail?rvNum=${next.rvNum }'/>">${next.rvTitle }</a>
									</c:otherwise>
									</c:choose>
								</li>
								
							</ul>
						</div>
						<c:if test="${sessionScope.member.memNickName == vo.rvWriter}">
						 <a id="list" href="<c:url value='/review/rvDelete?rvNum=${vo.rvNum }'/>">삭제</a>
						 <a id="list" href="<c:url value='/review/rvEdit?rvNum=${vo.rvNum }'/>">수정</a>
						 </c:if>
						<a id="list"href="<c:url value='/review/rvList'/>" >목록</a>
						</div>
					        <input type="hidden" name="rvNum" value="${vo.rvNum}">
		
						<!-- 댓글 -->	
						<span id="commentlist">
						<c:forEach var="comment" items="${commentList}">
						 	<colgroup>
								<col>
								<col>
								<col>
							</colgroup>
							<thead>
								<tr>
								<td><input type="hidden" id="comNum" value="${comment.comNum }" /></td>
									<td>${comment.memNickName} |</td>
									<td>${comment.comContent} |</td>
									<td><span>${comment.comDate}</span></td>
									<c:if test="${sessionScope.member.memNickName == comment.memNickName }"> 
										<td><input type="button" value="삭제" onclick="comDel(${comment.comNum});" /></td><br>
										<!--<td><a class="comDel">삭제</a></td><br> -->
									</c:if>
									<c:if test="${sessionScope.member.memNickName != comment.memNickName }"> 
										<br>
									</c:if>
									
								</tr>
							</thead>
							<%-- ${comment.memNickName} ===>${comment.comContent} ${comment.comDate} <br>  --%>
						</c:forEach>
						</span>
						<div id="comment">
							댓글쓰기 : <textarea id="comContent"></textarea>
							<input type="hidden" value="${sessionScope.member.memNum }" id="memNum">
							<a onclick="comment()">등록</a>
						</div>
					</form>

				</div>
			</div>

	</section>

  
   
   
</body>