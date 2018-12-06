<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div style="margin:0px auto; width:800px;height: 450px; margin-top:100px;">
			<div>
				<h1>
					<span style="color: #3b6aca;font-size: 36px;line-height: 24px;margin-left:200px;">뉴딜 일자리</span> 회원가입
				</h1>
				<br>
				<br>
				<p style="margin-left:100px;">
					<span style="font-size: 18px;line-height: 24px; color: #707070;">고객님께서는 해당하시는 회원의 종류를 선택하여 주세요.</span><br>
					<span style="font-size: 18px;line-height: 24px; color: #707070;">회원종류에 따라 가입절차와 권한의 차이가 있으니 반드시 본인의</span><br>
					<span style="font-size: 18px;line-height: 24px; color: #707070;">해당여부를 파악하여 회원가입을 선택해 주시기 바랍니다.</span><br><br>
				</p>
				<br>
					<b style="font-size: 19px;line-height: 24px;margin-left: 270px; margin-top:100px;">회원종류 선택</b><br><br>
				
				<div class="section">
			
					<div style="    font-family: 'NanumBarunGothic','나눔바른고딕','Dotum', sans-serit;
    margin: 0;
    padding: 0;
    font-size: 14px;
    line-height: 20px;
    font-weight: normal;
    letter-spacing: -0.5px;
    color: #000;
}">
						<div style="padding: 30px 30px 30px 50px;position: relative;border: 1px solid #bbb;display: inline-block;text-align: center;font-size: 18px;">		
							개인회원
							<a href="<c:url value='/normalsignin'/>"><img src="<c:url value='/resources/images/signin.jpg'/>" style="padding-left: 70px;width: 100px;"></a>				
						</div>
						<div style="padding: 30px 30px 30px 50px;position: relative;border: 1px solid #bbb;display: inline-block;text-align: center;font-size: 18px;">
							기업회원 (교육담당자)
							<a href="<c:url value='/companysignup'/>"><img src="<c:url value='/resources/images/companysignin.jpg'/>"  style="padding-left: 20px;width: 100px;"></a>
						</div>
					</div>
				</div>
				
				<br>
				<p style="font-size: 14px;line-height: 24px; margin-left:200px;">
					<span>★  개인회원: 뉴딜일자리에 참여중인 일반 개인회원</span><br>
					<span>★ 기업회원: 교육담당자(유니에스 / KSA)</span>
				</p>
		</div>
	</div>
	<br>