<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
	$(document).ready(function() {
		
	});
	function nickNameChk(){
		var data=$("#nickname").val();
		 $.ajax({
	      		type:"POST",
	      		url:encodeURI("<c:url value='/nickNameChk?nickname="+data+"'/>"),
	      		dataType:"json",
	      		success:function(data){
	      			if(data){
	      			$("#nickname").css("background-color", "#B0F6AC");
	      			}else{
	      			$("#nickname").css("background-color", "#FFCECE");
	      			}
	      		}
	        });
	}
</script>
회원가입 페이지입니다.
<form action="<c:url value='/signin'/>" method="POST">
<table>
<tr>
<td>닉네임</td><td><input type="text" name="memNickName" id="nickname" onkeyup="nickNameChk()"></td>
</tr>
<tr>
<td>분야</td> 
	<td>
		<select name="memField" id="field">	
			<option value="경제">경제</option>
			<option value="환경">환경</option>
			<option value="문화/복지">문화/복지</option>
			<option value="교육">교육</option>
			<option value="혁신">혁신</option>
			<option value="환경/안전">환경/안전</option>
		</select>
	</td>
</tr>

<tr>
<td>연락처</td><td><input type="tel" name="memTel" id="tel"></td>
</tr>

<tr>
<td>가입구분</td><td><input type="text" id="gubun" name="memGubun"value="${vo.memGubun }" readonly="readonly"></td>
</tr>


</table>
<input type="hidden" value="${vo.memUid }" name="memUid" id="memUid">
<input type="submit" value="가입하기">
</form>