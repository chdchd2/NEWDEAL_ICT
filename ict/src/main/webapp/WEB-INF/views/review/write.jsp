<%@page import="com.newdeal.ict.Vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="../../error/interror.jsp"
	%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value='/resources/css/community_QNA03.css?ver=2'/>">
<section>
<script src="<c:url value='/resources/ckeditor/ckeditor.js'/>"></script>
<script>
var num = 1;
$(function(){
	
	$(".btnSave").click(function(){
		if($("#rvTitle").val()==""){
			alert("제목을 적어주세요.");
			return false;
		}
		var ckeditor = CKEDITOR.instances['rvContent']; 
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
		document.form.action="<c:url value='/review/rvList'/>";
		document.form.submit();
	});
});

function fileselect(event,num){
	   var filename=event.value.replace(/C:\\fakepath\\/i, '');
	   $("#span"+num).remove();
	   $("#li"+num).append("<span id='span"+num+"'>"+filename+""+
	         "<button class='img_del' onclick='fileDel("+num+")'>x</button>"+
	         "<button class='img_add' onclick='fileAdd()' type='button'></button></span>");
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
	   "<button class='img_add' id='addbutton' onclick='fileAdd()' type='button'></button></span>");
	   if(event.files.length==0){
	      $("#span"+num).remove();
	   }
	}
</script>
<div id="sectionC">
<div id="subMenu">
				<h2>커뮤니티</h2>
					<ul>
						<li><a href="<c:url value='/notice/list.do'/>" >공지사항 <img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="<c:url value='/freeboard/list.do'/>">자유게시판<img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="<c:url value='/review/rvList'/>" class="subActive">후기게시판<img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="<c:url value='/qaboard/list.do'/>">질문게시판<img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
					</ul>
				</div>


<div id="sectionR">
					<div id="contentHeader">
						<h2>후기게시판</h2>
					</div>
					
<form id="form" name="form" method="post" enctype="multipart/form-data" action="<c:url value='/review/rvWrite'/>">
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
									
									<select name="rvPart" id="rvPart">
								 	<option value="현장후기">현장후기</option>
								 	<option value="교육후기">교육후기</option>
								 	<option value="기타후기">기타후기</option>
								 	</select>
										<input type="text" name="rvTitle" id="rvTitle">
									</td>
								</tr>
								<tr>
									<td>작성자</td>
									<td><input type="hidden" name="rvWriter" value="${member.memNickName}" />
										<input type="hidden" name="memNum" value="${member.memNum }"/>${member.memNickName}</td>
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
									<td><textarea name="rvContent" id="rvContent" cols="30" rows="10"></textarea>
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
CKEDITOR.replace('rvContent',{
	filebrowserUploadUrl:"<c:url value='/ckImage'/>"
});
</script>
</div>
</div>
</section>
