<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="<c:url value='/resources/css/community_notice03.css?ver=1'/>">
<script>
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
         
         document.form.action="/ict/freeboard/updateView.do";
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
function comment(){
   var comContent=$("#comContent").val();
   var memNum=$("#memNum").val();
   var comBnum=${vo.fbNum};
   console.log(comContent);
   
   $.ajax({
   type:"GET",
   url:encodeURI("<c:url value='/freeboard/comment.do?comContent="+comContent+"&memNum="+memNum+"&comBnum="+comBnum+"'/>"),
   dataType:"json",
   success:function(data){
      console.log(data);
      
   location.href="<c:url value='/freeboard/view.do?fbNum=${vo.fbNum}'/>";

   }
}); 
}

var fbNum = '${vo.fbNum}';
function comDel(comNum) {
    if (!confirm("댓글을 삭제하시겠습니까?")) {
        return;
    }
   console.log(comNum);
   location.href="/ict/freeboard/view.do?fbNum="+fbNum;
    $.ajax({
      type:"POST",
      url:encodeURI("<c:url value='/freeboard/comDel?comNum="+comNum+"'/>"),
      dataType:"json",
      success:function(data){
         if(data == 1)commentList(fbNum);
      }
   }); 
}
   

</script>
<section>
<div id="sectionC">
<div id="subMenu">
               <h2>커뮤니티</h2>
               <ul>
                  <li><a href="<c:url value='/notice/list.do'/>" >공지사항 <img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
                  <li><a href="<c:url value='/freeboard/list.do'/>" class="subActive">자유게시판<img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
                  <li><a href="<c:url value='/review/rvList'/>">후기게시판</a></li>
                  <li><a href="<c:url value='/qaboard/list.do'/>">질문게시판<img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
               </ul>
</div>

<div id="sectionR">
               <div id="contentHeader">
                  <h2>자유게시판</h2>
               </div>
<form id="form" name="form" method="post"
<%-- action="${path}/notice/insert.do" --%>>
<div id="content">
                  <div id="boardheader">
                     <h2>${vo.fbTitle}</h2>
                     <ul>
                        <li>작성자<span>${vo.fbWriter}</span></li>
                        <li>게시일자<span><fmt:formatDate value="${vo.fbRegdate}" pattern="yyyy-MM-dd"/></span></li>
                        <li>조회수<span>${vo.fbViewcnt }</span></li>
                     </ul>
                  </div>
                  <div id="board">
                     <div id="writing">
                      <c:out value="${vo.fbContent}" escapeXml="false"/>
                     </div>
                     <ul>
                        <li>
                           <span>첨부파일</span>
                        <c:choose>
                        <c:when test="${fn:length(vo.list) > 0 }">
                        <c:forEach var="list" items="${vo.list }">
                        <a class="add_file" href="<c:url value='/freeboard/fileDown?fileNum=${list.fileNum }'/>">${list.fileOrgName }</a>
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
                           <c:when test="${prev.fbTitle eq null}">
                           <a href="#">이전글이 없습니다.</a>
                           </c:when>
                           <c:otherwise>
                              <a href="<c:url value='/freeboard/view.do?fbNum=${prev.fbNum }'/>">${prev.fbTitle }</a>
                           </c:otherwise>
                           </c:choose>
                        </li>
                        <li>
                           <span>다음 글</span>
                           <c:choose>
                           <c:when test="${next.fbTitle eq null}">
                           <a href="#">다음글이 없습니다.</a>
                           </c:when>
                           <c:otherwise>
                              <a href="<c:url value='/freeboard/view.do?fbNum=${next.fbNum }'/>">${next.fbTitle }</a>
                           </c:otherwise>
                           </c:choose>
                        </li>
                        
                     </ul>
                  </div>

      <a id="list" class="btnList">목록</a>
   <!-- 본인 게시물만 수정,삭제 버튼 표시 -->   
   <c:if test="${sessionScope.member.memNickName == vo.fbWriter }"> 
      <a id="list" class="btnDelete">삭제</a>
      <a id="list" class="btnUpdate">수정</a>
   </c:if> 
   <!-- 수정, 삭제에 필요한 글번호를 hidden 태그에 저장 -->
      <input type="hidden" name="fbNum" value="${vo.fbNum}" />
      
   <!-- 댓글 -->   
   <div id="board_bottom">
      <p id="reply_count"></p>
   <div id="reply_wrap">
   <c:forEach var="comment" items="${commentList}">
       <ul>
            <li>${comment.memNickName}</li>
            <li>${comment.comContent}</li>
            <li><span>${comment.comDate}</span></li>
         <li><input type="hidden" id="comNum" value="${comment.comNum }" /></li>
            <c:if test="${sessionScope.member.memNickName == comment.memNickName }"> 
               <li><input type="button" value="x" onclick="comDel(${comment.comNum});" /></li><br>
               <!--<td><a class="comDel">삭제</a></td><br> -->
            </c:if>
            <c:if test="${sessionScope.member.memNickName != comment.memNickName }"> 
               <br>
            </c:if>
      </ul>      
      <%-- ${comment.memNickName} ===>${comment.comContent} ${comment.comDate} <br>  --%>
   </c:forEach>
   </div>
   <div id="reply_writing_wrap">
      <div id="reply_writing">
      <c:if test="${sessionScope.member ==null }">
      <textarea id="comContent" placeholder="로그인 후 이용해주세요." ></textarea>
      </c:if>
      <c:if test="${sessionScope.member !=null }">
      <textarea id="comContent"></textarea>
      </c:if>
      </div>
      <input type="hidden" value="${sessionScope.member.memNum }" id="memNum">
      <div id="reply_button" onclick="comment()">등록</div>
   </div>
   </div>
   </div>
</form>
</div>
</div>
</section>