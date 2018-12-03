<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <head>



    <title>관리자 페이지 - 메인화면</title>

    <!-- Bootstrap core CSS-->
    <link href="<c:url value='/resources/vendor/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">

    <!-- Page level plugin CSS-->
    <link href="<c:url value='/resources/vendor/datatables/dataTables.bootstrap4.css'/>" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<c:url value='/resources/css/sb-admin.css'/>" rel="stylesheet">
    	<script src="<c:url value='/resources/ckeditor/ckeditor.js'/>"></script>
    		<script src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
	<script>
	function memGrade(memNum){
		var memGrade=$("#grade"+memNum).val();
		console.log(memGrade);
		location.href="<c:url value='/admin/memGrade?memNum="+memNum+"&memGrade="+memGrade+"'/>";
	}
	
	function memState(memNum){
		var memState=$("#memState"+memNum).val();
		console.log(memState);
		location.href="<c:url value='/admin/memState?memNum="+memNum+"&memState="+memState+"'/>";
	}
	
	function showDiv(){
		console.log("click");
		$("#hidediv").css("display","block");
	}
	function formSubmit(){
		console.log("dasfsafsadf");
		$("#answerform").submit();
	}
	</script>
  </head>

  <body id="page-top">

    <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

      <a class="navbar-brand mr-1" href="<c:url value='/admin/login'/>">관리자 페이지</a>

      <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
        <i class="fas fa-bars"></i>
      </button>


   

    </nav>

    <div id="wrapper">

      <!-- Sidebar -->
       <!-- Sidebar -->
      <ul class="sidebar navbar-nav">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-folder"></i>
            <span>회원관리</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <a class="dropdown-item" href="<c:url value='/admin/member'/>">회원관리</a>
          </div> 
        </li>
 
       <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-table"></i>
            <span>게시판 관리</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
                  <a class="dropdown-item" href="<c:url value='/admin/notice'/>">공지사항 관리</a>
             <a class="dropdown-item" href="<c:url value='/admin/qalist'/>">Q&A 답변달기</a>
          </div> 
        </li>
        
       <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>사이트 관리</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <a class="dropdown-item" href="login.html">메인바꾸기</a>
            <a class="dropdown-item" href="register.html">교육신청 링크추가</a>
          </div>
        </li>
      </ul>
      
        

      <div id="content-wrapper">

        <div class="container-fluid">

        
        <div class="container">
      <div class="card card-register mx-auto mt-5">
        <div class="card-header">${vo.qaTitle}  </div>
        <div class="card-body">
          
            <div class="form-group">
              <div class="form-row">
                <div class="col-md-6">
              
                </div>
                <div class="col-md-10">
                  <div class="form-label-group">
               작성자 :${vo.qaWriter} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               질문날짜 :<fmt:formatDate value="${vo.qaRegdate}" pattern="yyyy-MM-dd"/>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="form-group">
              <div>
            <c:out value="${vo.qaContent}" escapeXml="false"/>
              </div>
            </div>
            첨부파일 목록: <c:forEach var="list" items="${vo.list }">
								<a href="<c:url value='/qaboard/fileDown?fileNum=${list.fileNum }'/>">${list.fileOrgName }</a>
								</c:forEach>
								<br><br>
            <a class="btn btn-primary btn-block" onclick="showDiv()">답변달기</a>
         
          
          
         
        </div>
      </div>
      
      
    
      <div id="hidediv" style="display: none;">
       <div class="card card-register mx-auto mt-5">
          <form id="answerform" action="<c:url value='/admin/answer'/>" method="POST">
        <div class="card-header">답변제목입력 <input type="text" id="qaTitle" name="qaTitle"style="width:500px; margin-top: 5px;">  </div>
        <div class="card-body">
            <div class="form-group">
              <div class="form-row">
                <div class="col-md-6">
              
                </div>
              </div>
            </div>
              <div>
          <textarea name="qaContent" id="qaContent" cols="30" rows="10"></textarea>
              </div>
            <a class="btn btn-primary btn-block" onclick="formSubmit()">완료</a>
        </div>
        <input type="hidden" name="qaNum" value="${vo.qaNum }">
          </form>
      </div>
      </div>
      
      
      
      
      
      
      
      
      
      
      
      
      
      
    </div>
    
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        

          

        </div>
        <!-- /.container-fluid -->

       

      </div>
      <!-- /.content-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fas fa-angle-up"></i>
    </a>

 

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
	<script>
CKEDITOR.replace('qaContent',{
	filebrowserUploadUrl:"<c:url value='/ckImage'/>"
});
</script>
  </body>

