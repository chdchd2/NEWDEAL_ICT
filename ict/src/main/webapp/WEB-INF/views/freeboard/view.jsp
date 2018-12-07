<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script>
$(function(){
	
		
		$(".btnDelete").click(function(){
			if(confirm("삭제하시겠습니까?")){
				document.form.action="/ict/freeboard/delete.do";
				document.form.submit();
			}
		});
		$(".btnList").click(function(){
			document.form.action="/ict/freeboard/list.do";
			document.form.submit();
		});

		$(".btnUpdate").click(function(){
		//첨부파일 이름들을 폼에 추가
			
			document.form.action="/ict/freeboard/updateView.do";
			document.form.submit();
		});
		
	 	$(".btnSave").click(function(){
			//태그.each(function(){})모든 태그 반복
			var str="";
			//폼에 hidden 태그들을 추가
			$("#form").append(str);
			document.form.submit();
		});
	 	
	 	
	  
});
function comment(){
	var comContent=$("#comContent").val();
	var memNum=$("#memNum").val();
	var comBnum=${vo.fbNum};
	console.log(comContent);
	
	$.ajax({
	type:"GET",
	url:encodeURI("<c:url value='/freeboard/comment.do?comContent="+comContent+"&memNum="+memNum+"&comBnum="+comBnum+"'/>"),
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

var fbNum = '${vo.fbNum}';
function comDel(comNum) {
    if (!confirm("댓글을 삭제하시겠습니까?")) {
        return;
    }
	console.log(comNum);
	location.href="/ict/freeboard/view.do?fbNum="+fbNum;
	 $.ajax({
		type:"POST",
		url:encodeURI("<c:url value='/freeboard/comDel?comNum="+comNum+"'/>"),
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
						<li><a href="<c:url value='/freeboard/list.do'/>" class="subActive">자유게시판<img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="<c:url value='/review/rvList'/>">후기게시판</a></li>
						<li><a href="<c:url value='/qaboard/list.do'/>">질문게시판<img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
					</ul>
</div>

<div id="sectionR">
					<div id="contentHeader">
						<h2>자유게시판</h2>
					</div>
<form id="form" name="form" method="post"
<%-- action="${path}/notice/insert.do" --%>>
<div id="content">
						<div id="boardheader">
							<h2>${vo.fbTitle}</h2>
							<ul>
								<li>작성자<span>${vo.fbWriter}</span></li>
								<li>게시일자<span><fmt:formatDate value="${vo.fbRegdate}" pattern="yyyy-MM-dd"/></span></li>
								<li>조회수<span>${vo.fbViewcnt }</span></li>
							</ul>
						</div>
						<div id="board">
							<div id="writing">
							 <c:out value="${vo.fbContent}" escapeXml="false"/>
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
									<c:when test="${prev.fbTitle eq null}">
									<a href="#">이전글이 없습니다.</a>
									</c:when>
									<c:otherwise>
										<a href="<c:url value='/freeboard/view.do?fbNum=${prev.fbNum }'/>">${prev.fbTitle }</a>
									</c:otherwise>
									</c:choose>
								</li>
								<li>
									<span>다음 글</span>
									<c:choose>
									<c:when test="${next.fbTitle eq null}">
									<a href="#">다음글이 없습니다.</a>
									</c:when>
									<c:otherwise>
										<a href="<c:url value='/freeboard/view.do?fbNum=${next.fbNum }'/>">${next.fbTitle }</a>
									</c:otherwise>
									</c:choose>
								</li>
								
							</ul>
						</div>

	<div>
	<!-- 수정, 삭제에 필요한 글번호를 hidden 태그에 저장 -->
		<input type="hidden" name="fbNum" value="${vo.fbNum}" />
	<!-- 본인 게시물만 수정,삭제 버튼 표시 -->	
		<a id="list" class="btnList">목록</a>
	<c:if test="${sessionScope.member.memNickName == vo.fbWriter }"> 
		<a id="list" class="btnDelete">삭제</a>
		<a id="list" class="btnUpdate">수정</a>
	</c:if> 
	</div>
	</div>
		
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