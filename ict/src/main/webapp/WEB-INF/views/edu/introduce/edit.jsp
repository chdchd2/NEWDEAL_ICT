<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="<c:url value='/resources/css/community_QNA03.css'/>">
<script src="<c:url value='/resources/ckeditor/ckeditor.js'/>"></script>

<script>
$(function(){
	
	$(".btnUpdete").click(function(){
		//태그.each(function(){})모든 태그 반복
		var str="";
		//폼에 hidden 태그들을 추가
		$("#form").append(str);
		document.form1.action="<c:url value='/edu/intEdit'/>"; 
		document.form1.submit();
	});
	$(".btnList").click(function(){
		/*location.href="${path}/board/list.do";
		//document.form.action="${path}/board/list.do";
		//document.form.submit(); */
		document.form1.action="<c:url value='/edu/intList'/>";
		document.form1.submit();
	});
});
var num=1;
function fileselect(event,num){
	   var filename=event.value.replace(/C:\\fakepath\\/i, '');
	   $("#span"+num).remove();
	   $("#li"+num).append("<span id='span"+num+"'>"+filename+""+
	         "<button class='img_del' onclick='fileDel("+num+")'>x</button>"+
	         "<button class='img_add' onclick='fileAdd()' type='button'></button></span>");
	   console.log(num);
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
	function fileDel(fileNum){
		$("#span"+fileNum).remove();
		 $.ajax({
	   		type:"POST",
	   		url:encodeURI("<c:url value='/edu/fileDel?fileNum="+fileNum+"'/>"),
	   		dataType:"json",
	   		success:function(data){
	   			alert("파일이 삭제되었습니다. 파일 추가시 여러파일 선택이 가능합니다.");
	   		}
	     });
	}
</script>
<section>
<div id="sectionC">
<div id="subMenu">
						<h2>교육신청</h2>
				<ul>
						<li><a href="<c:url value='/edu/intList'/>"  class="subActive">교육신청안내 <img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="<c:url value='/edu/detList'/>" >프로그램상세</a></li>
							<c:forEach items="${linklist }" var="linklist" varStatus="linknum">
 			 	<li><a href="${linklist.linkUrl }" id="link${linknum.index }">${linklist.linkName }</a>
 			 	</c:forEach>
					</ul>
				</div>


<div id="sectionR">
  <div id="contentHeader">
<h2>게시글 상세보기</h2>
</div>
<form id="form1" name="form1" action="<c:url value='/edu/intEdit'/>" method="POST" enctype="multipart/form-data">
<div id="content">
<table>
<%-- <form name="form1" action="<c:url value='/edu/intEdit'/>" method="POST" enctype="multipart/form-data">
    <div>
   파일목록 : <c:forEach var="list" items="${vo.list }"><span id="span${list.fileNum }">${list.fileOrgName }<span>&nbsp;<a href="#" onclick="fileDel(${list.fileNum})" style="width:20px;height:20px;display:inline-block;vertical-align:middle;font-size:16px;color:#cf2f0f;">x</a></span><br></span></c:forEach>
    <input type="file" multiple="multiple" name="file">
    </div>
    <div>
        제목 : 
      <input type="text" value="${vo.intTitle }" name="intTitle">
    </div>
    <div>
        내용
        <textarea name="intContent" id="content" rows="4" cols="80" placeholder="내용을 입력해주세요">${vo.intContent}</textarea>
    </div>
    <div>
        이름
       ${vo.intWriter}
    </div>
    <div style="width:650px; text-align: center;">
        <!-- 게시물번호를 hidden으로 처리 -->
        <input type="hidden" name="intNum" value="${vo.intNum}">
       <button type="submit" id="btnUpdete">수정</button>
    </div>
--%>
					<colgroup>
								<col>
								<col>
							</colgroup>
   					<tbody>
								<tr>
									<td>제목</td>
									<td>
										  <input type="text" value="${vo.intTitle }" name="intTitle">
									</td>
								</tr>
								<tr>
									<td>작성자</td>
									<td> ${vo.intWriter}
								</tr>
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
									<td>
									    <textarea name="intContent" id="content" rows="4" cols="80" placeholder="내용을 입력해주세요">${vo.intContent}</textarea>
   									</td>
								</tr>
								
								
							</tbody>
						</table>
	
						<ul>
							<li>
								<!-- 게시물번호를 hidden으로 처리 --> 
								<a id="input"  class="btnUpdete">수정</a>
							</li>
							<li>
								<a id="cancel"  class="btnList">취소</a>
							</li>
						</ul>
								<input type="hidden" name="intNum" value="${vo.intNum}"> 
	
</div>	

</form> 
<script>
CKEDITOR.replace('intContent',{
	filebrowserUploadUrl:"<c:url value='/ckImage.do'/>"
});
</script>
</div>
</div>
</section>