<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<link href="resources/nike/favicon.png" rel="icon">
		<meta charset="UTF-8">
		<title>Nike. Just Do It. Nike 코리아</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nike.css">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script>
			/*header&main*/
			$(".center").mouseenter(function() {
				$(".menu-sub").stop().slideDown();
			})
			$(".center").mouseleave(function() {
				$(".menu-sub").stop().slideUp();
			})
		</script>
</head>
	<body>
		<!--header-->
	<header id="header" class="header">
		<div class="header_1st">
			<!-- brand logo -->
			<div class="brand_logo">
				<a href="#"> <img src="resources/nike/jo-lo.png">
				</a> <a href="#"> <img src="resources/nike/co-lo.png">
				</a>
			</div>
			<!-- nav 메뉴 -->
			<div class="nav">
				<ul class="menu">
					<li class="menu-li"><a href="#">매장찾기</a></li>
					<li class="menu-li center"><a href="#">고객센터</a>
						<ul class="menu-sub">
							<li class="sub-menu-li"><a href="#" class="sub-t">고객센터</a></li>
							<li class="sub-menu-li"><a href="#">주문</a></li>
							<li class="sub-menu-li"><a href="#">로그인 안내</a></li>
							<li class="sub-menu-li"><a href="#">결제 방법</a></li>
							<li class="sub-menu-li"><a href="#">배송</a></li>
							<li class="sub-menu-li"><a href="#">반품</a></li>
							<li class="sub-menu-li"><a href="#">사이즈 가이드</a></li>
							<li class="sub-menu-li"><a href="#">문의하기</a></li>
							<li class="sub-menu-li"><a href="#">개인정보처리방침</a></li>
							<li class="sub-menu-li"><a href="#">이용약관</a></li>
						</ul></li>
				<c:set var="i" value="${vo.userid}"/>
				<c:if test="${i eq null}">
					<li class="menu-li"><a href="membership.do">가입하기</a></li>
					<li class="menu-li"><a href="login_form_1.do">로그인</a></li>
				</c:if>
				<c:if test="${i ne null}">
					<li class="menu-li"><a href="member_modi_form.do?userid=${vo.userid}">회원정보관리</a></li>
					<li class="menu-li"><a href="main.do">로그아웃</a></li>
					</c:if>
				</ul>
			</div>
		</div>
		<div class="header_2nd">
			<!-- nike logo -->
			<div class="nike_logo">
				<a href="main.do"> <img src="resources/nike/ni-lo.png">
				</a>
			</div>
			<!-- category 메뉴 -->
			<div class="category">
				<ul class="category_wrap">
					<li><a href="#">New Releases</a></li>
					<li><a href="#">Men</a></li>
					<li><a href="#">Women</a></li>
					<li><a href="#">Kids</a></li>
					<li><a href="#">SNKRS</a></li>
					<li><a href="#">Member Days</a></li>
				</ul>
			</div>
			<!-- button 메뉴 -->
			<div class="btn">
				<ul class="category_btn">
					<li class="search">
						<button id="search_icon">
							<i class="fa fa-search" aria-hidden="true"></i>
						</button> <input id="search_area" type="text" placeholder="검색"
						style="border-radius: 25px; width: 180px; height: 40px; background-color: #f5f5f5;">
					</li>
					<li class="icon">
						<button id="wish_icon">
							<i class="fa-regular fa-heart"></i>
						</button>
						<button id="shopping_icon">
							<i class="fa fa-shopping-bag" aria-hidden="true"></i>
						</button>
					</li>
				</ul>
			</div>
		</div>
		<!-- New Releases 서브메뉴 -->
		<div id="sub_menu1" class="sub_menu">
			<div class="sub_menu_wrap">
				<div class="sub_menu_text">
					<a href="#"><h4 class="sub_menu_title">New & Featured</h4></a>
					<ul>
						<li><a href="#">Member Days</a></li>
						<li><a href="#">신상품 전체보기</a></li>
						<li><a href="#">SNKRS</a></li>
						<li><a href="#">윈터 컬렉션</a></li>
						<li><a href="#">에어 포스 1</a></li>
						<li><a href="#">ACG</a></li>
						<li><a href="#">NikeLab</a></li>
						<li><a href="#">지속 가능 컬렉션</a></li>
					</ul>
				</div>
				<div class="sub_menu_text">
					<a href="#"><h4 class="sub_menu_title">남성 신상품</h4></a>
					<ul>
						<li><a href="#">신발</a></li>
						<li><a href="#">의류</a></li>
						<li><a href="#">용품</a></li>
						<li><a href="#">전체보기</a></li>
					</ul>
				</div>
				<div class="sub_menu_text">
					<a href="#"><h4 class="sub_menu_title">여성 신상품</h4></a>
					<ul>
						<li><a href="#">신발</a></li>
						<li><a href="#">의류</a></li>
						<li><a href="#">용품</a></li>
						<li><a href="#">전체보기</a></li>
					</ul>
				</div>
				<div class="sub_menu_text">
					<a href="#"><h4 class="sub_menu_title">키즈 신상품</h4></a>
					<ul>
						<li><a href="#">신발</a></li>
						<li><a href="#">의류</a></li>
						<li><a href="#">용품</a></li>
						<li><a href="#">전체보기</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- Men 서브메뉴 -->
		<div id="sub_menu2" class="sub_menu">
			<div class="sub_menu_wrap">
				<div class="sub_menu_text">
					<a href="#"><h4 class="sub_menu_title">New & Featured</h4></a>
					<ul>
						<li><a href="#">Member Days</a></li>
						<li><a href="#">신상품</a></li>
						<li><a href="#">SNKRS</a></li>
						<li><a href="#">윈터 컬렉션</a></li>
						<li><a href="#">솔로 스우시 컬렉션</a></li>
						<li><a href="#">MUST HAVES</a></li>
						<li><a href="#">MEMBER SHOP</a></li>
						<li><a href="#">ACG</a></li>
						<li><a href="#">지속 가능 컬렉션</a></li>
					</ul>
				</div>
				<div class="sub_menu_text">
					<a href="#"><h4 class="sub_menu_title">신발</h4></a>
					<ul>
						<li><a href="#">신발 전체</a></li>
						<li><a href="#">라이프스타일</a></li>
						<li><a href="#">러닝</a></li>
						<li><a href="#">워킹</a></li>
						<li><a href="#">트레이닝 & 짐</a></li>
						<li><a href="#">농구</a></li>
						<li><a href="#">조던</a></li>
						<li><a href="#">축구</a></li>
						<li><a href="#">스케이트보딩</a></li>
						<li><a href="#">골프</a></li>
						<li><a href="#">테니스</a></li>
						<li><a href="#">샌들 & 슬리퍼</a></li>
					</ul>
				</div>
				<div class="sub_menu_text">
					<a href="#"><h4 class="sub_menu_title">의류</h4></a>
					<ul>
						<li><a href="#">의류 전체</a></li>
						<li><a href="#">탑 & 티셔츠</a></li>
						<li><a href="#">팬츠 & 타이즈</a></li>
						<li><a href="#">후디 & 크루</a></li>
						<li><a href="#">재킷 & 베스트</a></li>
						<li><a href="#">쇼츠</a></li>
						<li><a href="#">나이키 프로</a></li>
						<li><a href="#">양말</a></li>
						<li><a href="#">셋업</a></li>
					</ul>
				</div>
				<div class="sub_menu_text">
					<a href="#"><h4 class="sub_menu_title">용품</h4></a>
					<ul>
						<li><a href="#">모자 & 헤드밴드</a></li>
						<li><a href="#">가방</a></li>
						<li><a href="#">애플워치</a></li>
					</ul>
				</div>
				<div class="sub_menu_text">
					<a href="#"><h4 class="sub_menu_title">Shop Collection</h4></a>
					<ul>
						<li><a href="#">러닝</a></li>
						<li><a href="#">트레이닝 & 짐</a></li>
						<li><a href="#">농구</a></li>
						<li><a href="#">축구</a></li>
						<li><a href="#">스케이트보딩</a></li>
						<li><a href="#">골프</a></li>
						<li><a href="#">테니스</a></li>
						<li><a href="#">Nike Sportswear</a></li>
						<li><a href="#">NikeLab</a></li>
						<li><a href="#">Jordan</a></li>
						<li><a href="#">ACG</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- Women 서브메뉴 -->
		<div id="sub_menu3" class="sub_menu">
			<div class="sub_menu_wrap">
				<div class="sub_menu_text">
					<a href="#"><h4 class="sub_menu_title">New & Featured</h4></a>
					<ul>
						<li><a href="#">Member Days</a></li>
						<li><a href="#">신상품</a></li>
						<li><a href="#">SNKRS</a></li>
						<li><a href="#">윈터 컬렉션</a></li>
						<li><a href="#">MUST HAVES</a></li>
						<li><a href="#">MEMBER SHOP</a></li>
						<li><a href="#">브라 & 타이츠 셋업</a></li>
						<li><a href="#">홈트레이닝 컬렉션</a></li>
						<li><a href="#">ACG</a></li>
						<li><a href="#">지속 가능 컬렉션</a></li>
					</ul>
				</div>
				<div class="sub_menu_text">
					<a href="#"><h4 class="sub_menu_title">신발</h4></a>
					<ul>
						<li><a href="#">신발 전체</a></li>
						<li><a href="#">라이프스타일</a></li>
						<li><a href="#">러닝</a></li>
						<li><a href="#">워킹</a></li>
						<li><a href="#">트레이닝 & 짐</a></li>
						<li><a href="#">농구</a></li>
						<li><a href="#">조던</a></li>
						<li><a href="#">축구</a></li>
						<li><a href="#">골프</a></li>
						<li><a href="#">테니스</a></li>
						<li><a href="#">샌들 & 슬리퍼</a></li>
					</ul>
				</div>
				<div class="sub_menu_text">
					<a href="#"><h4 class="sub_menu_title">의류</h4></a>
					<ul>
						<li><a href="#">의류 전체</a></li>
						<li><a href="#">스포츠 브라</a></li>
						<li><a href="#">타이츠 & 레깅스</a></li>
						<li><a href="#">팬츠</a></li>
						<li><a href="#">쇼츠</a></li>
						<li><a href="#">탑 & 티셔츠</a></li>
						<li><a href="#">후디 & 크루</a></li>
						<li><a href="#">재킷 & 베스트</a></li>
						<li><a href="#">스커트 & 드레스</a></li>
						<li><a href="#">요가</a></li>
						<li><a href="#">양말</a></li>
						<li><a href="#">셋업</a></li>
					</ul>
				</div>
				<div class="sub_menu_text">
					<a href="#"><h4 class="sub_menu_title">용품</h4></a>
					<ul>
						<li><a href="#">모자 & 헤드밴드</a></li>
						<li><a href="#">가방</a></li>
						<li><a href="#">애플워치</a></li>
					</ul>
				</div>
				<div class="sub_menu_text">
					<a href="#"><h4 class="sub_menu_title">Shop Collection</h4></a>
					<ul>
						<li><a href="#">러닝</a></li>
						<li><a href="#">트레이닝 & 짐</a></li>
						<li><a href="#">축구</a></li>
						<li><a href="#">스케이트보딩</a></li>
						<li><a href="#">골프</a></li>
						<li><a href="#">테니스</a></li>
						<li><a href="#">요가</a></li>
						<li><a href="#">Nike Sportswear</a></li>
						<li><a href="#">NikeLab</a></li>
						<li><a href="#">Jordan</a></li>
						<li><a href="#">ACG</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- Kids 서브메뉴 -->
		<div id="sub_menu4" class="sub_menu">
			<div class="sub_menu_wrap">
				<div class="sub_menu_text">
					<a href="#"><h4 class="sub_menu_title">New & Featured</h4></a>
					<ul>
						<li><a href="#">Member Days</a></li>
						<li><a href="#">신상품</a></li>
						<li><a href="#">윈터 컬렉션</a></li>
						<li><a href="#">ACG</a></li>
						<li><a href="#">나이키 키즈 부츠</a></li>
						<li><a href="#">플라이이즈 컬렉션</a></li>
						<li><a href="#">나이키 키즈 클래식</a></li>
						<li><a href="#">아이들을 위한 선물</a></li>
						<li><a href="#">조던 키즈</a></li>
					</ul>
				</div>
				<div class="sub_menu_text">
					<a href="#"><h4 class="sub_menu_title">사이즈별</h4></a>
					<ul>
						<li><a href="#">베이비 (0-3세)</a></li>
						<li><a href="#">리틀키즈 (4-7세)</a></li>
						<li><a href="#">주니어 (7-15세)</a></li>
					</ul>
				</div>
				<div class="sub_menu_text">
					<a href="#"><h4 class="sub_menu_title">신발</h4></a>
					<ul>
						<li><a href="#">베이비 (160mm 이하)</a></li>
						<li><a href="#">리틀키즈 (165-220mm)</a></li>
						<li><a href="#">주니어 (225-250mm)/a></li>
						<li><a href="#">라이프스타일</a></li>
						<li><a href="#">러닝</a></li>
						<li><a href="#">축구</a></li>
						<li><a href="#">농구</a></li>
						<li><a href="#">샌들 & 슬리퍼</a></li>
					</ul>
				</div>
				<div class="sub_menu_text">
					<a href="#"><h4 class="sub_menu_title">의류</h4></a>
					<ul>
						<li><a href="#">베이비 (0-3세)</a></li>
						<li><a href="#">리틀키즈 (4-7세)</a></li>
						<li><a href="#">주니어 (7-15세)</a></li>
						<li><a href="#">팬츠 & 레깅스</a></li>
						<li><a href="#">탑 & 티셔츠</a></li>
						<li><a href="#">브라</a></li>
						<li><a href="#">후디 & 크루</a></li>
						<li><a href="#">아우터 & 재킷</a></li>
						<li><a href="#">스커트 & 드레스</a></li>
						<li><a href="#">트랙수트</a></li>
					</ul>
				</div>
				<div class="sub_menu_text">
					<a href="#"><h4 class="sub_menu_title">용품</h4></a>
					<ul>
						<li><a href="#">가방</a></li>
						<li><a href="#">모자</a></li>
						<li><a href="#">양말</a></li>
					</ul>
				</div>
				<div class="sub_menu_text">
					<a href="#"><h4 class="sub_menu_title">Shop Collection</h4></a>
					<ul>
						<li><a href="#">러닝</a></li>
						<li><a href="#">축구</a></li>
						<li><a href="#">농구</a></li>
						<li><a href="#">테니스</a></li>
						<li><a href="#">ACG</a></li>
					</ul>
				</div>
			</div>
		</div>
	</header>
	<!-- section1:main -->
	<section class="section section1">
		<div class="banner">
			<p>카카오페이, 네이버페이 프로모션 안내</p>
			<p class="promotion">
				<a href="#">카카오페이 자세히보기</a> & <a href="#">네이버페이 자세히보기</a>
			</p>
		</div>
		<div class="main-img">
			<img src="resources/nike/image.jpg" class="img img1">
		</div>
		<div class="text">
			<p>11.14(월) - 11.20(일)</p>
			<h4>MEMBER DAYS</h4>
			<p>
				나이키닷컴과 스토어에서 7일간 진행되는<br> 나이키 멤버데이즈에 오신 것을 환영합니다.<br> <br>
				다가오는 겨울, 오직 멤버만을 위해 준비된 다양한 멤버 혜택과 제품.<br> 나이키 멤버데이즈를 통해 스포츠로
				하나되는 순간을 맞이하세요.
			</p>
		</div>
		<div class="button">
			<button>
				<a href="#">구매하기</a>
			</button>
			<button>
				<a href="login_form_1.do">멤버 가입하기</a>
			</button>
		</div>
	</section>

	<!-- section2:video -->
	<section class="section section2">
		<div class="video">
			<img src="resources/nike/image (1).jpg" class="img img2">
		</div>
		<div class="text">
			<h4>너만의 무늬가 우리의 무기</h4>
			<p>
				단 한 명도 같은 사람은 없어요. 가능성도, 특별함도 모두 다 다르니까.<br> 자신만의 무늬를 가져요. 그게
				우리를 더 강하게 만드는 무기가 될 테니까.
			</p>
		</div>
		<div class="button">
			<button>
				<a href="#">자세히 보기</a>
			</button>
			<button>
				<a href="#">구매하기</a>
			</button>
		</div>
	</section>

	<!-- section3:collection -->
	<section class="section section3">
		<div class="collection">
			<img src="resources/nike/image (2).jpg" class="img img3">
		</div>
		<div class="text">
			<h4>지속가능한 미래를 향해</h4>
			<p>
				기존 니트 플리스보다 탄소 배출량을 75% 가량 줄여 제작된 혁신적인 컬렉션.<br> 미래를 위하는 미니멀리스트를
				위한 필수 아이템, 나이키 Forward 컬렉션을 지금 만나보세요.
			</p>
		</div>
		<div class="button">
			<button>
				<a href="#">구매하기</a>
			</button>
			<button>
				<a href="#">자세히 보기</a>
			</button>
		</div>
	</section>

	<!-- section4:kids -->
	<section class="section section4">
		<div class="kids">
			<img src="resources/nike/nike-just-do-it.jpg" class="img img4">
		</div>
		<div class="text">
			<h4>즐거운 놀이의 세계로</h4>
			<p>
				아이들을 준비 시키는 건 어려운 일이죠.<br> 새로운 다이나모 고 부츠와 함께 보다 쉽게 외출을 준비해보세요.
			</p>
		</div>
		<div class="button">
			<button>
				<a href="#">구매하기</a>
			</button>
		</div>
	</section>

	<!-- section5:yoga -->
	<section class="section section5">
		<a href="#">
			<div class="yoga">
				<img src="resources/nike/nike-just-do-it (1).jpg" class="img img5">
			</div>
			<div class="text">
				<p>나이키 요가 ADV 컬렉션</p>
				<h4>일상을 위한 준비</h4>
				<p>움직이는 모든 순간에 편안함을 제공합니다.</p>
			</div>
			<div class="button">
				<button>
					<a href="#">구매하기</a>
				</button>
			</div>
		</a>
	</section>

	<!-- section6:magazine -->
	<section class="section section6">
		<div class="container">
			<div class="item item1">
				<div class="magazine magazine1">
					<img src="resources/nike/nike-just-do-it.jpeg" class="img img6">
				</div>
				<div class="text">
					<p>Blazer Low</p>
				</div>
				<div class="button">
					<button>
						<a href="#">구매하기</a>
					</button>
				</div>
			</div>
			<div class="item item2">
				<div class="magazine magazine2">
					<img src="resources/nike/nike-just-do-it (1).jpeg" class="img img7">
				</div>
				<div class="text">
					<p>나이키 메트콘</p>
				</div>
				<div class="button">
					<button>
						<a href="#">구매하기</a>
					</button>
				</div>
			</div>
		</div>
	</section>

	<!-- section7:running -->
	<section class="section section7">
		<h4>러닝화 / 러닝 스타일 가이드</h4>
		<div class="container">
			<div class="left">
				<div class="running running1">
					<img src="resources/nike/nike-just-do-it (2).jpg" class="img img8">
				</div>
				<div class="text">
					<p>나이키 러닝화 가이드</p>
				</div>
				<div class="button">
					<button>
						<a href="#">자세히 보기</a>
					</button>
				</div>
			</div>
			<div class="right">
				<div class="top">
					<div class="running running2">
						<img src="resources/nike/nike-just-do-it (3).jpg" class="img img9">
					</div>
					<div class="text">
						<p>남성 러닝 스타일 가이드</p>
					</div>
					<div class="button">
						<button>
							<a href="#">자세히 보기</a>
						</button>
					</div>
				</div>
				<div class="bottom">
					<div class="running running3">
						<img src="resources/nike/nike-just-do-it (4).jpg" class="img img10">
					</div>
					<div class="text">
						<p>여성 러닝 스타일 가이드</p>
					</div>
					<div class="button">
						<button>
							<a href="#">자세히 보기</a>
						</button>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- section8:shoes -->
	<section class="section section8">
		<div class="container">
			<h4>Featured Shoes</h4>
			<div class="btn">
				<button class="prev"><</button>
				<button class="next">></button>
			</div>
		</div>
		<div class="shoes">
			<div class="box box1">
				<img src="resources/nike/shoes1.jpeg">
				<h4>나이키 ACG 로우케이트</h4>
				<p>남성 신발</p>
				<p class="price">129,000 원</p>
			</div>
			<div class="box box2">
				<img src="resources/nike/shoes2.jpeg">
				<h4>나이키 에어맥스 97</h4>
				<p>남성 신발</p>
				<p class="price">219,000 원</p>
			</div>
			<div class="box box3">
				<img src="resources/nike/shoes3.jpeg">
				<h4>에어 조던 1 줌 Cmft</h4>
				<p>신발</p>
				<p class="price">169,000 원</p>
			</div>
			<div class="box box4">
				<img src="resources/nike/shoes4.jpeg">
				<h4>조던 .5 'Why Not?'</h4>
				<p>남성 농구화</p>
				<p class="dis_price">159,000 원</p>
				<p class="price">127,200 원</p>
			</div>
			<div class="box box5">
				<img src="resources/nike/shoes5.jpeg">
				<h4>나이키 디파이 올 데이</h4>
				<p>남성 트레이닝화</p>
				<p class="price">79,000 원</p>
			</div>
			<div class="box box6">
				<img src="resources/nike/shoes6.jpeg">
				<h4>나이키 와플 데뷰</h4>
				<p>여성 신발</p>
				<p class="dis_price">89,000 원</p>
				<p class="price">80,100 원</p>
			</div>
			<div class="box box7">
				<img src="resources/nike/shoes7.jpeg">
				<h4>나이키 에어 줌 인피니티 투어 넥스트%</h4>
				<p>남성 골프화(와이드)</p>
				<p class="dis_price">229,000 원</p>
				<p class="price">206,100 원</p>
			</div>
			<div class="box box8">
				<img src="resources/nike/shoes8.jpeg">
				<h6>나이키 에어 줌 페가수스 39</h6>
				<p>남성 로드 러닝화</p>
				<p class="dis_price">139,000 원</p>
				<p class="price">125,100 원</p>
			</div>
			<div class="box box9">
				<img src="resources/nike/shoes9.jpeg">
				<h6>나이키 메트콘 8 MF</h6>
				<p>남성 트레이닝화</p>
				<p class="price">159,000 원</p>
			</div>
		</div>
	</section>

	<!-- section9:Apparel -->
	<section class="section section9">
		<h4>Apparel Essentials</h4>
		<div class="container">
			<div class="box box1">
				<img src="resources/nike/nike-just-do-it (2).jpeg">
				<p>재킷 & 베스트</p>
			</div>
			<div class="box box2">
				<img src="resources/nike/nike-just-do-it (3).jpeg">
				<p>후디 & 크루</p>
			</div>
			<div class="box box3">
				<img src="resources/nike/nike-just-do-it (4).jpeg">
				<p>팬츠 & 타이츠</p>
			</div>
		</div>
	</section>
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