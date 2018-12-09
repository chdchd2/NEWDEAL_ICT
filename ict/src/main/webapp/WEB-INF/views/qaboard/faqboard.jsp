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
         $menuBg.animate({"top":-160},200,"easeOutCubic")
      }

</script>
<section>   

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
                           <td><a href="#a">뉴딜일자리 사업은 어떤 사업인가요?</a></td>
                           <td>관리자</td>
                           <td>2018.01.01</td>
                        </tr>
                        <tr class="clear">
                           <td colspan="4">
                              ○시민생활에 필요한 서비스를 제공하고 <br>
                              ○참여자에게는 일 경험 제공 및 직업역량 배양을 통해 <br>
                              ○참여자의 민간일자리 진입을 촉진하기 위한 사업입니다 <br>
                           </td>
                        </tr>
                        <tr >
                           <td>2</td>
                           <td><a href="#a">제출서류는 무엇인가요?</a></td>
                           <td>관리자</td>
                           <td>2018.01.01</td>
                        </tr>
                        <tr class="clear">
                           <td colspan="4">
                              ① 서울형 뉴딜일자리 사업 참여 신청서 (필수)<br>
                              ② 개인정보 수집·이용·제공 동의서 (필수)<br>
                              ③ 구직등록필증  (필수)<br>
                              ④ 주민등록등본  (필수)<br>
                              ⑤ 기타 가점 증빙서류  (선택)<br>
                                 (장애인, 국가유공자, 북한이탈주민,결혼이주여성,여성세대주)<br>
                              ⑥ 기타 개별사업에서 정한 요건을 확인하기 위한 서류<br>
                               ( 아동·청소년을 대상으로 하는 사업은 성범죄경력조회 필요)<br>
                           </td>
                        </tr>   
                        <tr class="odd">
                           <td>3</td>
                           <td><a href="#a">구직등록필증은 무엇이며 어디서 발급받는 건가요?</a></td>
                           <td>관리자</td>
                           <td>2018.01.01</td>
                        </tr>
                        <tr class="clear">
                           <td colspan="4">
                              구직등록필증은 서울일자리포털에 회원가입 후 구직등록을 하면 발급 가능한 서류입니다<br>
1. 온라인으로 구직신청 후, 지정된 담당 상담사에게 연락후 이메일이나, 팩스로 받아 볼수 있습니다.<br>
2. 또는 서울시일자리포털(www.job.seoul.go.kr) ->개인서비스>구직관리로 들어가서  구직필증버튼을 클릭하면 팝업창이 나오시며 해당 팝업창을 출력하면 됩니다.<br>
3. 가까운 자치구 일자리센터 방문 후에 발급 받을수 수 있습니다. 자세한 문의사항은 1588-9142로 문의 바랍니다.<br>
                           </td>
                        </tr>
                        <tr>
                           <td>4</td>
                           <td><a href="#a">청년사업에 중장년은 참여할수 없는 건가요?</a></td>
                           <td>관리자</td>
                           <td>2018.01.01</td>
                        </tr>
                        <tr class="clear">
                           <td colspan="4">
                              청년사업의 경우 만 18세 이상 39세 이하의 서울시민으로서 사업 참여배제 사유가 없는 자로 되어 있습니다<br>
중장년의 경우는 만 18세 이상 일반사업에 참여가 가능하오니 공고내용의 연령조건을 잘 보고 지원하시기 바랍니다<br>
                           </td>
                        </tr>
                        <tr class="odd">
                           <td>5</td>
                           <td><a href="#a">뉴딜일자리를 참여하고 있는데 건강검진을 받아야 하나요?</a></td>
                           <td>관리자</td>
                           <td>2018.01.01</td>
                        </tr>
                        <tr class="clear">
                           <td colspan="4">
                              사업참여 1개월이내에 건강검진을 받아야 하며  최근 6개월이내 건강검진결과 통보서를 제출할경우 대체가능합니다.
                           </td>
                        </tr>
                        <tr>
                           <td>6</td>
                           <td><a href="#a">근무기간이 참여자별 최대 23까지 근무가 가능한가요?</a></td>
                           <td>관리자</td>
                           <td>2018.01.01</td>
                        </tr>
                        <tr class="clear">
                           <td colspan="4">기본적으로 참여자는 계약기간 동안 근무하게 됩니다.<br>
