<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@include file="/WEB-INF/views/header.jsp" %>
<!Doctype html>
<html lang="ko">
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
	<script src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.easing.1.3.js'/>"></script>
	<link rel="stylesheet" href="<c:url value='/resources/css/reset.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/header_02.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/footer.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/community_FAQ.css?ver=1'/>">
	<title></title>
	<script src="js/jquery-3.2.1.min.js"></script>
	<script>
		$(function(){
			$("#search > li").click(function(){
				$("#detail li").slideToggle();
			});



			$("#table tbody .clear td").eq(0).slideDown(function(){
					$(this).addClass("bgcolor2");
					$("#table tbody tr").eq(0).addClass("bgcolor1");
			});
		


			$("#table tbody tr").click(function(){
			 	var N = $(this).next().children();
				$("#table tbody .clear td").slideUp(function(){
					$("#table tbody .class").removeClass();

					N.slideDown();

				});
				$(this).addClass("bgcolor1");
				N.addClass("bgcolor2");


			});	
			
		});
	</script>
	<script>


	var $mainMenu
	var $subMenu
	var $menuBg
	var $header

	$(document).ready(function(){

		$mainMenu=$(".mainmenu>a")
		$subMenu=$(".submenu_list")
		$menuBg=$("#menu_back")
		$header=$("header")

		$subMenu.css("opacity",0)
		$subMenu.hide()
		$menuBg.hide()

		$mainMenu.bind("mouseenter",onOver)
		$mainMenu.bind("mouseleave",onMainColor)
		$header.bind("mouseleave",onOut)


	})

	function onMainColor(){

		$mainMenu.css("color","black")
	}


	function onOver(){

			$(this).css({"color":"#0131ca","font-family":"돋움"})

			$menuBg.stop()
			$menuBg.animate({"top":0},200,"easeOutCubic",function(){
			$subMenu.show()
			$subMenu.animate({opacity:1},200,"easeOutCubic")
		})

	}


	function onOut(){

		$menuBg.stop()

		$subMenu.css("opacity",0)
		$subMenu.hide()
		//$menuBg.slideUp(200,"easeOutCubic")
		$menuBg.animate({"top":-100},200,"easeOutCubic")
	}

