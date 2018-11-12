<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<body>
<h2>게시글 상세보기</h2>
<form name="form1" method="post">
    <div>        <!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
        작성일자 : <fmt:formatDate value="${vo.intDate}" pattern="yyyy-MM-dd a HH:mm:ss"/>
                <!-- 날짜 형식 => yyyy 4자리연도, MM 월, dd 일, a 오전/오후, HH 24시간제, hh 12시간제, mm 분, ss 초 -->
    </div>
    <div>
   파일목록 : <c:forEach var="list" items="${vo.list }"><a href="<c:url value='/edu/fileDown?fileNum=${list.fileNum }'/>">${list.fileOrgName }</a><br></c:forEach>
    </div>
    <div>
        조회수 : ${vo.intHit}
    </div> 
    <div>
        제목 : 
       ${vo.intTitle }
    </div>
    <div>
        내용
        <textarea name="content" id="content" rows="4" cols="80" placeholder="내용을 입력해주세요">${vo.intContent}</textarea>
    </div>
    <div>
        이름
       ${vo.intWriter}
    </div>
    <div style="width:650px; text-align: center;">
        <!-- 게시물번호를 hidden으로 처리 -->
        <input type="hidden" name="bno" value="${vo.intNum}">
        <a href="<c:url value='/edu/intEdit?intNum=${vo.intNum }'/>"><button type="button" id="btnUpdete">수정</button></a>
        <a href="<c:url value='/edu/intDelete?intNum=${vo.intNum }'/>"><button type="button" id="btnDelete">삭제</button></a>
    </div>
</form>
</body>