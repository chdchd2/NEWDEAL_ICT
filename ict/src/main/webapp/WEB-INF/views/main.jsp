<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--메인롤링배너-->
<script>


	var $slideWrap
	var $slideImg
	var slideWidth
	var $slideCenter
	var $slideLeftBtn
	var $slideRightBtn
	var imgNum
	var currentPosition
	var imgWidth

	$(document).ready(function(){



		$slideWrap=$("#slideInner")
		$slideImg=$(".contents_wrap3")
		$slideCenter=$("#slide")
		$slideLeftBtn=$("#slidePrev")
		$slideRightBtn=$("#slideNext")
		imgNum=$slideImg.length
		$slideWrap.children().last().prependTo($slideWrap);

		onImgReset()


		$slideRightBtn.bind("click",onRightNext)
		$slideLeftBtn.bind("click",onLeftPrev)


		onPlay()

		$("#slideWrap").bind("mouseenter",onStop)
		$("#slideWrap").bind("mouseleave",onPlay)

		//alert($("#slideWrap").innerWidth())

	})


	$(window).resize(function(){
		onImgReset()
	})


	function onImgReset(){

		slideWidth=$slideCenter.innerWidth()
		//slideImg의 width가 css에서 100%로 되어있고
		//slideImg의 부모인 slideWrap(slideImg 3개 감싼애)에는 widht값이 지정되어있지않으므로
		//slideImg의 100%는 window의 넓이값의 100%가 아니라 slideWrap의 100%가 되어버린다
		//따라서 스크립트에서 slideImg의 width값을 slideCenter(오버플로우히든 주는 애)의 넓이값으로 지정해줘야함
		$slideImg.css("width",slideWidth)
		$slideWrap.css("width",slideWidth*imgNum)

		$slideWrap.css("left",-slideWidth)


	}


	function onRightNext(){

		currentPosition=$slideWrap.position().left
		//alert(currentPosition)

		$("#slideInner:not(:animated)").animate({"left":currentPosition-slideWidth},300,"easeOutCubic",function(){

			$slideWrap.children().first().appendTo($slideWrap)

			$slideWrap.css("left",-slideWidth)

		})
	}


	function onLeftPrev(){

		currentPosition=$slideWrap.position().left

		$("#slideInner:not(:animated)").animate({"left":currentPosition+slideWidth},300,"easeOutCubic",function(){

			$slideWrap.children().last().prependTo($slideWrap)

			$slideWrap.css("left",-slideWidth)

		})

	}


	function onStop(){
		clearInterval(timer)

	}

	function onPlay(){

	 timer=setInterval(onRightNext,3000)

	}


</script>

<!--지도 스크립트-->
<script>

$(document).ready(function() {

	leroroSlider('#notice_slider', 500, 5000, 1, 1);
	leroroSlider('.rollingbn', 500, 10000, 1, 1);
	leroroSlider('.recruit_notice', 500, 6000, 1, 1);

	// 서울지도
	var activeMap = $('#seoulMap area.on').attr('id');
	$('.seoul_map p').attr('class', activeMap);
	$('#seoulMap area').on('mouseenter focus', function () {
		var hoverMap = $(this).attr('id');
		$('.seoul_map p').attr('class', hoverMap);
	});
	$('.seoul_map p').on('mouseleave focusout', function () {
		if (activeMap) {
			$(this).attr('class', activeMap);
		} else {
			$(this).removeClass();
		}
	});

	noticeLayer();
});
</script>



<!--탭메뉴 스크립트-->
<script>
		$(function() {
			$('ul.tab li').click(function() {
				var activeTab = $(this).attr('data-tab');
				$('ul.tab li').removeClass('current');
				$('.tabcontent').removeClass('current');
				$(this).addClass('current');
				$('#' + activeTab).addClass('current');
			})
		});
</script>

