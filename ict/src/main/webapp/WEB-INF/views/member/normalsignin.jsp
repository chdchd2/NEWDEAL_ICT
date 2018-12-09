<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
 <link href="<c:url value='/resources/vendor/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/resources/vendor/datatables/dataTables.bootstrap4.css'/>" rel="stylesheet">
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- Custom styles for this template-->
    <link href="<c:url value='/resources/css/sb-admin.css'/>" rel="stylesheet">
    <script>
	

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
 <body class="bg-dark">
    <div class="container">
     <div class="card card-register mx-auto mt-5">
        <div class="card-header">일반회원 등록하기</div>
        <div class="card-body">
<div style="margin:0px auto; width:800px;height: 450px; margin-top:100px;">
				<h2>
					<span style="color: #3b6aca;font-size: 36px;line-height: 24px; margin-left: 100px;">뉴딜 일자리</span>   SNS 회원가입
				</h2>
				<br><br>
				<p style="margin-left: 50px;">
			
					<span style="margin-left:50px;font-size: 18px;line-height: 24px; color: #707070;">가입하실 SNS 계정을 선택하여 주세요.</span><br>
					<span style="margin-left:50px;font-size: 18px;line-height: 24px; color: #707070;">해당 SNS와 직접 로그인하여 뉴딜일자리 사이트에는</span><br>
					<span style="margin-left:50px;font-size: 18px;line-height: 24px; color: #707070;">개인정보가 저장,수집되지 않으니 안심하셔도 됩니다.</span><br><br>
				</p>
				
		
				
				<br>
			
	


<ul style="list-style: none;    display: block;
    list-style-type: none;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
    margin-left:20px;">
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
		<img src="<c:url value='/resources/images/Login_facebook_ico.png'/>">
		<span style="    line-height: 48px;color: #fff;font-weight: bold;">페이스북 회원가입하기</span>
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
		<img src="<c:url value='/resources/images/Login_kakao_ico.png'/>">
		<span style="line-height: 48px;color: #fff;font-weight: bold;">카카오 계정으로 회원가입</span>
		</a>
	</li>
	
</ul>

	</div>
	</div>
	</div>
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




</body>
    <!-- Bootstrap core JavaScript-->
    <script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
    <script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

    <!-- Core plugin JavaScript-->
    <script src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js'/>"></script>





    <!-- Page level plugin JavaScript-->
    <script src="<c:url value='/resources/vendor/chart.js/Chart.min.js'/>"></script>
    <script src="<c:url value='/resources/vendor/datatables/jquery.dataTables.js'/>"></script>
    <script src="<c:url value='/resources/vendor/datatables/dataTables.bootstrap4.js'/>"></script>

    <!-- Custom scripts for all pages-->
    <script src="<c:url value='/resources/js/sb-admin.min.js'/>"></script>

    <!-- Demo scripts for this page-->
    <script src="<c:url value='/resources/js/demo/datatables-demo.js'/>"></script>
    <script src="<c:url value='/resources/js/demo/chart-area-demo.js'/>"></script>

