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
	FB.logout(function(res){
			console.log('logout =>',res);
			checkLoginStatus(res);
		});
}
var checkLoginStatus = function(resp){
	console.log(resp);  
	if(resp.status ==='connected'){
		
		$("#logoutBtn").css("display","inline-block");
		FB.api('/me?fields=email,name',function(resp){
			console.log(resp);
		$("#name").text('이름:'+resp.name+', 이메일주소:'+resp.email);
	
		});
	}else{
		$("#logoutBtn").css("display","none");
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
 
	FB.getLoginStatus(checkLoginStatus); 

  };

(function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "https://connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));
</script>

 <span id="name">로그인 정보</span><input type="button" id="logoutBtn" value="로그아웃" onclick="logout()" style="display:none;">
<ul style="list-style: none;">
	<li>
		<a onclick="facebooklogin();" style="cursor: pointer;"><img src="<c:url value='/resources/images/Login_facebook_ico.png'/>">
		<span>페이스북 계정으로 회원가입</span>
		</a>
	</li>
	
</ul>

<a id="kakao-login-btn"></a>
<a href="http://developers.kakao.com/logout" onclick="javascript:Kakao.Auth.logout()">로그아웃</a>
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('a4a27a184b3210f836eea86cdd0104cd');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
        alert(JSON.stringify(authObj));
   
      },
      fail: function(err) {
         alert(JSON.stringify(err));
      }
    });
  //]]>
</script>
  	




</head>
