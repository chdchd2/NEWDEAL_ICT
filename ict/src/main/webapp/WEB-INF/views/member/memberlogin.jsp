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

function logout(a){
	if(a==1){
	FB.logout(function(res){
			console.log('logout =>',res);
			checkLoginStatus(res);
		});
	}else if(a==2){
		Kakao.Auth.logout(function(data){
			console.log(data);
		});
	}
}

var checkLoginStatus = function(resp){
	console.log(resp);  
	if(resp.status ==='connected'){
		
		FB.api('/me?fields=email,name',function(resp){
		var id2=JSON.stringify(resp.id);
		var idLength = id2.length;
		var id = id2.substr(1,(idLength-2));
		
		$("#name").text('이름:'+resp.name+', 이메일주소:'+resp.email);
		$.ajax({
			type:"GET",
			url:encodeURI("<c:url value='/ismember?gubun=facebook&id="+resp.email+"'/>"),
			dataType:"json",
			success:function(data){
				if(data.ismember=="yes"){
					console.log(data.member);
				}else{
					alert("회원 정보가 없습니다. 가입 페이지로 이동합니다");
				}
				
			
		
			}
		});
		});
		
		
		
		
		
	
	}else{
		
		document.querySelector('#name').innerHTML = '';
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
		<span>페이스북 계정으로 회원가입</span>
		</a>
	</li>
	
</ul>

<!-- 카카오톡 로그인 -->
<!-- ---------------------------------------------------------------------------------------------------------------->
<a id="kakao-login-btn"></a>
<input type="button" value="페이스북로그아웃" onclick="logout(1)">
<input type="button" value="카카오로그아웃" onclick="logout(2)">


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
					var email = JSON.stringify(res.kaccount_email);
					var emailLength = email.length;
					var newEmail = email.substr(1,(emailLength-2));
					$("#name").text('이메일주소:'+newEmail);
					$.ajax({
						type:"GET",
						url:encodeURI("<c:url value='/ismember?gubun=kakaotalk&id="+newEmail+"'/>"),
						dataType:"json",
						success:function(data){
							if(data.ismember=="yes"){
								console.log(data.member);
							}else{
								alert("회원 정보가 없습니다. 가입 페이지로 이동합니다");
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