<!--채용정보 슬라이드-->
<script>


	var $slideWrap2
	var $slideImg2
	var slideWidth2
	var $slideCenter2
	var $slideLeftBtn2
	var $slideRightBtn2
	var imgNum2
	var currentPosition2
	var imgWidth2

	$(document).ready(function(){



		$slideWrap2=$("#job_slideInner")
		$slideImg2=$("job_con_wrap")
		$slideCenter2=$("#job_list")
		$slideLeftBtn2=$("#job_btn_l")
		$slideRightBtn2=$("#job_btn_r")
		imgNum2=$slideImg2.length
		$slideWrap2.children().last().prependTo($slideWrap2);

		onImgReset2()


	//alert()

		$slideRightBtn2.bind("click",onRightNext2)
		$slideLeftBtn2.bind("click",onLeftPrev2)



		onPlay2()

		$("#job_list_wrap").bind("mouseenter",onStop2)
		$("#job_list_wrap").bind("mouseleave",onPlay2)

		//alert($("#slideWrap").innerWidth())

	})


	$(window).resize(function(){
		onImgReset2()
	})


	function onImgReset2(){

		slideWidth2=$slideCenter2.innerWidth()
		//slideImg의 width가 css에서 100%로 되어있고
		//slideImg의 부모인 slideWrap(slideImg 3개 감싼애)에는 widht값이 지정되어있지않으므로
		//slideImg의 100%는 window의 넓이값의 100%가 아니라 slideWrap의 100%가 되어버린다
		//따라서 스크립트에서 slideImg의 width값을 slideCenter(오버플로우히든 주는 애)의 넓이값으로 지정해줘야함
		$slideImg2.css("width",slideWidth2)
		$slideWrap2.css("width",slideWidth2*3)

		$slideWrap2.css("left",-slideWidth2)


	}


	function onRightNext2(){

		currentPosition2=$slideWrap2.position().left
		//alert(currentPosition)

		$("#job_slideInner:not(:animated)").animate({"left":currentPosition2-slideWidth2},300,"easeOutCubic",function(){

			$slideWrap2.children().first().appendTo($slideWrap2)

			$slideWrap2.css("left",-slideWidth2)

		})
	}


	function onLeftPrev2(){

		currentPosition2=$slideWrap2.position().left

		$("#job_slideInner:not(:animated)").animate({"left":currentPosition2+slideWidth2},300,"easeOutCubic",function(){

			$slideWrap2.children().last().prependTo($slideWrap2)

			$slideWrap2.css("left",-slideWidth2)

		})

	}


	function onStop2(){
		clearInterval(timer2)

	}

	function onPlay2(){

	 timer2=setInterval(onRightNext2,4000)

	}


</script>
<!---접근성 탭메뉴--->


<ul class="skipmenu_list">
	<li><a href="#mainmenu_list">메뉴바로가기</a></li>
	<li><a href="#btn_wrap">본문바로가기</a></li>
	<li><a href="#footer_wrap">하단바로가기</a></li>
</ul>

<div id="slideWrap">

	<div id="slide">
			<p id="slidePrev"> <img src="<c:url value='/resources/images/btn_prev.png'/>"></p>
			<p id="slideNext">	<img src="<c:url value='/resources/images/btn_next.png'/>"></p>

		<div id="slideInner" style="width: 3600px; left: -1200px;">

			<div class="contents_wrap3" id="contents_b">
				<img src="<c:url value='/resources/images/rolling_1.png'/>" alt="뉴딜커뮤니티홈">
			</div>

			<div class="contents_wrap3" id="contents_c">
				<img src="<c:url value='/resources/images/rolling_2.png'/>" alt="뉴딜커뮤니티홈">
			</div>

			<div class="contents_wrap3" id="contents_a">
				<img src="<c:url value='/resources/images/rolling_3.jpg'/>" alt="뉴딜커뮤니티홈">
			</div>


		</div>

	</div>

</div>