예외적으로 연말에 사업평가를 거쳐 근무연장 승인을 받은 사업에 한하여, 23개월까지 연속 참여가 가능합니다.<br>
또한, '17.7.1일자로 뉴딜 사업지침이 변경되어 기존에는 뉴딜 참여경력이 있으면 원칙적으로 뉴딜 사업 참여가 배제되었으나,<br>
이제는 과거 참여경력이 있더라도 총합 23개월을 초과하지 않는 경우 사업 참여신청이 가능하게 되었습니다.<br>
단, 사업 안정성을 위해 지원하는 사업의 사업기간보다 잔여 참여기간이 더 많이 남았을 때 지원이 가능합니다.<br>
(예컨대 기존에 뉴딜일자리 사업에 20개월 참여한 경력이 있는 자는 잔여 참여기간이 3개월이므로 사업기간이 8개월인 사업에 지원할 수 없음)
                           </td>
                        </tr>
                        <tr class="odd">
                           <td>7</td>
                           <td><a href="#a">지금은 서울시민인데 곧 다른시로 이사계획이 있는데 참여가 가능한가요?</a></td>
                           <td>관리자</td>
                           <td>2018.01.01</td>
                        </tr>
                        <tr class="clear">
                           <td colspan="4">
                              서울형 뉴딜일자리 사업은 서울시민이 아닌자는 참여할수 없습니다.<br>
                              지원할 당시에 서울시민이었다 하더라도 중간에 다른지역으로 이사를 했을경우는 참여배제 대상이 됨을 안내드립니다
                           </td>
                        </tr>
                        <tr>
                           <td>8</td>
                           <td><a href="#a">뉴딜일자리 매니저는 어떤일을 하나요?</a></td>
                           <td>관리자</td>
                           <td>2018.01.01</td>
                        </tr>
                        <tr class="clear">
                           <td colspan="4">
                              뉴딜일자리 사업추진에 있어 전문인력을 확충하여 사업의 완성도를 높이고 ,<br>
                              참여자에 대한 경력관리를 담당토록 하여 사업의 성공적 추진및 참여자 관리를 합니다.
                           </td>
                        </tr>
                        <tr class="odd">
                           <td>9</td>
                           <td><a href="#a">직무교육 50시간은 어떤 방식으로 채울 수 있는지?</a></td>
                           <td>관리자</td>
                           <td>2018.01.01</td>
                        </tr>
                        <tr class="clear">
                           <td colspan="4">
                           ○ 교육목적 : 참여자 전문성 강화, 대시민 서비스 품질제고<br>
                           ○ 교육주관 : 사업 담당공무원(뉴딜일자리 매니저 협조)<br>
                           ○ 교육시간 : 1인당 평균 50시간 이상<br>
                           ○ 시행방법 : 사업추진부서 자체교육 또는 전문기관 위탁교육<br>
                           ○ 교육내용 : 현장 맞춤형 직무교육 및 직업역량 교육 강화<br>

                           </td>
                        </tr>
                        <tr>
                           <td>10</td>
                           <td><a href="#a">실업급여는 어떻게 신청하나요?</a></td>
                           <td>관리자</td>
                           <td>2018.01.01</td>
                        </tr>
                        <tr class="clear">
                           <td colspan="4">
                           실업급여는 크게 구직급여와 취업촉진수당으로 구분 ☞ 실업급여 문의 고용노동동부 고객상담센터 1350<br>
                           실업급여는 근무기간이 180일 이상이고 비자발적 퇴사의 사유이면 해당이 됩니다.<br>
                           주소지 관할 고용센터에 방문하셔서 상담받으시길 바라며,<br>
                           고용센터에 제출하는 이직확인서는 급여지급 담당자에게 요청하시면 됩니다.<br>
                           </td>
                        </tr>
                     </tbody>
                  </table>

                  <%-- <div id="page">
                     <p><a href="#a"><img src="<c:url value='/resources/images/page_Leftbtn.png'/>" alt="페이지왼쪽버튼"></a></p>
                     <ul>
                        <li><a href="#a" class="pageActive">1</a></li>
                        <li><a href="#a">2</a></li>
                        <li><a href="#a">3</a></li>
                        <li><a href="#a">4</a></li>
                        <li><a href="#a">5</a></li>
                     </ul><p><a href="#a"><img src="<c:url value='/resources/images/page_Rightbtn.png'/>" alt="페이지오른쪽버튼"></a></p>
                  </div> --%>
               </div>
            </div>
         </div>
      
</section>

</html>
<%@include file="/WEB-INF/views/footer.jsp" %>