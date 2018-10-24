<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

회원가입 페이지입니다.
<form action="<c:url value='/signin'/>" method="POST">
<table>
<tr>
<td>이름</td><td><input type="text" name="m_name" id="m_name"></td>
</tr>
<tr>
<td>연락처</td><td><input type="text" name="m_phone" id="m_phone"></td>
</tr>
<tr>
<td>가입구분</td><td><input type="text" id="m_gubun" name="m_gubun"value="${vo.m_gubun }" readonly="readonly"></td>
</tr>
<tr>
<td>ID</td><td><input type="text" id="m_email" name="m_email"value="${vo.m_email }" readonly="readonly"></td>
</tr>

</table>
<input type="hidden" value="${vo.m_id }" name="m_id" id="m_id">
<input type="submit" value="가입하기">
</form>