<div id="contents_wrap4">
	<div id="contents4">
		<div id="webzine_list">

			<div class="webzine_wrap">
				<span class="con_title">공지사항 <a href="#">&#43;</a></span>
				<ul class="webzine">
					<li class="webzine_img">
						<table class="webzine_tb">
				 			<tbody>
				 			<c:forEach items="${noticelist }" var="noticelist">
					 			<tr>
					 				<td class="index">${noticelist.ntTitle }</td>
					 				<td class="ago"><fmt:formatDate value="${noticelist.ntRegdate}" pattern="yyyy. MM. dd"/></td>
					 			</tr>
				 		   </c:forEach>
				 			</tbody>
			 			</table>
			 		</li>
				</ul>
			</div>

			<div class="webzine_wrap">
				<span class="con_title">취업행사안내 <a href="#">&#43;</a></span>
				<ul class="webzine">
					<li class="webzine_img">
						<table class="webzine_tb">
				 			<tbody>
					 	<c:forEach items="${festivallist }" var="festivallist">
					 			<tr>
					 				<td class="index">${festivallist.fesTitle }</td>
					 				<td class="ago"><fmt:formatDate value="${festivallist.fesDate}" pattern="yyyy. MM. dd"/></td>
					 			</tr>
				 		   </c:forEach>
				 			</tbody>
			 			</table>
			 		</li>
				</ul>
			</div>

			<div id="tab_container">
				<ul class="tab">
					<li class="current" data-tab="tab1"><a >교육신청 안내</a></li>
					<li data-tab="tab2"><a >프로그램 상세</a></li>

				</ul>

				<div id="tab1" class="tabcontent current">
					<table class="webzine_tb">
				 			<tbody>
					 		
					 	 	<c:forEach items="${intlist }" var="intlist">
					 			<tr>
					 				<td class="index">${intlist.intTitle }</td>
					 				<td class="ago"><fmt:formatDate value="${intlist.intDate}" pattern="yyyy. MM. dd"/></td>
					 			</tr>
				 		   </c:forEach>
				 			</tbody>
			 			</table>
			 	</div>

				<div id="tab2" class="tabcontent">
					<table class="webzine_tb">
				 			<tbody>
					 		<c:forEach items="${detlist }" var="detlist">
					 			<tr>
					 				<td class="index">${detlist.detTitle }</td>
					 				<td class="ago"><fmt:formatDate value="${detlist.detDate}" pattern="yyyy. MM. dd"/></td>
					 			</tr>
				 		   </c:forEach>
				 			</tbody>
			 			</table>
			 </div>
			</div>



		</div>
	</div>
</div>

