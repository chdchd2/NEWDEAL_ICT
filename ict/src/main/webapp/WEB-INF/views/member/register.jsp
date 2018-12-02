<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    <title>기업회원 가입 페이지</title>

  <!-- Bootstrap core CSS-->
    <link href="<c:url value='/resources/vendor/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">

    <!-- Page level plugin CSS-->
    <link href="<c:url value='/resources/vendor/datatables/dataTables.bootstrap4.css'/>" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<c:url value='/resources/css/sb-admin.css'/>" rel="stylesheet">
  </head>

  <body class="bg-dark">

    <div class="container">
      <div class="card card-register mx-auto mt-5">
        <div class="card-header">기업회원 등록하기</div>
        <div class="card-body">
          <form>
             <div class="form-group">
              <div class="form-label-group">
               <input type="text" id="memNickName" class="form-control" placeholder="기업회원이름 (EX:유니에스/KSA)" required="required" autofocus="autofocus">
                <label for="memNickName">기업회원이름 (EX:유니에스/KSA)</label>
                 
              </div>
            </div>
            <div class="form-group">
              <div class="form-label-group">
                <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required="required">
                <label for="inputEmail">이메일 주소</label>
              </div>
            </div>
             <div class="form-group">
              <div class="form-label-group">
                <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required="required">
                <label for="inputEmail">연락처</label>
              </div>
            </div>
        
            <a class="btn btn-primary btn-block" href="login.html">Register</a>
          </form>
          <div class="text-center">
            <a class="d-block small mt-3" href="login.html">Login Page</a>
            <a class="d-block small" href="forgot-password.html">Forgot Password?</a>
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  </body>



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

