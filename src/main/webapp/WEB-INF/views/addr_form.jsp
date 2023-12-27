<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
	<head>
<link href="resources/nike/favicon.png" rel="icon">
		<meta charset="UTF-8">
		<title>Nike. Just Do It. Nike 코리아</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nike.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.css">
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	</head>
	<body>
<%@ include file = "../views/header.jsp" %>
			<!-- section0:banner -->
	    <section class="section section0">
	    	<!-- 회색 배너 부분 : 나이키 사이트에 현재 content가 비어있음 -->
	        <div class="banner">
	        </div>
	    </section>
		</body>
		
<style>
		input[type="button"]{
			padding: 6px 20px;
	    	border-radius: 30px;
	    	font-family: "paybooc-Light", sans-serif;
	    	text-decoration: none;
	    	font-weight: 600;
	    	transition: 0.25s;
	    	border:1px solid #6e6e6e;
	    	color:#fff;
	    	background-color:#111;
	    	cursor:pointer;
		}
	.main {
	position : absolute;
	width: 600.98px;
	height: 252px;
	margin: 0 0 0 140px;
	padding : 36px 6px 48px;
	border-collapse: collapse;
	left:20%
}
	.left {
	position : relative;
	left:50px;
	float: left;
	left:50px;
	/*margin: 0px 50px 50px 50px;
	padding : 0px 500px 500px 50px;*/
	color : #111;
	border-collapse: collapse;

}	

		
		input[type="password"]{
		    padding: 15px 30px;
	    	border-radius: 15px;
	    	font-family: "paybooc-Light", sans-serif;
	    	text-decoration: none;
	    	font-weight: 600;
	    	transition: 0.25s;
	    	border:1px solid #6e6e6e;
	    	color: #6e6e6e;
		}
		</style>
	
<script>

function send(f){
var userid = document.getElementById("userid").value;

var _width ='600';
var _height = '500';

 var _left = Math.ceil(( window.screen.width - _width )/2);
 var _top = Math.ceil(( window.screen.height - _height )/2);

 openWin = window.open('add_adrr_form.do?userid='+userid, 'popup-test', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
}
</script>

	<!-- 원래바디 -->
	<body>
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
				<td style="cursor:pointer;" onclick="location.href='member_modi_form.do?userid=${vo.userid}'"><br><img src="resources/nike/free-icon-card-8140435.png" style="width: 30px; height: auto; display:inline;" >
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
		<form>
		<div class = "main">
		<input type="hidden" id="userid" name="userid" value="${vo.userid }">
			<div style="marign:0px 0px 36px; width:588.98px; height: 28px;">
				<h2>저장된 배송지<br></h2>
			</div>
			<c:set var="ad" value="${vo.addr}"/>
			
			<c:if test="${ad eq '0' || ad eq null}"> 
			<div style="width : 588.98px; height: 104px;">
				<p><br>현재 저장된 배송지가 없습니다. 더 빠른 주문 결제를 위해 배송지를 미리 입력해두세요.</p>
				<div style="float : right;"><br><input type="button" name="add_addr_btn" id="add_addr_btn" value="주소 추가" onclick="send(this.form)">
				</div>
			</div>
			</c:if>
			<c:if test="${ad ne '0' && ad ne null}">
				<div style="width : 588.98px; height: 104px;">
					<div style="color:#111; font-weight : bold;">
						<br>기본 배송지
					</div>
					<div style="color:#757575">
					<br>
						성함 : ${vo.last_name} ${vo.first_name}<br>
						연락처 :  ${vo.phone}<br>
						주소  <br>${vo.addr}<br>
			
						<div style="float : right;"><br><input type="button" name="add_addr_btn" id="add_addr_btn" value="주소 수정" onclick="send(this.form)">
						</div>
					</div>
				</div>
			</c:if>
			
			
			
		</div>
		</form>
		
	</div>	
	</body>
	
	
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
<script>
	/* header */
	/* 첫번째 헤더 부분 고객센터 마우스 엔터 : 서브메뉴 나타나게 */
	$('.center').mouseenter(function() {
		$('.menu-sub').stop().slideDown();
	});
	/* 첫번째 헤더 부분 고객센터 마우스 리브 : 서브메뉴 나타나게 */
	$('.center').mouseleave(function() {
		$('.menu-sub').stop().slideUp();
	});
	
	/* 회원정보관리 마우스 올릴시 호버 작동 */
	
	$('.member').mouseenter(function() {
		$('.menu-sub_mem').stop().slideDown();
	});
	/* 첫번째 헤더 부분 고객센터 마우스 리브 : 서브메뉴 나타나게 */
	$('.member').mouseleave(function() {
		$('.menu-sub_mem').stop().slideUp();
	});
	
	/* search-box 클릭시  */
	$('.header .search-box').click(function() {
		$('.pre-modal').stop().fadeIn();
	})
	
	$('.pre-modal #cancel').click(function() {
		$('.pre-modal').hide();
	})
	
	/* section8 슬라이드 부분 */
	$('.shoes-slider').owlCarousel({
		items : 3, // 보여지는 개수
		nav : true, // prev, next 버튼
		loop : true, // 마지막 이미지 다음에 첫번째 이미지 나오게
		margin : 30, // 이미지 양 옆 마진
		autoplay : true, // 자동 이미지 슬라이드
		autoplayTimeout : 2000,
		responsive : {
			200 : {
				items : 1
			},
			400 : {
				items : 2
			},
			600 : {
				items : 3
			}
		}
	// 반응형 
	});
</script>
</html>