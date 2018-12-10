<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9c33dafb379eb8e557de8b4964389518&libraries=services"></script>
<script>
function del(){
if(confirm("삭제하시겠습니까?")){ 
    location.href="<c:url value='/festival/fesDelete?fesNum=${FestivalVo.fesNum }'/>";
   }else{
    return false;
   }
}
</script>

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
							<h2>제목 :${FestivalVo.fesTitle }</h2>
							<ul>
								<li>작성자<span> ${FestivalVo.fesWrite}</span></li>
								<li>게시일자<span><fmt:formatDate value="${FestivalVo.fesDate}" pattern="yyyy-MM-dd"/></span></li>
								<li>조회수<span>${FestivalVo.fesHit}</span></li>
							</ul>
						</div>
						<div id="board">
							<div id="writing">
							 <c:out value="${FestivalVo.fesContent}" escapeXml="false"/>
							 	 <c:if test="${FestivalVo.fesMap != null }">
							<div>
								장소 : ${FestivalVo.fesMap }
								<div id="map" style="width:350px;height:250px;"></div>
							</div>
							</c:if>
							</div>
							<ul>
								
								
								<li>
									<span>이전 글</span>
									<c:choose>
									<c:when test="${prev.fesTitle eq null}">
									<a href="#">이전글이 없습니다.</a>
									</c:when>
									<c:otherwise>
										<a href="<c:url value='/festival/fesDetail?fesNum=${prev.fesNum }'/>">${prev.fesTitle }</a>
									</c:otherwise>
									</c:choose>
								</li>
								<li>
									<span>다음 글</span>
									<c:choose>
									<c:when test="${next.fesTitle eq null}">
									<a href="#">다음글이 없습니다.</a>
									</c:when>
									<c:otherwise>
										<a href="<c:url value='/festival/fesDetail?fesNum=${next.fesNum }'/>">${next.fesTitle }</a>
									</c:otherwise>
									</c:choose>
								</li>
								<li>
									<span>첨부파일</span>
								
								<c:forEach var="list" items="${FestivalVo.list}">
								<a href="<c:url value='/festival/fileDown?fileNum=${list.fileNum }'/>">${list.fileOrgName }</a>
								</c:forEach>
								</li>
								
							</ul>
						</div>
					<c:if test="${sessionScope.member.memNickName eq FestivalVo.fesWrite }">  
						 <a id="list" onclick="del()">삭제</a>
						 </c:if> 
						 <a id="list"href="<c:url value='/festival/list'/>">목록</a>
					</div>
					        <input type="hidden" name="fesNum" value="${FestivalVo.fesNum}">
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
	geocoder.addressSearch('${Festival.fesMap}', function(result, status) {
	
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