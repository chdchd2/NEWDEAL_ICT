<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
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
<div>
<fb:login-button scope="public_profile,email" onlogin="checkLoginState();"> </fb:login-button>

</div>
