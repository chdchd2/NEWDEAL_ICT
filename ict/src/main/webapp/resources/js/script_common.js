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
		$mainMenu.bind("focus",onOver)
		$mainMenu.bind("mouseleave",onMainColor)
		$("#header_wrap").bind("mouseleave",onOut)

	})

	function onMainColor(){

		$mainMenu.css("color","black")
	}


	function onOver(){

		$(this).css({"color":"#0131ca","font-family":"N_Square_B"})

		$menuBg.stop()
		 $menuBg.animate({"top":0},200,"easeOutCubic",function(){
			$subMenu.show()
			$subMenu.animate({opacity:1},200,"easeOutCubic")
		})

	}


	function onOut(){

		$menuBg.stop()
		
		$mainMenu.css({"font-family":"N_Square_R"})
		$subMenu.css("opacity",0)
		$subMenu.hide()
		//$menuBg.slideUp(200,"easeOutCubic")
		$menuBg.animate({"top":-110},200,"easeOutCubic")
	}

</script>

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

	 timer=setInterval(onRightNext,2000)

	}


</script>
