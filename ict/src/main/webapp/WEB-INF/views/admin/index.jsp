<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <a class="dropdown-item" href="<c:url value='/admin/linklist'/>">교육신청 링크추가</a>
          </div>
        </li>
      </ul>
      
        

      <div id="content-wrapper">

        <div class="container-fluid">

<div style="margin-top: 100px; margin-left: 300px;">
				<h2>
					<span style="color: #3b6aca;font-size: 36px;line-height: 24px; margin-left: 150px;">관리자님 환영합니다!</span>   	<br><br>
				</h2>
				<br>
        	<p>
        	
				<span style="margin-left:100px;font-size: 18px;line-height: 24px; color: #707070;">회원관리에서는 회원들의 목록을 확인하고 기업회원가입 승인을 할 수 있습니다.</span><br><br>
				<span style="margin-left:100px;font-size: 18px;line-height: 24px; color: #707070;">공지사항 관리에서는 공지사항을 등록하고 삭제할 수 있습니다.</span><br><br>
				<span style="margin-left:100px;font-size: 18px;line-height: 24px; color: #707070;">Q&A에서는 해결되지 않은 질문들을 확인하여 답변을 등록할 수 있습니다.</span><br><br>
				<span style="margin-left:100px;font-size: 18px;line-height: 24px; color: #707070;">교육신청 링크추가에서는 뉴딜일자리 홈페이지의 상단 바로가기 목록들을 편집할 수 있습니다.</span><br><br>
			</p>
          </div>
          </div>

        </div>
        <!-- /.container-fluid -->

       

      </div>
      <!-- /.content-wrapper -->


    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">Ã</span>
            </button>
          </div>
          <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href="login.html">Logout</a>
          </div>
        </div>
      </div>
    </div>

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

  </body>

