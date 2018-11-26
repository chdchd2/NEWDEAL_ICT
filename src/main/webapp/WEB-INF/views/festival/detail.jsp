<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<body>
<h2>게시글 상세보기</h2>
<form name="form" method="post">
    <div>        <!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
        작성일자 : <fmt:formatDate value="${FestivalVo.fesDate}" />
                <!-- 날짜 형식 => yyyy 4자리연도, MM 월, dd 일, a 오전/오후, HH 24시간제, hh 12시간제, mm 분, ss 초 -->
    </div>
    <div>
        조회수 : ${FestivalVo.fesHit}
    </div> 
     <div>
        이름 :
       ${member.memNickName}
    </div>
    <div>
        제목 : 
       ${FestivalVo.fesTitle }
    </div>
    <div>
        내용 :
        <c:out value="${FestivalVo.fesContent}" escapeXml="false"/>
    </div>
       <div>
        파일목록 : <c:forEach var="list" items="${FestivalVo.list }"><a href="<c:url value='/festival/fileDown?fileNum=${FestivalVo.fileNum }'/>">${list.fileOrgName }</a><br></c:forEach>
    </div>
    <div style="width:650px; text-align: center;">
        <!-- 게시물번호를 hidden으로 처리 -->
        <input type="hidden" name="bno" value="${FestivalVo.fesNum}">
         <a href="<c:url value='/festival/fesEdit?fesNum=${FestivalVo.fesNum }'/>"><button type="button" id="btnUpdete">수정</button></a>
        <a href="<c:url value='/festival/fesDelete?fesNum=${FestivalVo.fesNum }'/>"><button type="button" id="btnDelete">삭제</button></a> 
    </div>
</form>
</body>