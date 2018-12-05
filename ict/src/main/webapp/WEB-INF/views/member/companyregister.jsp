<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    <title>기업회원 가입 페이지</title>

    <link href="<c:url value='/resources/vendor/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/resources/vendor/datatables/dataTables.bootstrap4.css'/>" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<c:url value='/resources/css/sb-admin.css'/>" rel="stylesheet">
    <script>
	
	
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
	
	function submit(){
		$("#form").submit();
	}
</script>
  </head>

  <body class="bg-dark">
    <div class="container">
      <div class="card card-register mx-auto mt-5">
        <div class="card-header">기업회원 등록하기</div>
        <div class="card-body">
          <form action="<c:url value='/companysignup'/>" method="POST" id="form">
             <div class="form-group">
              <div class="form-label-group">
               <input type="text" id="nickname" name="memNickName"onkeyup="nickNameChk()" class="form-control" placeholder="기업회원이름 (EX:유니에스/KSA)" required="required" autofocus="autofocus">
                <label for="nickname">기업회원이름 (EX:유니에스/KSA)</label>
                 
              </div>
            </div>
            <div class="form-group">
              <div class="form-label-group">
                <input type="email" id="inputEmail" name="memUid"class="form-control" placeholder="Email address" required="required">
                <label for="inputEmail">이메일 주소</label>
              </div>
            </div>
               <div class="form-group">
              <div class="form-label-group">
                <input type="password" id="password" name="memPassword"class="form-control" placeholder="Email address" required="required">
                <label for="password">사용할 비밀번호</label>
              </div>
            </div>
             <div class="form-group">
              <div class="form-label-group">
                <input type="email" id="memTel" name="memTel" class="form-control" placeholder="Email address" required="required">
                <label for="inputEmail">연락처</label>
              </div>
            </div>
        <input type="hidden" id="gubun" name="memGubun"value="기업회원">
            <a class="btn btn-primary btn-block" onclick="submit()">Register</a>
          </form>
          <div class="text-center">
            <a class="d-block small mt-3" href="<c:url value='/companylogin'/>">기업회원 로그인</a>
          </div>
        </div>
      </div>
    </div>
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

