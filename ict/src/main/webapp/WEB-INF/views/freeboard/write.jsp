<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<link rel="stylesheet" href="<c:url value='/resources/css/community_QNA03.css'/>">
<section>
<script src="<c:url value='/resources/ckeditor/ckeditor.js'/>"></script>
<script>
var num=1;
$(function(){
	
	$(".btnSave").click(function(){
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
		document.form.action="/ict/freeboard/list.do";
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
/* function fileselect(event){
console.log(event.value);
	   var filename=event.value.replace(/C:\\fakepath\\/i, '');
	  console.log(filename);
	} */

	

</script>

<div id="sectionC">
<div id="subMenu">
					<h2>커뮤니티</h2>
					<ul>
						<li><a href="<c:url value='/notice/list.do'/>">공지사항 <img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="<c:url value='/freeboard/list.do'/>" class="subActive">자유게시판<img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="<c:url value='/review/rvList'/>">후기게시판</a></li>
						<li><a href="<c:url value='/qaboard/list.do'/>">질문게시판<img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
					</ul>
</div>
<div id="sectionR">
					<div id="contentHeader">
						<h2>자유게시판</h2>
					</div>
					
<form id="form" name="form" method="post" enctype="multipart/form-data"
action="/ict/freeboard/insert.do">
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
										<input type="text" name="fbTitle" id="fbTitle">
									</td>
								</tr>
								<tr>
									<td>작성자</td>
									<td><input type="hidden" name="fbWriter" value="${member.memNickName}" /> ${member.memNickName}</td>
								</tr>
								<%-- <tr>
									<td>첨부파일</td>
									<td>
									<label for="file">파일첨부</label>
										<input type="file" multiple="multiple" name="file" id="file" onchange="fileselect(this)">
										<c:if test=""></c:if>
										<span id="checkfile">선택된 파일이 없습니다.</span>
										<!-- <p>
											<input type="checkbox" id="checkbox01" ><label for="checkbox01" class="checkbox"></label>
											<input type="checkbox" id="checkbox02" ><label for="checkbox02" class="checkbox"></label>
										</p> -->
										<a href="#a" id="fileDelete" ><img src="<c:url value='/resources/images/delete_icon.png'/>"  alt="삭제 아이콘"></a>
									</td>
								</tr> --%>
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
									<td><textarea name="fbContent" id="fbContent" cols="30" rows="10"></textarea>
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
CKEDITOR.replace('fbContent',{
	filebrowserUploadUrl:"<c:url value='/ckImage'/>"
});
</script>
</div>
</div>
</section>