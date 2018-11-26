<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!Doctype html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
	<script src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.easing.1.3.js'/>"></script>
	<link rel="stylesheet" href="<c:url value='/resources/css/reset.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/header_02.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/footer.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/community_notice01.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/community_notice02.css'/>">
	<script>
		$(function(){
			$("#search > li").eq(0).click(function(){
				$("#detail li").slideToggle();
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
</head>
<body>
<div id="wrap">
<header>
	 <div id="header">
		<tiles:insertAttribute name="header"/>
	</div>
</header>
	<div id="main">
		<tiles:insertAttribute name="main"/>
	</div>
	<div id="footer">
		<tiles:insertAttribute name="footer"/>
	</div>
</div>
</body>
</html>