</script>
<section2>	

			<div id="sectionC">
			<div id="subMenu">
					<h2>커뮤니티</h2>
					<ul>
						<li><a href="<c:url value='/notice/list.do'/>">공지사항 <img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="<c:url value='/freeboard/list.do'/>">자유게시판<img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
						<li><a href="<c:url value='/review/rvList'/>">후기게시판</a></li>
						<li><a href="<c:url value='/qaboard/list.do'/>" class="subActive">질문게시판<img src="<c:url value='/resources/images/submenu_Active.png'/>" alt="서브메뉴활성화알림버튼"></a></li>
					</ul>
			</div>
					
				<div id="sectionR">
					<div id="contentHeader">
						<h2>질문게시판</h2>				
					</div>
					<div id="content">
						<div id="tapMenu">
							<a href="<c:url value='/qaboard/list.do'/>">Q&A</a>&emsp;|&emsp;
							<a href="<c:url value='/faqboard.jsp'/>" style="font-weight:bold">FAQ</a>
						</div>
						<p id="count">총<span>134건</span></p>
						<ol id="search">
							<li><a href="#a">전체 <img src="<c:url value='/resources/images/search_Active.png'/>" alt="검색창더보기"></a>
								<ul id="detail">
									<li><a href="#a">전체</a></li>
									<li><a href="#a">제목</a></li>
									<li><a href="#a">내용</a></li>
								</ul>
							</li>
							<li><input type="text"></li>
							<li><a href="#a">조회</a></li>
						</ol>
						

						<table id ="table">
							<colgroup>
								<col>
								<col>
								<col>
								<col>
							</colgroup>
							<thead>
								<tr>
									<td>번호</td>
									<td>제목</td>
									<td>작성자</td>
									<td>작성일</td>
								</tr>
							</thead>
							<tbody>
								<tr class="odd" >
									<td >1</td>
									<td><a href="#a">국방 아키텍처 관리체계란 무엇인가요?</a></td>
									<td>관리자</td>
									<td>2018.01.01</td>
								</tr>
								<tr class="clear">
									<td colspan="4">
										국방 아키텍처 관리체계란 여러 관리체계에서 올라온 데이터를 검색하여 필요한 정보를 찾을 수 있고, <br>
										해당 정보의 위치를 알려주어 상세한 정보를 찾아 볼 수 있게 해주는 시스템이며 , <br>
										타 체계 인터페이스를 소개하여 해당 인터페이스와 연계할 수 있도록 해 주는 시스템 입니다. <br>
									</td>
								</tr>
								<tr >
									<td>2</td>
									<td><a href="#a">국방 아키텍처 관리체계 사용방법</a></td>
									<td>관리자</td>
									<td>2018.01.01</td>
								</tr>
								<tr class="clear">
									<td colspan="4">
										국방 아키텍처 관리체계란 여러 관리체계에서 올라온 데이터를 검색하여 필요한 정보를 찾을 수 있고, <br>
										해당 정보의 위치를 알려주어 상세한 정보를 찾아 볼 수 있게 해주는 시스템이며 , <br>
										타 체계 인터페이스를 소개하여 해당 인터페이스와 연계할 수 있도록 해 주는 시스템 입니다. <br>
									</td>
								</tr>	
								<tr class="odd">
									<td>3</td>
									<td><a href="#a">[타 체계 인터페이스 등록] 카탈로그 생성 API 추가</a></td>
									<td>관리자</td>
									<td>2018.01.01</td>
								</tr>
								<tr class="clear">
									<td colspan="4">
										국방 아키텍처 관리체계란 여러 관리체계에서 올라온 데이터를 검색하여 필요한 정보를 찾을 수 있고, <br>
										해당 정보의 위치를 알려주어 상세한 정보를 찾아 볼 수 있게 해주는 시스템이며 , <br>
										타 체계 인터페이스를 소개하여 해당 인터페이스와 연계할 수 있도록 해 주는 시스템 입니다. <br>
									</td>
								</tr>
								<tr>
									<td>4</td>
									<td><a href="#a">[메타규격] 메타규격 삭제공지</a></td>
									<td>관리자</td>
									<td>2018.01.01</td>
								</tr>
								<tr class="clear">
									<td colspan="4">
										국방 아키텍처 관리체계란 여러 관리체계에서 올라온 데이터를 검색하여 필요한 정보를 찾을 수 있고, <br>
										해당 정보의 위치를 알려주어 상세한 정보를 찾아 볼 수 있게 해주는 시스템이며 , <br>
										타 체계 인터페이스를 소개하여 해당 인터페이스와 연계할 수 있도록 해 주는 시스템 입니다. <br>
									</td>
								</tr>
								<tr class="odd">
									<td>5</td>
									<td><a href="#a">[서비스점검] 육군 인터페이스 점검안내</a></td>
									<td>관리자</td>
									<td>2018.01.01</td>
								</tr>
								<tr class="clear">
									<td colspan="4">
										국방 아키텍처 관리체계란 여러 관리체계에서 올라온 데이터를 검색하여 필요한 정보를 찾을 수 있고, <br>
										해당 정보의 위치를 알려주어 상세한 정보를 찾아 볼 수 있게 해주는 시스템이며 , <br>
										타 체계 인터페이스를 소개하여 해당 인터페이스와 연계할 수 있도록 해 주는 시스템 입니다. <br>
									</td>
								</tr>
								<tr>
									<td>6</td>
									<td><a href="#a">서비스점검] 해군 인터페이스 점검안내</a></td>
									<td>관리자</td>
									<td>2018.01.01</td>
								</tr>
								<tr class="clear">
									<td colspan="4">
										국방 아키텍처 관리체계란 여러 관리체계에서 올라온 데이터를 검색하여 필요한 정보를 찾을 수 있고, <br>
										해당 정보의 위치를 알려주어 상세한 정보를 찾아 볼 수 있게 해주는 시스템이며 , <br>
										타 체계 인터페이스를 소개하여 해당 인터페이스와 연계할 수 있도록 해 주는 시스템 입니다. <br>
									</td>
								</tr>
								<tr class="odd">
									<td>7</td>
									<td><a href="#a">[서비스점검] 상호운용성센터 관리체계 점검 안내</a></td>
									<td>관리자</td>
									<td>2018.01.01</td>
								</tr>
								<tr class="clear">
									<td colspan="4">
										국방 아키텍처 관리체계란 여러 관리체계에서 올라온 데이터를 검색하여 필요한 정보를 찾을 수 있고, <br>
										해당 정보의 위치를 알려주어 상세한 정보를 찾아 볼 수 있게 해주는 시스템이며 , <br>
										타 체계 인터페이스를 소개하여 해당 인터페이스와 연계할 수 있도록 해 주는 시스템 입니다. <br>
									</td>
								</tr>
								<tr>
									<td>8</td>
									<td><a href="#a">[서비스점검] 국방 아키텍처 관리체계 시스템 점검 안내</a></td>
									<td>관리자</td>
									<td>2018.01.01</td>
								</tr>
								<tr class="clear">
									<td colspan="4">
										국방 아키텍처 관리체계란 여러 관리체계에서 올라온 데이터를 검색하여 필요한 정보를 찾을 수 있고, <br>
										해당 정보의 위치를 알려주어 상세한 정보를 찾아 볼 수 있게 해주는 시스템이며 , <br>
										타 체계 인터페이스를 소개하여 해당 인터페이스와 연계할 수 있도록 해 주는 시스템 입니다. <br>
									</td>
								</tr>
								<tr class="odd">
									<td>9</td>
									<td><a href="#a">관리체계 권한에 대한 안내</a></td>
									<td>관리자</td>
									<td>2018.01.01</td>
								</tr>
								<tr class="clear">
									<td colspan="4">
										국방 아키텍처 관리체계란 여러 관리체계에서 올라온 데이터를 검색하여 필요한 정보를 찾을 수 있고, <br>
										해당 정보의 위치를 알려주어 상세한 정보를 찾아 볼 수 있게 해주는 시스템이며 , <br>
										타 체계 인터페이스를 소개하여 해당 인터페이스와 연계할 수 있도록 해 주는 시스템 입니다. <br>
									</td>
								</tr>
								<tr>
									<td>10</td>
									<td><a href="#a">국방 아키텍처 관리체계 사용방법</a></td>
									<td>관리자</td>
									<td>2018.01.01</td>
								</tr>
								<tr class="clear">
									<td colspan="4">
										국방 아키텍처 관리체계란 여러 관리체계에서 올라온 데이터를 검색하여 필요한 정보를 찾을 수 있고, <br>
										해당 정보의 위치를 알려주어 상세한 정보를 찾아 볼 수 있게 해주는 시스템이며 , <br>
										타 체계 인터페이스를 소개하여 해당 인터페이스와 연계할 수 있도록 해 주는 시스템 입니다. <br>
									</td>
								</tr>
							</tbody>
						</table>

						<div id="page">
							<p><a href="#a"><img src="<c:url value='/resources/images/page_Leftbtn.png'/>" alt="페이지왼쪽버튼"></a></p>
							<ul>
								<li><a href="#a" class="pageActive">1</a></li>
								<li><a href="#a">2</a></li>
								<li><a href="#a">3</a></li>
								<li><a href="#a">4</a></li>
								<li><a href="#a">5</a></li>
							</ul><p><a href="#a"><img src="<c:url value='/resources/images/page_Rightbtn.png'/>" alt="페이지오른쪽버튼"></a></p>
						</div>
					</div>
				</div>
			</div>
		
</section2>

</html>
<%@include file="/WEB-INF/views/footer.jsp" %>