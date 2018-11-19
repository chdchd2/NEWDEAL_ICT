<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/common_View.jsp"%>
<script src="${path}/include/js/common.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9c33dafb379eb8e557de8b4964389518&libraries=services"></script>
<script>
	$(function() {
	
		$("#btnUpdate").click(function() {
					//첨부파일 이름들을 폼에 추가
					var str = "";
					$("#uploadedList .file").each(
							function(i) {
								str += "<input type='hidden' name='ntFiles["
										+ i + "]' value='" + $(this).val()
										+ "'>";
							});
					$("#form").append(str);
					document.form.action = "${path}/notice/update.do";
					document.form.submit();
				});
		$("#btnList").click(function(){
			/*location.href="${path}/board/list.do";
			//document.form.action="${path}/board/list.do";
			//document.form.submit(); */
			document.form.action="${path}/notice/list.do";
			document.form.submit();
		});


	});
</script>
<style>
.fileDrop {
	width: 300px;
	height: 80px;
	border: 1px solid #ededed;
}
</style>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<h2>공지사항</h2>
	<form id="form" name="form" method="post"
		action="${path}/notice/insert.do">
		<!-- 사용자 -->
		<div>조회수 : ${vo.ntViewcnt}</div>
		<div>
			제목 <input name="ntTitle" value="${vo.ntTitle}" />
		</div>
		<div>
			작성자 : <input type="hidden" name="ntWriter"
				value="${member.memNickName}" /> ${member.memNickName}
		</div>
		<div>
			작성일 :
			<fmt:formatDate value="${vo.ntRegdate}" pattern="yyyy.MM.dd" />
		</div>
		<div style="width: 800px;">
			내용
			<textarea id="ntContent" name="ntContent" rows="3" cols="80">${vo.ntContent}</textarea>

		</div>
		<div>
			<c:if test="${vo.ntMap != null}">
			지도첨부<input type="text" name="ntMap" id="searchWordBox" value="${vo.ntMap }" />
				<button type="button" id="searchBtn">검색</button>
				<div id="map" style="width: 300px; height: 350px;"></div>
			</c:if>
			<c:if test="${vo.ntMap == null }">
			지도첨부<input type="text" name="ntMap" id="searchWordBox"/>
				<button type="button" id="searchBtn">검색</button>
				<div id="mapDiv" style="display: none">
					<div id="map" style="width: 300px; height: 350px;"></div>
				</div>
			</c:if>
		</div>
		<!-- <div>
			첨부 파일 :
			첨부파일을 드래그할 영역
			<div class="fileDrop"></div>
			첨부파일 목록이 표시되는 영역
			<div id="uploadedList"></div>
		</div> -->
		<div>
			<!-- 수정, 삭제에 필요한 글번호를 hidden 태그에 저장 -->
			<input type="hidden" name="ntNum" value="${vo.ntNum}" />
			<!-- 본인 게시물만 수정,삭제 버튼 표시 -->
			<%-- <c:if test="${sessionScope.member == vo.ntWriter }"> --%>
			<button type="button" id="btnUpdate">저장</button>
			<%-- </c:if> --%>
			<button type="button" id="btnList">취소</button>
		</div>
	</form>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
	<script>
		/* 
		 $('#searchBtn').on('click',function(){
		 var searchWord = $('#searchWordBox').val();
		 test(searchWord);
		 $('#mapDiv').show();
		 $('#map').relayout();
		 });





		 function test(searchWord){  */
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 2
		// 지도의 확대 레벨
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
					map : map,
					position : coords
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
		 $('#searchBtn').on('click',function(){
			 var searchWord = $('#searchWordBox').val();
			 test(searchWord);
			 $('#mapDiv').show();
			 $('#map').relayout();
			 });
		 function test(searchWord){
			 
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					level : 2
				// 지도의 확대 레벨
				};

				// 지도를 생성합니다    
				var map = new daum.maps.Map(mapContainer, mapOption);

				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new daum.maps.services.Geocoder();

				
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch(searchWord, function(result, status) {

					// 정상적으로 검색이 완료됐으면 
					if (status === daum.maps.services.Status.OK) {

						var coords = new daum.maps.LatLng(result[0].y, result[0].x);

						// 결과값으로 받은 위치를 마커로 표시합니다
						var marker = new daum.maps.Marker({
							map : map,
							position : coords
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
		 }
		 /* } */ 
	</script>
</body>
</html>