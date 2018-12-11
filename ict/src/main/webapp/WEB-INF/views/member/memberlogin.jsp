<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
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
</head>
<body>


<div style="margin:0px auto;width:800px;height: 430px;margin-top: 300px;/* background: beige; */">
            <h2 style="
    font-size: 2rem;
    line-height: 24px;
    /* margin-left: 240px; */
    font-weight: 500;
    color: black;
    text-align: center;
">
               <span style="color: #3b6aca;font-size: 36px;line-height: 24px;/* margin-left: 150px; */color: #3b6aca;font-size: 36px;line-height: 24px;/* margin-left: 100px; */">뉴딜 일자리</span> 로그인
            </h2>
            <br><br>
            <p>
               <span style="/* margin-left: 240px; */font-size: 18px;line-height: 24px;color: #707070;/* margin: 0px auto; */text-align: center;width: 100%;display: block;">로그인 하실 SNS 계정을 선택하여 주세요.</span></p><p></p>
               <span style="/* margin-left: 240px; */font-size: 18px;line-height: 24px;color: #707070;width: 100%;text-align: center;display: block;">해당 SNS와 직접 로그인하여 뉴딜일자리 사이트에는</span><p></p>
               <span style="/* margin-left: 240px; */font-size: 18px;line-height: 24px;color: #707070;width: 100%;text-align: center;display: block;/* background: pink; */">개인정보가 저장,수집되지 않으니 안심하셔도 됩니다.</span><p></p><p></p>
            <p></p>
      
               <b style="font-size: 19px;line-height: 24px;/* margin-left: 300px; */margin-top: 30px;display: block;/* margin: 0px auto; */text-align: center;">SNS 로그인 선택</b><br>
      
            
            <br>
 <ul style="
    /* list-style: none; */
    display: block;
    /* list-style-type: disc; */
    /* margin-block-start: 1em; */
    margin-block-end: 1em;
    margin-inline-start: 0px;
    /* margin-inline-end: 0px; */
    /* padding-inline-start: 40px; */
    /* margin: 0px auto; */
    text-align: center;
    ">
   <li>
      <a onclick="facebooklogin();" style="cursor: pointer;width: 250px;
    line-height: 48px;
    display: inline-block;
    position: relative;
    color: #fff;
    font-weight: bold;
    font-size: 14px;
    margin-bottom: 9px;
    border-radius: 4px;
    background: #3155af;">
      <img src="/resources/images/Login_facebook_ico.png">
      <span style="    line-height: 48px;color: #fff;font-weight: bold;">페이스북으로 로그인하기</span>
      </a>
      
      <a id="custom-login-btn" href="javascript:loginWithKakao()" style="cursor: pointer;width: 250px;
    line-height: 48px;
    display: inline-block;
    position: relative;
    color: #fff;
    font-weight: bold;
    font-size: 14px;
    margin-bottom: 9px;
    border-radius: 4px;
    background: #ffd632;">
      <img src="/resources/images/Login_kakao_ico.png">
      <span style="line-height: 48px;color: #fff;font-weight: bold;">카카오 계정으로 로그인하기</span>
      </a>
      
      
   </li>
   
</ul>
      <a href="/companylogin" style="
    cursor: pointer;
    width: 250px;
    line-height: 20px;
    display: inline-block;
    /* position: relative; */
    color: #fff;
    /* font-weight: bold; */
    font-size: 14px;
    /* margin-bottom: 9px; */
    border-radius: 4px;
    background: #FFFFFF;
    /* margin-left: 180px; */
    margin: 0px auto;
    border: solid 1px #ebebeb;
    /* margin: 0px auto; */
    display: block;
    text-align: center;
    ">
      <img src="/resources/images/company.PNG" style="height: 48px;">
      <span style="line-height: 50px;color: #000000;font-weight: bold;">기업회원 로그인하기</span>
      </a>

</div>
<script type='text/javascript'>
	//<![CDATA[
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('a4a27a184b3210f836eea86cdd0104cd');
	// 카카오 로그인 버튼을 생성합니다.
	function loginWithKakao() {
		  Kakao.Auth.login({
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
	}
	//]]>
</script>
 <!------------------------------------------------------------------------------------------------------------------> 	
<br>
<div>

</div>



</body>