<div id="contents_wrap1">
	<div id="contents1">

		<div id="job_list_wrap">

			<span class="con_title">채용공고<a href="#">&#43;</a></span>
			<div id="job_list">
				<p id="job_btn_l"><img src="<c:url value='/resources/images/btn_prev (2).png'/>"></p>
				<p id="job_btn_r"><img src="<c:url value='/resources/images/btn_next (1).png'/>"></p>

				<div id="job_slideInner" style="width: 1764px; left:-588px;">

					<div class="job_con_wrap">
						<ul class="job_con">
							<li class="job_logo"><img src="<c:url value='/resources/images/job1.jpg'/>"></li>
							<li>니트로소프트(주)</li>
							<li>ZWCAD 기술지원팀 모집 (2D CAD 엔지니어)</li>
							<li>접수마감: ~18.12.30</li>
						</ul>

						<ul class="job_con2">
							<li class="job_logo"><img src="<c:url value='/resources/images/job2.jpg'/>"></li>
							<li>니트로소프트(주)</li>
							<li>ZWCAD 기술지원팀 모집 (2D CAD 엔지니어)</li>
							<li>접수마감: ~18.12.30</li>
						</ul>
					</div>

					<div class="job_con_wrap">
						<ul class="job_con">
							<li class="job_logo"><img src="<c:url value='/resources/images/job3.jpg'/>"></li>
							<li>니트로소프트(주)</li>
							<li>ZWCAD 기술지원팀 모집 (2D CAD 엔지니어)</li>
							<li>접수마감: ~18.12.30</li>
						</ul>

						<ul class="job_con2">
							<li class="job_logo"><img src="<c:url value='/resources/images/job4.jpg'/>"></li>
							<li>니트로소프트(주)</li>
							<li>ZWCAD 기술지원팀 모집 (2D CAD 엔지니어)</li>
							<li>접수마감: ~18.12.30</li>
						</ul>
					</div>

					<div class="job_con_wrap">
						<ul class="job_con">
							<li class="job_logo"><img src="<c:url value='/resources/images/job2.jpg'/>"></li>
							<li>니트로소프트(주)</li>
							<li>ZWCAD 기술지원팀 모집 (2D CAD 엔지니어)</li>
							<li>접수마감: ~18.12.30</li>
						</ul>

						<ul class="job_con2">
							<li class="job_logo"><img src="<c:url value='/resources/images/job4.jpg'/>"></li>
							<li>니트로소프트(주)</li>
							<li>ZWCAD 기술지원팀 모집 (2D CAD 엔지니어)</li>
							<li>접수마감: ~18.12.30</li>
						</ul>
					</div>

				</div>

			</div>
		</div>


		<div class="section loc_info">
			<span class="con_title">서울시 일자리카페<a href="#">&#43;</a></span>
			<div class="seoul_map">
					<p class=""><img src="<c:url value='/resources/images/blank.png'/>" alt="서울시 지도(각 지역별 클릭하여 정보조회)" usemap="#seoulMap"></p>
					<map name="seoulMap" id="seoulMap"><!-- 지역활성화 고정은 area에 class="on" 처리 -->
						<area shape="poly" id="map01" alt="도봉구" href="/dobong/Main.do?method=getMain" target="_blank" coords="153,4,151,14,157,23,154,38,171,54,177,47,181,47,182,42,175,21,178,17,179,9,165,3,157,2">
						<area shape="poly" id="map02" alt="노원구" href="/nowon/Main.do?method=getMain" target="_blank" coords="172,56,184,68,191,68,200,62,206,66,210,63,215,57,214,49,214,45,204,43,203,39,201,37,204,33,204,26,202,19,204,14,204,10,198,9,197,3,187,7,180,11,179,15,179,19,176,22,179,31,181,34,181,38,183,42,183,45,181,49,177,48,172,55">
						<area shape="poly" id="map03" alt="중랑구" href="/jungnang/Main.do?method=getMain" target="_blank" coords="212,62,218,65,218,88,208,98,203,103,195,100,194,93,188,85,191,78,191,70,199,64,205,67,212,63">
						<area shape="poly" id="map04" alt="강북구" href="/gangbuk/Main.do?method=getMain" target="_blank" coords="149,13,156,25,153,39,176,62,167,72,152,65,150,59,145,59,145,54,136,51,132,42,133,33,141,30,140,26,139,22,139,19,142,16">
						<area shape="poly" id="map05" alt="동대문구" href="/dongdaemun/Main.do?method=getMain" target="_blank" coords="190,75,185,74,182,78,176,78,176,82,170,83,162,93,160,95,160,98,159,101,161,102,166,101,171,98,182,109,189,109,194,102,193,94,189,88,187,83,190,77">
						<area shape="poly" id="map06" alt="종로구" href="/jongno/Main.do?method=getMain" target="_blank" coords="129,53,133,57,133,62,138,69,137,73,138,76,136,80,134,82,136,84,139,86,142,86,145,84,149,90,150,94,154,92,157,95,160,94,158,100,152,103,147,101,142,103,137,102,131,101,126,105,121,100,118,97,117,95,118,94,119,91,117,90,120,86,118,85,118,80,117,78,116,75,114,73,116,69,114,63,119,58,125,55">
						<area shape="poly" id="map07" alt="성동구" href="/seongdong/Main.do?method=getMain" target="_blank" coords="161,103,165,103,171,100,182,110,190,110,188,114,188,119,184,124,184,127,182,128,182,133,179,133,173,130,168,129,165,126,163,125,157,129,156,126,154,125,151,126,150,122,151,120,152,116,155,115,157,111,162,106">
						<area shape="poly" id="map08" alt="광진구" href="/gwangjin/Main.do?method=getMain" target="_blank" coords="196,101,203,104,208,99,209,100,209,109,216,109,217,114,215,119,215,122,211,128,208,131,208,134,203,135,198,137,190,138,188,138,182,133,184,129,185,125,189,121,189,115,191,110">
						<area shape="poly" id="map09" alt="강동구" href="/gangdong/Main.do?method=getMain" target="_blank" coords="216,109,217,114,216,118,216,122,222,126,222,128,219,132,218,135,221,136,223,136,225,139,229,139,235,143,240,139,242,136,242,131,246,127,253,127,259,124,252,92,219,107">
						<area shape="poly" id="map10" alt="은평구" href="/eunpyoung/Main.do?method=getMain" target="_blank" coords="111,33,114,36,117,36,118,39,119,42,126,50,127,53,121,56,116,59,115,62,113,64,114,69,114,73,108,78,106,82,102,83,101,87,98,90,94,92,92,90,90,92,89,94,87,94,84,97,80,94,75,89,76,86,80,88,85,82,83,76,83,69,83,66,88,61,87,57,88,52,89,47,94,44,98,43,102,40,105,40,109,34">
						<area shape="poly" id="map11" alt="중구" href="/junggu/Main.do?method=getMain" target="_blank" coords="123,115,119,111,123,109,126,107,126,106,134,103,139,104,145,103,148,102,152,104,159,101,161,106,155,112,153,115,150,120,147,117,142,119,137,115,127,113">
						<area shape="poly" id="map12" alt="서대문구" href="/seodaemun/Main.do?method=getMain" target="_blank" coords="114,75,115,80,117,81,117,85,119,87,117,90,118,92,117,96,125,105,126,106,118,112,113,112,103,113,99,110,101,107,99,104,95,105,93,103,89,103,86,100,85,97,87,95,92,93,96,92,102,86,103,84,104,84,107,80,111,77">
						<area shape="poly" id="map13" alt="마포구" href="/mapo/Main.do?method=getMain" target="_blank" coords="74,86,75,86,74,90,83,97,86,99,90,104,93,103,96,105,99,105,100,107,99,110,102,114,119,113,123,115,124,116,124,119,120,119,120,120,120,123,117,128,112,128,112,135,110,133,107,133,105,131,105,129,100,126,91,126,88,123,84,123,80,120,78,116,75,116,71,111,67,110,64,105,60,104,58,99,65,97,68,95,69,92,69,88">
						<area shape="poly" id="map14" alt="용산구" href="/yongsan/Main.do?method=getMain" target="_blank" coords="125,115,128,114,131,115,135,115,142,120,147,119,150,120,149,124,151,126,155,126,158,129,153,134,150,137,149,141,140,146,134,146,132,148,128,147,125,145,121,146,115,141,112,136,113,129,118,129,121,125,121,121,124,119">
						<area shape="poly" id="map15" alt="강남구" href="/gangnam/Main.do?method=getMain" target="_blank" coords="164,126,169,130,172,130,176,134,182,134,188,139,188,141,189,142,188,146,190,153,195,155,208,162,210,161,214,167,215,171,221,176,223,186,219,188,219,190,217,193,213,190,209,192,206,192,205,186,205,182,200,180,199,175,196,175,193,177,189,175,184,181,180,179,177,179,173,174,173,170,170,167,167,168,164,164,164,159,160,156,160,151,157,147,157,141,154,136,159,129">
						<area shape="poly" id="map16" alt="송파구" href="/songpa/Main.do?method=getMain" target="_blank" coords="189,139,190,142,189,145,190,152,197,156,206,160,211,161,215,168,215,170,222,178,224,185,228,186,229,185,229,179,232,179,237,179,240,175,240,171,243,171,244,167,244,165,247,162,246,155,243,152,237,153,232,151,234,147,235,143,230,140,223,138,218,136,218,134,220,126,216,124,213,128,210,131,209,133,207,136,198,138">
						<area shape="poly" id="map17" alt="강서구" href="/gangseo/Main.do?method=getMain" target="_blank" coords="1,113,4,112,6,104,11,102,10,99,18,95,22,88,21,78,25,74,36,87,42,88,46,94,50,93,55,98,58,98,59,104,61,105,65,106,65,109,68,110,70,110,71,113,74,117,77,117,79,120,75,122,68,120,64,118,60,118,60,120,60,124,61,128,60,132,57,135,55,134,53,135,46,134,43,128,43,124,40,119,37,125,36,130,32,127,28,127,22,130,18,129,16,125,10,126,5,123,0,118">
						<area shape="poly" id="map18" alt="양천구" href="/yangcheon/Main.do?method=getMain" target="_blank" coords="40,121,39,124,38,126,37,129,37,130,37,134,35,139,37,146,37,148,41,148,42,152,45,156,46,156,46,152,51,150,53,148,57,148,60,150,62,152,66,152,67,149,69,146,73,144,73,138,75,134,79,131,79,127,76,124,75,122,68,121,63,119,61,120,61,125,62,130,60,132,58,135,55,134,52,136,50,136,45,133,43,130,42,125">
						<area shape="poly" id="map19" alt="영등포구" href="/yeongdeungpo/Main.do?method=getMain" target="_blank" coords="76,122,79,120,82,123,84,124,88,124,91,126,99,127,102,128,105,131,107,134,111,134,113,139,109,142,102,143,100,144,100,147,98,150,97,155,97,157,93,158,90,162,86,167,83,166,79,159,79,157,81,152,80,148,75,144,74,137,77,132,80,129">
						<area shape="poly" id="map20" alt="동작구" href="/dongjak/Main.do?method=getMain" target="_blank" coords="88,167,94,166,98,164,100,164,101,160,104,160,107,162,110,162,114,161,117,163,120,161,122,160,123,163,121,165,124,170,123,173,127,176,132,175,135,174,136,170,135,167,137,165,134,161,137,156,136,155,133,152,133,150,130,149,127,148,125,146,121,147,114,142,108,143,101,144,101,147,99,150,98,154,94,158,91,162">
						<area shape="poly" id="map21" alt="서초구" href="/seocho/Main.do?method=getMain" target="_blank" coords="134,147,140,147,145,145,148,143,150,140,152,136,154,139,157,142,156,145,160,151,159,156,163,160,163,165,166,168,168,168,171,169,172,172,172,175,177,179,179,181,181,180,184,181,190,176,194,178,197,175,200,177,199,180,204,182,206,186,205,191,205,192,201,197,201,201,201,203,193,204,192,207,191,209,191,210,190,212,189,214,188,215,184,214,181,213,179,215,175,212,174,210,173,208,169,209,167,206,166,201,166,198,168,195,168,194,168,191,167,190,166,187,166,184,166,182,164,185,163,191,161,193,157,194,152,194,150,192,148,188,146,185,144,187,142,189,140,186,138,183,138,180,135,176,136,170,136,167,137,166,137,163,135,161,138,156,135,152,134,151">
						<area shape="poly" id="map22" alt="구로구" href="/guro/Main.do?method=getMain" target="_blank" coords="36,149,40,148,41,152,44,156,45,156,46,153,52,149,56,149,61,153,64,153,67,152,69,147,74,144,79,148,80,151,79,153,77,156,78,158,80,160,81,163,81,165,83,166,85,167,85,169,83,172,79,172,77,170,75,166,73,166,68,166,65,164,64,161,63,164,61,167,59,169,57,171,54,172,52,172,51,174,51,176,49,179,46,179,44,177,43,176,41,177,38,178,35,176,33,173,32,172,32,168,31,166,33,165,33,162,30,161,31,158,31,156,35,152">
						<area shape="poly" id="map23" alt="금천구" href="/geumcheon/Main.do?method=getMain" target="_blank" coords="69,166,74,167,75,170,78,173,84,173,86,171,90,171,91,174,91,175,89,176,88,178,90,181,93,182,93,185,93,188,93,189,98,190,99,191,99,193,99,197,98,203,96,206,94,207,90,206,88,206,85,207,82,205,82,202,82,199,79,196,76,194,75,192,76,185,75,182,69,180,67,177,67,170">
						<area shape="poly" id="map24" alt="관악구" href="/gwanak/Main.do?method=getMain" target="_blank" coords="85,170,87,167,91,167,94,166,97,165,99,165,101,161,105,162,108,163,111,164,113,163,115,162,117,164,118,164,121,162,122,163,121,165,120,166,123,168,124,171,123,174,128,176,132,175,135,177,139,186,142,189,141,191,139,193,137,193,137,196,132,198,128,201,125,200,125,204,122,206,112,208,105,205,100,200,99,190,96,189,93,188,93,182,89,179,91,175,91,172,89,171">
						<area shape="poly" id="map25" alt="성북구" href="/seongbuk/Main.do?method=getMain" target="_blank" coords="131,54,136,52,140,54,144,54,144,56,144,59,149,60,150,60,150,65,151,66,156,67,162,72,165,72,167,73,171,67,177,64,183,69,190,70,190,73,184,74,182,77,176,78,175,81,169,82,159,94,156,92,154,92,151,93,150,90,146,84,141,86,137,83,135,83,139,76,138,73,138,70,137,65,133,61,133,58">
					</map>
			</div>
			<ul class="map_name">
				<li> </li>
				<li> </li>
				<li> </li>
				<li> </li>
				<li> </li>
				<li> </li>
				<li> </li>
				<li> </li>
				<li> </li>
			</ul>
		</div>

	</div>
