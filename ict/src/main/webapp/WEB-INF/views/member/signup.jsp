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
	$(document).ready(function() {
		console.log("${vo.memGubun}");
		if(${vo.memGubun eq null}){
			alert("비정상적인 접근입니다");
			location.href="<c:url value='/login'/>";
		}
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
	      			$("#submitBtn").attr("onclick","submit()");
	      			
	      			}else{
	      			$("#nickname").css("background-color", "#FFCECE");
	      			$("#submitBtn").attr("onclick","");

	      		}
	      		}
	        });
	
		 }
	function submit(){
		var nickname=$("#nickname").val();
		var memTel=$("#memTel").val();
		if(nickname==""){
			alert("닉네임 항목을 입력해주세요");
			return false;
		}
		if(memTel==""){
			alert("이메일을 입력해주세요");
			return false;
		}
		
		
		$("#form").submit();
	}
</script>
  </head>

  <body class="bg-dark">
    <div class="container">
      <div class="card card-register mx-auto mt-5">
        <div class="card-header">일반회원 가입하기</div>
        <div class="card-body">
         <form action="<c:url value='/signin'/>" method="POST" id="form">
             <div class="form-group">
              <div class="form-label-group">
               <input type="text" id="nickname" name="memNickName"onkeyup="nickNameChk()" class="form-control" placeholder="사용할 닉네임을 입력해주세요." required="required" autofocus="autofocus">
                <label for="nickname">닉네임입력</label>
                 
              </div>
            </div>
       
             <div class="form-group">
              <div class="form-label-group">
                <input type="text" id="memTel" name="memTel" class="form-control" placeholder="연락처를 입력해주세요" required="required">
                <label for="memTel">연락처</label>
              </div>
            </div>
            
                <div class="form-group">
              <div class="form-label-group">
                <input type="text" id="gubun" name="memGubun"value="${vo.memGubun }" readonly="readonly">
                <label for="gubun">가입구분</label>
              </div>
            </div>
            <input type="hidden" value="${vo.memUid }" name="memUid" id="memUid">
            <a class="btn btn-primary btn-block" onclick="submit()" id="submitBtn">일반회원 가입완료</a>
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



    <!-- Page level plugin JavaScript-->
    <script src="<c:url value='/resources/vendor/chart.js/Chart.min.js'/>"></script>
    <script src="<c:url value='/resources/vendor/datatables/jquery.dataTables.js'/>"></script>
    <script src="<c:url value='/resources/vendor/datatables/dataTables.bootstrap4.js'/>"></script>

    <!-- Custom scripts for all pages-->
    <script src="<c:url value='/resources/js/sb-admin.min.js'/>"></script>

    <!-- Demo scripts for this page-->
    <script src="<c:url value='/resources/js/demo/datatables-demo.js'/>"></script>
    <script src="<c:url value='/resources/js/demo/chart-area-demo.js'/>"></script>

