<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
	<link rel="stylesheet" href="<c:url value='/resources/css/community_QNA03.css'/>">
<section>
<script src="<c:url value='/resources/ckeditor/ckeditor.js'/>"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9c33dafb379eb8e557de8b4964389518&libraries=services"></script>
<script>
var num=1;
$(function(){
	
	$(".btnSave").click(function(){
		if($("#ntTitle").val()==""){
			alert("제목을 적어주세요.");
			return false;
		}
		var ckeditor = CKEDITOR.instances['ntContent']; 
		if (ckeditor.getData()=="")
		{
		 alert('내용을 입력 하세요');
		 ckeditor.focus();
		 return;
		}
		//태그.each(function(){})모든 태그 반복
		var str="";
		//폼에 hidden 태그들을 추가
		$("#form").append(str);
		document.form.submit();
	});
	$(".btnList").click(function(){
		/*location.href="${path}/board/list.do";
		//document.form.action="${path}/board/list.do";
		//document.form.submit(); */
		document.form.action="<c:url value='/notice/list.do'/>";
		document.form.submit();
	});

});
function fileselect(event,num){
	   var filename=event.value.replace(/C:\\fakepath\\/i, '');
	   $("#span"+num).remove();
	   $("#li"+num).append("<span id='span"+num+"'>"+filename+""+
	         "<button class='img_del' onclick='fileDel("+num+")'>x</button>"+
	         "<button class='img_add' onclick='fileAdd()' type='button'>추가</button></span>");
	if(event.files.length==0){
	      $("#span"+num).remove();
	   }
	}
	function fileAdd(){

	   $("#fileul").append("<li id='li"+num+"'>"+
	         "<div class='filebox dp_in vm mgr10'>"+
	         "<label for='filename"+num+"' class='btn_search'>파일첨부</label>"+
	         "<input type='file' id='filename"+num+"' name='file"+num+"' class='upload_hidden' onchange='fileselect(this,"+num+")'>"+
	         "</div>"+
	         "</li>");
	   num++;
	}



	function fileDel(num){
	   console.log(num);
	   //첫번째 파일일 경우 파일첨부하는 라벨과 input 박스가 날아가면 안되므로.
	   if(num==0){
	      $("#span"+num).remove();
	      $("#filelabel"+num).prepend("<input type='file' id='filename"+num+"' name='file"+num+"' class='upload_hidden' onchange='fileselect(this,"+num+")'>");
	      
	   }else if(num!=0){
	      $("#li"+num).remove();
	      }
	}
	function firstFileSelect(event,num){
	   var filename=event.value.replace(/C:\\fakepath\\/i, '');
	   $("#span"+num).remove();
	   $("#li"+num).append("<span id='span"+num+"'>"+filename+""+
	   "<button class='img_del' id='delbutton' onclick='fileDel("+num+")'>x</button>"+
	   "<button class='img_add' id='addbutton' onclick='fileAdd()' type='button'>추가</button></span>");
	   if(event.files.length==0){
	      $("#span"+num).remove();
	   }
	}
</script>

<div id="sectionC">
<div id="subMenu">
					<h2>커뮤니티</h2>
					<ul>
						<li><a href="<c:url value='/notice/list.do'/>" class="subActive">공지사항 <img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="<c:url value='/freeboard/list.do'/>">자유게시판<img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="<c:url value='/review/rvList'/>">후기게시판</a></li>
						<li><a href="<c:url value='/qaboard/list.do'/>">질문게시판<img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
					</ul>
</div>

<div id="sectionR">
					<div id="contentHeader">
						<h2>공지사항</h2>
					</div>
					
<form id="form" name="form" method="post" enctype="multipart/form-data"
action="<c:url value='/notice/insert.do'/>">
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
										<input type="text" name="ntTitle" id="ntTitle">
									</td>
								</tr>
								<tr>
									<td>작성자</td>
									<td><input type="hidden" name="ntWriter" value="${member.memNickName}" /> ${member.memNickName}</td>
								</tr>
								<tr>
		                        <td>첨부파일</td>
		                        <td>
		                           <div class="img_upload_list">
		                              <ul id="fileul">
		                                 <li id="li0">
		                                    <div class="filebox dp_in vm mgr10">
		                                       <label id="filelabel" for="filename0" class="btn_search">파일첨부</label>
		                                        <input type="file" id="filename0" id="file" name="file0" class="upload-hidden" onchange="firstFileSelect(this,0)">
		                                     </div>
		                                 </li>
		                              </ul>
		                           </div>
		                        </td>
		                       </tr>
								<tr>
									<td>내용</td>
									<td><textarea name="ntContent" id="ntContent" cols="30" rows="10"></textarea>
									</td>
								</tr>
								<tr>
									<td>지도첨부</td>
									<td><input type="text" name="ntMap" id="searchWordBox" style="width:80%" placeholder="주소를 입력해주세요."/>
									
												<label id="searchBtn" style="float:none;">검색</label>
										<div id="mapDiv" style="display:none">
											<div id="map" style="width:720px;height:210px;"></div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>

				
						<ul>
							<li>
								<a id="input"  class="btnSave">등록</a>
							</li>
							<li>
								<a id="cancel"  class="btnList">취소</a>
							</li>
						</ul>
	
</div>	
</form>
<script>
CKEDITOR.replace('ntContent',{
	filebrowserUploadUrl:"<c:url value='/ckImage'/>"
});

$('#searchBtn').on('click',function(){
	var searchWord = $('#searchWordBox').val();
	test(searchWord);
	$('#mapDiv').show();
	$('#map').relayout();
})

function test(searchWord){
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
	geocoder.addressSearch(searchWord, function(result, status) {
	
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
}


</script>
</div>
</div>
</section>