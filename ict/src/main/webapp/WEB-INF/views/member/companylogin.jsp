<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>관리자 페이지 - 로그인</title>

    <!-- Bootstrap core CSS-->
    <link href="<c:url value='/resources/vendor/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template-->
    <link href="<c:url value='/resources/css/sb-admin.css'/>" rel="stylesheet">
	<script>
	$(document).ready(function(){
 		if("${state}"=="fail"){
			alert("일치하는 회원이 없거나 가입승인 대기중입니다.")
		}
	
	});
	function submit(){
		var form = document.getElementById("form");
		form.submit();
	}

	</script>
  </head>

  <body class="bg-dark">

    <div class="container">
      <div class="card card-login mx-auto mt-5">
        <div class="card-header">기업회원 로그인</div>
        <div class="card-body">
          <form action="<c:url value='/companylogin'/>" method="post" id="form">
            <div class="form-group">
              <div class="form-label-group">
                <input type="email" name="memUid"id="inputEmail" class="form-control" placeholder="Email address" required="required" autofocus="autofocus">
                <label for="inputEmail">Email address</label>
              </div>
            </div>
            <div class="form-group">
              <div class="form-label-group">
                <input type="password" name="memPassword" id="inputPassword" class="form-control" placeholder="Password" required="required">
                <label for="inputPassword">Password</label>
              </div>
            </div>
            
            <a class="btn btn-primary btn-block" onclick="submit()">Login</a>
          </form>
        
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
    <script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

    <!-- Core plugin JavaScript-->
    <script src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js'/>"></script>

  </body>

