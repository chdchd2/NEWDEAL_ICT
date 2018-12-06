<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9c33dafb379eb8e557de8b4964389518&libraries=services"></script>
<script>
$(function(){
	
		
		$(".btnDelete").click(function(){
			if(confirm("삭제하시겠습니까?")){
				document.form.action="/ict/notice/delete.do";
				document.form.submit();
			}
		});
		$(".btnList").click(function(){
			/*location.href="${path}/board/list.do";
			//document.form.action="${path}/board/list.do";
			//document.form.submit(); */
			document.form.action="/ict/notice/list.do";
			document.form.submit();
		});

		$(".btnUpdate").click(function(){
			document.form.action="/ict/notice/updateView.do";
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
</script>
<section>
<div id="sectionC">
<div id="subMenu">
					<h2>커뮤니티</h2>
					<ul>
						<li><a href="<c:url value='/notice/list.do'/>" class="subActive">공지사항 <img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="<c:url value='/freeboard/list.do'/>">자유게시판<img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="#">후기게시판</a></li>
						<li><a href="<c:url value='/qaboard/list.do'/>">질문게시판<img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
					</ul>
</div>

<div id="sectionR">
					<div id="contentHeader">
						<h2>공지사항</h2>
					</div>
<form id="form" name="form" method="post"
<%-- action="${path}/notice/insert.do" --%>>
<div id="content">
						<div id="boardheader">
							<h2>${vo.ntTitle}</h2>
							<ul>
								<li>작성자<span>${vo.ntWriter}</span></li>
								<li>게시일자<span><fmt:formatDate value="${vo.ntRegdate}" pattern="yyyy-MM-dd"/></span></li>
								<li>조회수<span>${vo.ntViewcnt }</span></li>
							</ul>
						</div>
						<div id="board">
							<div id="writing">
							 <c:out value="${vo.ntContent}" escapeXml="false"/>
							 <c:if test="${vo.ntMap != null }">
							<div>
								장소 : ${vo.ntMap }
								<div id="map" style="width:350px;height:250px;"></div>
							</div>
							</c:if>
							</div>
							<ul>
								<li>
									<span>첨부파일</span>
								<c:choose>
								<c:when test="${fn:length(vo.list) > 0 }">
								<c:forEach var="list" items="${vo.list }">
								<a class="add_file" href="<c:url value='/notice/fileDown?fileNum=${list.fileNum }'/>">${list.fileOrgName }</a>
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
									<c:when test="${prev.ntTitle eq null}">
									<a href="#">이전글이 없습니다.</a>
									</c:when>
									<c:otherwise>
										<a href="<c:url value='/notice/view.do?ntNum=${prev.ntNum }'/>">${prev.ntTitle }</a>
									</c:otherwise>
									</c:choose>
								</li>
								<li>
									<span>다음 글</span>
									<c:choose>
									<c:when test="${next.ntTitle eq null}">
									<a href="#">다음글이 없습니다.</a>
									</c:when>
									<c:otherwise>
										<a href="<c:url value='/notice/view.do?ntNum=${next.ntNum }'/>">${next.ntTitle }</a>
									</c:otherwise>
									</c:choose>
								</li>
								
							</ul>
						</div>

	<div>
	<!-- 본인 게시물만 수정,삭제 버튼 표시 -->	
		<a id="list" class="btnList">목록</a>
	<c:if test="${sessionScope.member.memNickName == vo.ntWriter }"> 
		<a id="list" class="btnDelete">삭제</a>
		<a id="list" class="btnUpdate">수정</a>
	</c:if> 
	</div>
	</div>
	<!-- 수정, 삭제에 필요한 글번호를 hidden 태그에 저장 -->
		<input type="hidden" name="ntNum" value="${vo.ntNum}" />
	
</form>
</div>
</div>
</section>
<script>


	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 2 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${vo.ntMap}', function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === daum.maps.services.Status.OK) {
	
	        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new daum.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	       /*  var infowindow = new daum.maps.InfoWindow({
	            content: '<div display="none"></div>'
	        
	        });
	        infowindow.open(map, marker); */
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.relayout();
	        map.setCenter(coords);
	    } 
	});

</script>
</body>
