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
            <a class="dropdown-item" href="<c:url value='/admin/member'/>">공지사항 관리</a>
            <a class="dropdown-item" href="register.html">Q&A 답변달기</a>
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


        

          <!-- DataTables Example -->
          <div class="card mb-3">
            <div class="card-header">
              <i class="fas fa-table"></i>
             	회원목록</div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>회원번호</th>
                      <th>닉네임</th>
                      <th>전화번호</th>
                      <th>가입구분</th>
                      <th>회원등급</th>
                      <th>가입일자</th>
                      <th>고유ID</th>
                      <th>가입허용</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>회원번호</th>
                      <th>닉네임</th>
                      <th>전화번호</th>
                      <th>가입구분</th>
                      <th>회원등급</th>
                      <th>가입일자</th>
                      <th>고유ID</th>
                      <th>가입허용</th>
                    </tr>
                  </tfoot>
                  <tbody>
                 
                  <c:forEach var="memberlist" items="${memberlist }">
                    <tr>
                      <td>${memberlist.memNum }</td>
                      <td>${memberlist.memNickName }</td>
                      <td>${memberlist.memTel }</td>
                      <td>${memberlist.memGubun }</td>
                      <td><input type="text" id="grade${memberlist.memNum }" value="${memberlist.memGrade }" id="memGrade" style="width: 50px;"><input type="button" value="변경" onclick="memGrade(${memberlist.memNum})"></td>
                      <td>${memberlist.memJoinDate}</td>
                      <td>${memberlist.memUid }</td>
                      <td>
                      <select id="memState${memberlist.memNum }" >
                      <option value="allow"  <c:if test="${memberlist.memState =='allow' }">selected="selected"</c:if>>allow</option>
                      <option value="denined"  <c:if test="${memberlist.memState =='denined' }">selected="selected"</c:if>>denined</option>
                      </select>
                      <input type="button" value="변경" onclick="memState(${memberlist.memNum})">
                      </td>
                    </tr>
                    </c:forEach>
                    
                  </tbody>
                </table>
              </div>
            </div>
            <div class="card-footer small text-muted"></div>
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

  </body>