</div>

<style>
.seoul_map {background:#ffc70b; overflow:hidden;}
.seoul_map p {width:260px; height:217px; margin:28px auto 18px; background:url(resources/images/sp_map.png) no-repeat -780px -1302px;}
.seoul_map p.map01 {background-position:0 0;}
.seoul_map p.map02 {background-position:-260px 0;}
.seoul_map p.map03 {background-position:-520px 0;}
.seoul_map p.map04 {background-position:-780px 0;}
.seoul_map p.map05 {background-position:0 -217px;}
.seoul_map p.map06 {background-position:-260px -217px;}
.seoul_map p.map07 {background-position:-520px -217px;}
.seoul_map p.map08 {background-position:-780px -217px;}
.seoul_map p.map09 {background-position:0 -434px;}
.seoul_map p.map10 {background-position:-260px -434px;}
.seoul_map p.map11 {background-position:-520px -434px;}
.seoul_map p.map12 {background-position:-780px -434px;}
.seoul_map p.map13 {background-position:0 -651px;}
.seoul_map p.map14 {background-position:-260px -651px;}
.seoul_map p.map15 {background-position:-520px -651px;}
.seoul_map p.map16 {background-position:-780px -651px;}
.seoul_map p.map17 {background-position:0 -868px;}
.seoul_map p.map18 {background-position:-260px -868px;}
.seoul_map p.map19 {background-position:-520px -868px;}
.seoul_map p.map20 {background-position:-780px -868px;}
.seoul_map p.map21 {background-position:0 -1085px;}
.seoul_map p.map22 {background-position:-260px -1085px;}
.seoul_map p.map23 {background-position:-520px -1085px;}
.seoul_map p.map24 {background-position:-780px -1085px;}
.seoul_map p.map25 {background-position:0 -1302px;}
.seoul_map p img {width:100%; height:100%;}
</style>

