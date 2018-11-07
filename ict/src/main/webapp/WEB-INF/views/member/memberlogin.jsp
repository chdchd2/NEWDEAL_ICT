<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<script>

$(document).ready(function(){
	
});

function facebooklogin(){
	FB.login(function(res){
			console.log('login =>',res);
			checkLoginStatus(res);
		},{scope: 'public_profile,email'});	
}

function logout(){
	location.href="<c:url value='/logout.do'/>";
}

var checkLoginStatus = function(resp){
	console.log(resp);  
	if(resp.status ==='connected'){
		
		FB.api('/me?fields=email,name',function(resp){
		var id2=JSON.stringify(resp.id);
		var idLength = id2.length;
		var id = id2.substr(1,(idLength-2));
		
	
		$.ajax({
			type:"GET",
			url:encodeURI("<c:url value='/ismember?gubun=facebook&uid="+resp.id+"'/>"),
			dataType:"json",
			success:function(data){
				if(data.ismember=="yes"){
					location.href="<c:url value='/'/>";
				}else{
					alert("가입정보가 없습니다. 회원가입 페이지로 이동합니다.");
					location.href="<c:url value='/signup?memGubun=facebook&memUid="+resp.id+"'/>";
				}
				
			
		
			}
		});
 
		
		});
		
	}else{
		
		
	}
}

window.fbAsyncInit = function() {
    FB.init({
      appId      : '772518823139711',
      cookie     : true,  
      xfbml      : true, 
      version    : 'v3.1' 
    });
 	
    //로그인 상태 얻어오기
	//FB.getLoginStatus(checkLoginStatus); 

  };

(function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "https://connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));
</script>

 <span id="name">로그인 정보</span>
<ul style="list-style: none;">
	<li>
		<a onclick="facebooklogin();" style="cursor: pointer;"><img src="<c:url value='/resources/images/Login_facebook_ico.png'/>">
		<span>페이스북 로그인</span>
		</a>
	</li>
	
</ul>

<!-- 카카오톡 로그인 -->
<!-- ---------------------------------------------------------------------------------------------------------------->
<a id="kakao-login-btn"/>


<script type='text/javascript'>
	//<![CDATA[
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('a4a27a184b3210f836eea86cdd0104cd');
	// 카카오 로그인 버튼을 생성합니다.
	Kakao.Auth.createLoginButton({
		container : '#kakao-login-btn',
		success : function(authObj) {
			// 로그인 성공시, API를 호출합니다.
			Kakao.API.request({
				url : '/v1/user/me',
				success : function(res) {
				
					
					$.ajax({
						type:"GET",
						url:encodeURI("<c:url value='/ismember?gubun=kakaotalk&uid="+res.id+"'/>"),
						dataType:"json",
						success:function(data){
							if(data.ismember=="yes"){
								location.href="<c:url value='/'/>";
							}else{
								
							
								alert("가입정보가 없습니다. 회원가입 페이지로 이동합니다.");
								location.href="<c:url value='/signup?memGubun=kakaotalk&memUid="+res.id+"'/>";
							}
						}
					});
					
				},
				fail : function(error) {
					alert(JSON.stringify(error));
				}
			});
		},
		fail : function(err) {
			alert(JSON.stringify(err));
		}
	});
	//]]>
</script>
 <!------------------------------------------------------------------------------------------------------------------> 	




</head>