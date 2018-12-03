<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/common_View.jsp" %>
<script src="${path}/include/js/common.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9c33dafb379eb8e557de8b4964389518&libraries=services"></script>
<script>
$(function(){
	
		
		$("#btnDelete").click(function(){
			if(confirm("삭제하시겠습니까?")){
				document.form.action="${path}/notice/delete.do";
				document.form.submit();
			}
		});
		$("#btnList").click(function(){
			/*location.href="${path}/board/list.do";
			//document.form.action="${path}/board/list.do";
			//document.form.submit(); */
			document.form.action="${path}/notice/list.do";
			document.form.submit();
		});

		$("#btnUpdate").click(function(){
			document.form.action="${path}/notice/updateView.do";
			document.form.submit();
		});
		
		$("#btnSave").click(function(){
			//태그.each(function(){})모든 태그 반복
			var str="";
			//폼에 hidden 태그들을 추가
			$("#form").append(str);
			document.form.submit();
		});
	

	
});
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>공지사항</h2>
<form id="form" name="form" method="post"
action="${path}/notice/insert.do">
<!-- 사용자 -->
		<div>
			조회수 : ${vo.ntViewcnt}
		</div> 
		<div>
			제목 : ${vo.ntTitle}
		</div>
		<div>
			작성자 : ${vo.ntWriter}
		</div>
		<div>
			작성일 : <fmt:formatDate value="${vo.ntRegdate}" pattern="yyyy.MM.dd"/> 
		</div>
		<div>
			내용 : ${vo.ntContent}
		</div>
		<c:if test="${vo.ntMap != null }">
		<div>
			장소 : ${vo.ntMap }
			<div id="map" style="width:300px;height:350px;"></div>
		</div>
		</c:if>
		<c:if test="${vo.ntMap == null }">
		장소 : 장소가 등록되지 않았습니다.
		</c:if>
	<!-- 	
		<div>
			첨부 파일
			첨부파일을 드래그할 영역
			<div class="fileDrop"></div>
			첨부파일 목록이 표시되는 영역
			<div id="uploadedList"></div>
		</div> -->

	<div>
	<!-- 수정, 삭제에 필요한 글번호를 hidden 태그에 저장 -->
		<input type="hidden" name="ntNum" value="${vo.ntNum}" />
	<!-- 본인 게시물만 수정,삭제 버튼 표시 -->	
	<c:if test="${sessionScope.member.memNickName == vo.ntWriter }"> 
		<button type="button" id="btnUpdate">수정</button>
		<button type="button" id="btnDelete">삭제</button>
	</c:if> 
		<button type="button" id="btnList">목록</button>
	</div>
</form>
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
</html>