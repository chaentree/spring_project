<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/nike/favicon.png" rel="icon">	
<title>Nike.com 계정설정</title>

<style>
.left {
	position : relative;
	left:50px;
	float: left;
	/*margin: 0px 50px 50px 50px;
	padding : 0px 500px 500px 50px;*/
	color : #111;
	border-collapse: collapse;

}
/* 위쪽 오른쪽 아래쪽 왼쪽 마진속성 한번에 주기*/
.main {
	position : absolute;
	left : 25%;
	top : 400%;
	width: 40%;
	height: 100px;
	border-collapse: collapse;
	/*margin : -50px 500px 500px 500px;*/
	/*padding : -50px 500px 500px 500px;*/
}

input[type="text"], input[type="password"] {
	border-radius: 15px;
	font-family: "paybooc-Light", sans-serif;
	text-decoration: none;
	font-weight: 600;
	transition: 0.25s;
	border: 1px solid #6e6e6e;
	color: #6e6e6e;
	width : 70%
	}
	a{
	color:#111;
	/* 위쪽 오른쪽 아래쪽 왼쪽 마진속성 한번에 주기*/
	}
input[type="button"]{
			padding: 6px 20px;
	    	border-radius: 30px;
	    	font-family: "paybooc-Light", sans-serif;
	    	text-decoration: none;
	    	font-size: 15px;
	    	font-weight: 600;
	    	transition: 0.25s;
	    	border:1px solid #111111;
	    	background-color:#111111;
	    	color:#fff;
	    	cursor:pointer;
		}
			input[type="checkbox"] {
		  	background-color: #757575;
 			 border: 2px solid #757575;;
			}
			input[type="checkbox"]:checked {
			border: 0.4em solid tomato;
  			background-color: #757575;
			}
</style>


</head>
<body>
	<%@ include file = "../views/header.jsp" %>
		    <section class="section section0">
	    <!-- 회색 배너 부분 : 나이키 사이트에 현재 content가 비어있음 -->
	        <div class="banner">
	        </div>
	    </section>
<div>
 <h1 style="left :2%;"><br>&nbsp;&nbsp;설정<br><br></h1>
