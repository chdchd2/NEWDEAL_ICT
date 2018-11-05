<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>


<h2>게시글 목록</h2>
<a href="<c:url value='/edu/intWrite'/>">글 작성하기</a>
<table border="1" width="600px">
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회수</th>
    </tr>
    <c:forEach var="vo" items="${list}">
    <tr>
        <td>${vo.intNum}</td>
        <td><a href="">${vo.intTitle}</a></td>
        <td>${vo.intWriter}</td>
        <td>${vo.intDate}</td>
        <td>${vo.intHit}</td>
    </tr>    
    </c:forEach>
</table>


