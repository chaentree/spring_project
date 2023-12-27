<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="resources/nike/favicon.png" rel="icon">
      <meta charset="UTF-8">
      <title>Nike. Just Do It. Nike 코리아</title>
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nike.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
      <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.css">
      <link rel="preconnect" href="https://fonts.gstatic.com">
      <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/buy_main_2.css">
	<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nike.css">
</head>
<body>
	<header class="header">
		<img src="${pageContext.request.contextPath}/resources/nike/n-logo.png"
									 width="80px" height="80px">
	</header>
	<div class="wrap">
		<div class="container">
			<h1>주문해 주셔서 감사합니다.</h1>
			<p>배송이 시작되면 SMS/이메일로 배송이 안내 됩니다.</p>
			<input type="button" value="주문내역/배송현황" onclick="location.href='login.do?userid=${vo.userid}'">
		</div>
		
		<div class="t1">
			<table>
				<tr>
					<td class="td1">주문날짜</td>
					<td class="td2">
						<div id="current_date"></div>
					</td>
				</tr>
				<tr>
					<td class="td1">결제완료금액</td>
					<td class="td2"><fmt:formatNumber value="${total.totalprice}" pattern="###,###,###"/> 원</td>
				</tr>
			</table>
		</div>
		
		<div class="t2" >
			<table border="1" align="center">
				<caption>배송주문상품 정보</caption>
				<tr>
					<td>주문번호</td>
					<td>주문상품내역</td>
				</tr>
				<c:forEach var = "va" items="${va}" varStatus="status">
				<tr>
					<td>${va.cart_id}</td>
					 
					<td>
						<img src="${pageContext.request.contextPath}/resources/upload/${va.filename}"
											 width="150px" height="150px">
						<h3>${va.p_name}</h3>
		            	<p>옵션 : ${va.p_size}</p>
		            	<p>수량 : ${va.cart_quantity}</p>
					</td>
					  
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>

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
						<li><a href="#"><p>주문배송조회</p></a></li>
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
						<button>
							<img src="resources/nike/twitter.svg">
						</button>
						<button>
							<img src="resources/nike/facebook-f.svg">
						</button>
						<button>
							<img src="resources/nike/youtube.svg">
						</button>
						<button>
							<img src="resources/nike/instagram2.svg">
						</button>
					</div>
				</div>
			</div>
			<div class="middle">
				<div class="location">
					<a href="#"><img src="resources/nike/location.png"></a> <a href="#">대한민국</a>
				</div>
				<div class="copyright">
					<p>© 2022 Nike, Inc. All Rights Reserved</p>
				</div>
				<div class="info">
					<p>
						<a href="#">이용약관</a>
					</p>
					<p>
						<a href="#">개인정보처리방침</a>
					</p>
				</div>
			</div>
			<div class="bottom">
				<div class="left">
					<p>
						<span>(유)나이키코리아 대표 Kimberlee Lynn Chang Mendes, 킴벌리 린 창 멘데스 | 서울 강남구 테헤란로 152 강남파이낸스센터 30층 |</span><br> 
						<span>통신판매업신고번호 2011-서울강남-03461 | 등록번호 220-88-09068 <a href="#">사업자 정보 확인</a></span><br> 
						<span>고객센터 전화 문의 <a href="#">080-022-0182</a> FAX 02-6744-5880 | 이메일 <a href="#">service@nike.co.kr</a> | 호스팅서비스사업자 (유)나이키코리아</span>
					</p>
				</div>
				<div class="right">
					<p>
						<span>현금 등으로 결제 시 안전 거래를 위해 저희 쇼핑몰에서 가입한 파이서브코리아의 구매 안전서비스(<a href="#">결제대금예치</a>)를 이용하실 수 있습니다.</span><br> 
						<span>온라인디지털콘텐츠산업발전법에 의한 콘텐츠 보호 안내 <a href="#">자세히보기</a></span>
					</p>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>
<script>
date = new Date();
year = date.getFullYear();
month = date.getMonth() + 1;
day = date.getDate();
document.getElementById("current_date").innerHTML = year + "-" + month + "-" + day;
</script> 