</div>
<div>
		<table class="left" style="width:200px; font-size:16px;">
			<tr>
			<td style="cursor:pointer;" onclick="location.href='member_modi_form.do?userid=${vo.userid}'"><img src="resources/nike/person.png" style="width: 30px; height: auto; display:inline;" >
			&nbsp;&nbsp;&nbsp;&nbsp;계정 설정</td>
			</tr>
			<tr>
				<td style="cursor:pointer;" onclick="location.href='payment_method.do?userid=${vo.userid}'"><br><img src="resources/nike/free-icon-card-8140435.png" style="width: 30px; height: auto; display:inline;" >
				&nbsp;&nbsp;&nbsp;&nbsp;결제 수단 관리</td>
			</tr>
			<tr>
				<td style="cursor:pointer;" onclick="location.href='addr_form.do?userid=${vo.userid}'"><br><img src="resources/nike/shipping.png" style="width: 30px; height: auto; display:inline;" >
				&nbsp;&nbsp;&nbsp;&nbsp;배송지 관리</td>
			</tr>
			<tr>
				<td style="cursor:pointer;" onclick="location.href='shop_preferences.do?userid=${vo.userid}'"><br><img src="resources/nike/free-icon-measure-335446.png" style="width: 30px; height: auto; display:inline;" >
				&nbsp;&nbsp;&nbsp;&nbsp;구매 맞춤 정보 설정</td>
			</tr>
			<tr>
				<td style="cursor:pointer;" onclick="location.href='communication_preferences.do?userid=${vo.userid}'"><br><img src="resources/nike/free-icon-letter-1250663.png" style="width: 30px; height: auto; display:inline;" >
				&nbsp;&nbsp;&nbsp;&nbsp;마케팅 수신 동의 설정</td>
			</tr>
			<tr>
				<td style="cursor:pointer;" onclick="location.href='privacy.do?userid=${vo.userid}'"><br><img src="resources/nike/person_scret.png" style="width: 30px; height: auto; display:inline;" >
				&nbsp;&nbsp;&nbsp;&nbsp;개인 정보관리</td>
			</tr>
			<tr>
				<td style="cursor:pointer;" onclick="location.href='profile_visibility.do?userid=${vo.userid}'"><br><img src="resources/nike/person_scret.png" style="width: 30px; height: auto; display:inline;" >
				&nbsp;&nbsp;&nbsp;&nbsp;프로필 공개 설정</td>
			</tr>
			<tr>
				<td style="cursor:pointer;" onclick="location.href='linked_accounts.do?userid=${vo.userid}'"><br><img src="resources/nike/free-icon-link-126481.png" style="width: 30px; height: auto; display:inline;" >
				&nbsp;&nbsp;&nbsp;&nbsp;계정 연동</td>
			</tr>

		</table>
		</div>
		<div class="main">
			<div style="marign:0px 0px 36px; width:588.98px; height: 28px;">
				<h2 style="font-weight:500; font-size:24px; line-height:28px;">계정 연동</h2>
			</div>
			<div>
			<br><br>
			나이키 계정예 연결된 계정과 서비스를 관리합니다.
			<br><br>
			</div>
			<div style="height:112px; padding:12px 0px 0px;">
			<div style="background-color:#e5e5e5; width:588.95px; height:76px; margin:24px 0px 0px; ">
				<br>&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:17px;">Ø</span> 연결된 앱 또는 서비스가 없습니다.
			</div>
			</div>
			
			
		</div>	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
			    <!-- footer -->
	    <footer class="footer" style="margin-top:50%">
	        <div class="group">
	            <div class="top">
	                <div class="left">
	                    <ul class="1st">
	                        <li><a href="#"><h4>새로운 소식</h4></a></li>
	                        <li><a href="#"><h4>멤버가입</h4></a></li>
	                        <li><a href="#"><h4>매장안내</h4></a></li>
	                        <li><a href="#"><h4>나이키 저널</h4></a></li>
	                    </ul>
	                    <ul class="2nd">
	                        <li><a href="#"><h4>도움말</h4></a></li>
	                        <li><a href="#"><p>로그인 안내</p></a></li>
	                        <li><a href="myorder.do?userid=${vo.userid }"><p>주문배송조회</p></a></li>
	                        <li><a href="#"><p>반품 정책</p></a></li>
	                        <li><a href="#"><p>결제 방법</p></a></li>
	                        <li><a href="#"><p>공지사항</p></a></li>
	                        <li><a href="#"><p>문의하기</p></a></li>
	                    </ul>
	                    <ul class="3rd">
	                        <li><a href="#"><h4>ABOUT NIKE</h4></a></li>
	                        <li><a href="#"><p>소식</p></a></li>
	                        <li><a href="#"><p>채용</p></a></li>
	                        <li><a href="#"><p>투자자</p></a></li>
	                        <li><a href="#"><p>지속가능성</p></a></li>
	                    </ul>
	                </div>
	                <div class="right">
	                    <div class="con">
	                        <button><img src="resources/nike/twitter.svg"></button>
	                        <button><img src="resources/nike/facebook-f.svg"></button>
	                        <button><img src="resources/nike/youtube.svg"></button>
	                        <button><img src="resources/nike/instagram2.svg"></button>
	                    </div>
	                </div>
	            </div>
	            <div class="middle">
	                <div class="location">
	                    <a href="#"><img src="resources/nike/location.png"></a>
	                    <a href="#">대한민국</a>
	                </div>
	                <div class="copyright">
	                    <p>© 2022 Nike, Inc. All Rights Reserved</p>
	                </div>
	                <div class="info">
	                        <p><a href="#">이용약관</a></p>
	                        <p><a href="#">개인정보처리방침</a></p>
	                </div>
	            </div>
	            <div class="bottom">
	                <div class="left">
	                    <p>
	                        <span>(유)나이키코리아 대표 Kimberlee Lynn Chang Mendes, 킴벌리 린 창 멘데스 | 서울 강남구 테헤란로 152 강남파이낸스센터 30층 |</span><br>
	                        <span>통신판매업신고번호 2011-서울강남-03461 | 등록번호 220-88-09068 <a href="#">사업자 정보 확인</a></span>
	                        <br>
	                        <span>고객센터 전화 문의 <a href="#">080-022-0182</a> FAX 02-6744-5880 | 이메일 <a href="#">service@nike.co.kr</a> | 호스팅서비스사업자 (유)나이키코리아</span>
	                    </p>
	                </div>
	                <div class="right">
	                    <p>
	                        <span>현금 등으로 결제 시 안전 거래를 위해 저희 쇼핑몰에서 가입한 파이서브코리아의 구매 안전 서비스(<a href="#">결제대금예치</a>)를 이용하실 수 있습니다.</span><br>
	                        <span>온라인디지털콘텐츠산업발전법에 의한 콘텐츠 보호 안내 <a href="#">자세히 보기</a></span>
	                    </p>
	                </div>
	            </div>
	        </div>
	    </footer>
	
</body>
</html>