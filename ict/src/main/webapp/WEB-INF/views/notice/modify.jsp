<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
	<link rel="stylesheet" href="<c:url value='/resources/css/community_QNA03.css'/>">
<section>
<script src="<c:url value='/resources/ckeditor/ckeditor.js'/>"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9c33dafb379eb8e557de8b4964389518&libraries=services"></script>
<script>
	$(function() {
	
		$(".btnUpdate").click(function() {
					var str = "";
					$("#form").append(str);
					document.form.action = "/ict/notice/update.do";
					document.form.submit();
				});
		$(".btnList").click(function(){
			/*location.href="${path}/board/list.do";
			//document.form.action="${path}/board/list.do";
			//document.form.submit(); */
			document.form.action="/ict/notice/list.do";
			document.form.submit();
		});


	});
</script>


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
		action="/ict/notice/insert.do">
<div id="content">
<table>
							<colgroup>
								<col>
								<col>
							</colgroup>
							<tbody>
								<tr>
									<td>제목</td>
									<td>
										<input type="text" name="ntTitle" id="ntTitle" value="${vo.ntTitle}">
									</td>
								</tr>
								<tr>
									<td>작성자</td>
									<td><input type="hidden" name="ntWriter" value="${member.memNickName}" /> ${member.memNickName}</td>
								</tr>
								<tr>
									<td>내용</td>
									<td><textarea name="ntContent" id="ntContent" cols="30" rows="10">${vo.ntContent}</textarea>
									</td>
								</tr>
								<tr>
									<td>지도첨부</td>
									<td>
			<c:if test="${vo.ntMap != null}">
									<input type="text" name="ntMap" id="searchWordBox" value="${vo.ntMap }" />
										<label id="searchBtn">검색</label>
										<div id="map" style="width: 720px; height: 210px;"></div>
			</c:if>
			<c:if test="${vo.ntMap == null }">
									<input type="text" name="ntMap" id="searchWordBox"/>
										<label id="searchBtn">검색</label>
										<div id="mapDiv" style="display:none">
											<div id="map" style="width:720px;height:210px;"></div>
										</div>
			</c:if>						
									</td>
								</tr>
							</tbody>
						</table>

				
						<ul>
							<li>
								<a id="input"  class="btnUpdate">저장</a>
							</li>
							<li>
								<a id="cancel"  class="btnList">취소</a>
							</li>
						</ul>
	
			<input type="hidden" name="ntNum" value="${vo.ntNum}" />
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
</div>
</div>	
</section>