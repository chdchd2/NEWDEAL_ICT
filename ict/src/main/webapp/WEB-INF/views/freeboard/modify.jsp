<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="<c:url value='/resources/css/community_QNA03.css'/>">
<section>
<script src="<c:url value='/resources/ckeditor/ckeditor.js'/>"></script>
<script>
var num=1;
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
			var str="";
			$("#form").append(str);
			document.form.action="/ict/freeboard/update.do";
			document.form.submit();
		});
		
		/* $(".btnSave").click(function(){
			//태그.each(function(){})모든 태그 반복
			var str="";
			//폼에 hidden 태그들을 추가
			$("#form").append(str);
			document.form.submit();
		}); */
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
	         "<input type='file' id='filename"+num+"' name='file' class='upload_hidden' onchange='fileselect(this,"+num+")'>"+
	         "</div>"+
	         "</li>");
	   num++;
	}



	function fileDel(num){
	   console.log(num);
	   //첫번째 파일일 경우 파일첨부하는 라벨과 input 박스가 날아가면 안되므로.
	   if(num==0){
	      $("#span"+num).remove();
	      $("#filelabel"+num).prepend("<input type='file' id='filename"+num+"' name='file' class='upload_hidden' onchange='fileselect(this,"+num+")'>");
	      
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
function fileDel(fileNum){
	$("#span"+fileNum).remove();
	 $.ajax({
   		type:"POST",
   		url:encodeURI("<c:url value='/freeboard/fileDel?fileNum="+fileNum+"'/>"),
   		dataType:"json",
   		success:function(data){
   			alert("파일이 삭제되었습니다. 파일 추가시 여러파일 선택이 가능합니다.");
   		}
     });
	
}

</script>


<div id="sectionC">
<div id="subMenu">
					<h2>커뮤니티</h2>
					<ul>
						<li><a href="<c:url value='/notice/list.do'/>">공지사항 <img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="<c:url value='/freeboard/list.do'/>" class="subActive">자유게시판<img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="#">후기게시판</a></li>
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
										<input type="text" name="fbTitle" id="fbTitle" value="${vo.fbTitle}">
									</td>
								</tr>
								<tr>
									<td>작성자</td>
									<td><input type="hidden" name="fbWriter" value="${member.memNickName}" /> ${member.memNickName}</td>
								</tr>
								<!-- <tr>
									<td>첨부파일</td>
									<td><input type="file" multiple="multiple" name="file">
										<input type="file" value="파일첨부" id="file" multiple="multiple" name="file">
										<label for="file">파일첨부</label>
										<span id="checkfile">선택된 파일이 없습니다.</span>
										<p>
											<input type="checkbox" id="checkbox01" ><label for="checkbox01" class="checkbox"></label>
											<input type="checkbox" id="checkbox02" ><label for="checkbox02" class="checkbox"></label>
										</p>
										<a href="#a" id="fileDelete" ><img src="resources/images/delete_icon.png" alt="삭제 아이콘"></a>
									</td>
								</tr> -->
								<tr>
		                        <td>첨부파일</td>
		                        <td>
		                           <div class="img_upload_list">
			                        <c:forEach var="list" items="${vo.list }">
			                        	<span id="span${list.fileNum }">${list.fileOrgName }
			                        		<span>&nbsp;
			                        			<a href="#" onclick="fileDel(${list.fileNum})" style="width:20px;height:20px;display:inline-block;vertical-align:middle;font-size:16px;color:#cf2f0f;">x</a>
			                        		</span><br>
			                        	</span>
			                        </c:forEach> 
		                              <ul id="fileul">
		                                 <li id="li0">
		                                    <div class="filebox dp_in vm mgr10">
		                                       <label id="filelabel" for="filename0" class="btn_search">파일첨부</label>
		                                        <input type="file" id="filename0" id="file" name="file" class="upload-hidden" onchange="firstFileSelect(this,0)">
		                                     </div>
		                                 </li>
		                              </ul>
		                           </div>
		                        </td>
		                       </tr>
								<tr>
									<td>내용</td>
									<td><textarea name="fbContent" id="fbContent" cols="30" rows="10">${vo.fbContent}</textarea>
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
	
			<input type="hidden" name="fbNum" value="${vo.fbNum}" />
</div>	
</form>
<script>
CKEDITOR.replace('fbContent',{
	filebrowserUploadUrl:"<c:url value='/ckImage.do'/>"
});
</script>
</div>
</div>
</section>