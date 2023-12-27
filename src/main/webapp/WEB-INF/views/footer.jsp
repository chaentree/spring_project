<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<!-- footer -->
	    <footer class="footer">
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