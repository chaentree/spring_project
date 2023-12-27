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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.css">
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	</head>
	<body>
	<!-- modal popup 부분 -->
	<div class="pre-modal">
		<div class="container">
			<img src="resources/nike/ni-lo.png" class="img img1">
			<div class="search">
				<a href="#" id="search_icon"><img
					src="resources/nike/search.svg" class="img img2"></a>
				<!-- 검색 입력 부분 -->
				<input id="pre_search_area" class="pre-search-box" type="text"
					placeholder="검색">
			</div>
			<a href="#" id="cancel"><p>취소</p></a>
		</div>
		<div class="text">
			<h4>인기 검색어</h4>
			<h2>Air Force1</h2>
			<h2>Jordan</h2>
			<h2>Air Max</h2>
			<h2>Blazer</h2>
			<h2>선물</h2>
		</div>
	</div>
	<!-- 헤더 -->
	<header id="header" class="header">
		<!-- 첫번째 헤더 부분 -->
		<div class="header_1st">
			<!-- 브랜드 로고 -->
			<div class="brand_logo">
				<a href="#"> <!-- 조던 로고 --> <img src="resources/nike/jo-lo.png">
				</a> <a href="#"> <!-- 컨버스 로고 --> <img
					src="resources/nike/co-lo.png">
				</a>
			</div>
			<!-- 첫번째 헤더 오른쪽 nav 메뉴 -->
			<div class="nav">
				<ul class="menu">
					<li class="menu-li"><a href="#">매장찾기</a></li>
					<span> | </span>
					<!-- 고객센터 -->
					<li class="menu-li center"><a href="#">고객센터</a> <!-- 마우스 호버시 나타나는 부분 -->
						<ul class="menu-sub">
							<li class="sub-menu-li"><a href="#" class="sub-t">고객센터</a></li>
							<li class="sub-menu-li"><a href="myorder.do?userid=${vo.userid }	">주문</a></li>
							<li class="sub-menu-li"><a href="#">로그인 안내</a></li>
							<li class="sub-menu-li"><a href="#">결제 방법</a></li>
							<li class="sub-menu-li"><a href="myorder.do?userid=${vo.userid }">배송</a></li>
							<li class="sub-menu-li"><a href="#">반품</a></li>
							<li class="sub-menu-li"><a href="#">사이즈 가이드</a></li>
							<li class="sub-menu-li"><a href="#">문의하기</a></li>
							<li class="sub-menu-li"><a href="https://agreementservice.svs.nike.com/rest/agreement?agreementType=privacy-policy&uxId=default&country=KR&language=ko&requestType=redirect" target=”_blank”>개인정보처리방침</a></li>
							<li class="sub-menu-li"><a href="https://agreementservice.svs.nike.com/rest/agreement?agreementType=termsOfUse&uxId=com.nike.commerce.nikedotcom.web&country=KR&language=ko&requestType=redirect" target=”_blank”>이용약관</a></li>
						</ul></li>
	                   	<c:set var="i" value="${vo.userid}"/>
	                    <c:if test="${i eq null}">         
	                    <span> | </span>      
	                    <li class="menu-li"><a href="login_form_1.do">가입하기</a></li>
	                    <span> | </span>
	                    <li class="menu-li"><a href="login_form_1.do">로그인</a></li>
	                	</c:if>
	                	<c:if test="${i ne null}">
	                	<span> | </span> 			<!-- 로그인시 보이는 상단바 수정 -->
	                		<li class="menu-li member" ><a href="profile.do?userid=${vo.userid}">${vo.last_name}${vo.first_name}님, 환영합니다.&nbsp;&nbsp;&nbsp;
	                		<img src="resources/nike/person_main.png" style="width:20px; display:inline; position:absolute;"></a>
	                        <!-- 마우스 호버시 나타나는 부분 -->
	                        <ul class="menu-sub_mem">
	                            <li class="sub-menu-li"><a href="profile.do?userid=${vo.userid}" class="sub-t">계정</a></li>
	                            <li class="sub-menu-li"><a href="profile.do?userid=${vo.userid}">프로필</a></li>
	                            <li class="sub-menu-li"><a href="myorder.do?userid=${vo.userid }">주문</a></li>
	                            
	                            <li class="sub-menu-li"><a href="favorites.do?userid=${vo.userid }">위시리스트</a></li>
	                            <li class="sub-menu-li"><a href="member_modi_form.do?userid=${vo.userid}">회원정보관리</a></li>
	                            <li class="sub-menu-li"><a href="main.do">로그아웃</a></li>
	                        </ul>
	                    </li>      
	                	</c:if>
				</ul>
			</div>
		</div>
		<!-- 두번째 헤더 -->
		<div class="header_2nd">
			<!-- 나이키 로고 -->
			<div class="nike_logo">
	            <c:if test="${i eq null}">
	                <a href="main.do">
	                   <img src="resources/nike/ni-lo.png">
	                </a>
	                </c:if>
	                <c:if test="${i ne null}">
	               	<a href="login.do?userid=${vo.userid}"><img src="resources/nike/ni-lo.png">
					</a>
	                </c:if>
			</div>
			<!-- category 메뉴 -->
			<div class="category">
				<ul class="category_wrap">
					<li class="wrap_li wrap_li1"><a href="#"><h4>New
								Releases</h4></a> <!-- New Releases 서브메뉴 -->
						<div id="sub_menu1" class="sub_menu">
							<div class="sub_menu_wrap sub_menu_wrap1">
								<div class="sub_menu_text text1">
									<a href="#"><h5 class="sub_menu_title">New & Featured</h5></a>
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
								<div class="sub_menu_text text2">
									<a href="#"><h5 class="sub_menu_title">남성 신상품</h5></a>
									<ul>
										<li><a href="#">신발</a></li>
										<li><a href="#">의류</a></li>
										<li><a href="#">용품</a></li>
										<li><a href="#">전체보기</a></li>
									</ul>
								</div>
								<div class="sub_menu_text text3">
									<a href="#"><h5 class="sub_menu_title">여성 신상품</h5></a>
									<ul>
										<li><a href="#">신발</a></li>
										<li><a href="#">의류</a></li>
										<li><a href="#">용품</a></li>
										<li><a href="#">전체보기</a></li>
									</ul>
								</div>
								<div class="sub_menu_text text4">
									<a href="#"><h5 class="sub_menu_title">키즈 신상품</h5></a>
									<ul>
										<li><a href="#">신발</a></li>
										<li><a href="#">의류</a></li>
										<li><a href="#">용품</a></li>
										<li><a href="#">전체보기</a></li>
									</ul>
								</div>
							</div>
						</div></li>
					<!-- Men 서브메뉴 -->
					<li class="wrap_li wrap_li2"><a href="#"><h4>Men</h4></a>
						<div id="sub_menu2" class="sub_menu">
							<div class="sub_menu_wrap sub_menu_wrap2">
								<div class="sub_menu_text text5">
									<a href="#"><h5 class="sub_menu_title">New & Featured</h5></a>
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
										<li><a href="#">Sale: Up to 40% OFF</a></li>
									</ul>
								</div>
								<div class="sub_menu_text text6">
									<a href="#"><h5 class="sub_menu_title">신발</h5></a>
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
										<li><a href="#">Sale: Up to 40% OFF</a></li>
									</ul>
								</div>
								<div class="sub_menu_text text7">
									<a href="#"><h5 class="sub_menu_title">의류</h5></a>
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
										<li><a href="#">Sale: Up to 40% OFF</a></li>
									</ul>
								</div>
								<div class="sub_menu_text text8">
									<a href="#"><h5 class="sub_menu_title">용품</h5></a>
									<ul>
										<li><a href="#">모자 & 헤드밴드</a></li>
										<li><a href="#">가방</a></li>
										<li><a href="#">애플워치</a></li>
										<li><a href="#">Sale: Up to 40% OFF</a></li>
									</ul>
								</div>
								<div class="sub_menu_text text9">
									<a href="#"><h5 class="sub_menu_title">Shop Collection</h5></a>
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
						</div></li>
					<!-- Women 서브메뉴 -->
					<li class="wrap_li wrap_li3"><a href="#"><h4>Women</h4></a>
						<div id="sub_menu3" class="sub_menu">
							<div class="sub_menu_wrap sub_menu_wrap3">
								<div class="sub_menu_text text10">
									<a href="#"><h5 class="sub_menu_title">New & Featured</h5></a>
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
										<li><a href="#">Sale: Up to 40% OFF</a></li>
									</ul>
								</div>
								<div class="sub_menu_text text11">
									<a href="#"><h5 class="sub_menu_title">신발</h5></a>
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
										<li><a href="#">Sale: Up to 40% OFF</a></li>
									</ul>
								</div>
								<div class="sub_menu_text text12">
									<a href="#"><h5 class="sub_menu_title">의류</h5></a>
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
										<li><a href="#">Sale: Up to 40% OFF</a></li>
									</ul>
								</div>
								<div class="sub_menu_text text13">
									<a href="#"><h5 class="sub_menu_title">용품</h5></a>
									<ul>
										<li><a href="#">모자 & 헤드밴드</a></li>
										<li><a href="#">가방</a></li>
										<li><a href="#">애플워치</a></li>
										<li><a href="#">Sale: Up to 40% OFF</a></li>
									</ul>
								</div>
								<div class="sub_menu_text text14">
									<a href="#"><h5 class="sub_menu_title">Shop Collection</h5></a>
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
						</div></li>
					<!-- Kids 서브메뉴 -->
					<li class="wrap_li wrap_li4"><a href="#"><h4>Kids</h4></a>
						<div id="sub_menu4" class="sub_menu">
							<div class="sub_menu_wrap sub_menu_wrap4">
								<div class="sub_menu_text text15">
									<a href="#"><h5 class="sub_menu_title">New & Featured</h5></a>
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
										<li><a href="#">Sale: Up to 40% OFF</a></li>
									</ul>
								</div>
								<div class="sub_menu_text text16">
									<a href="#"><h5 class="sub_menu_title">사이즈별</h5></a>
									<ul>
										<li><a href="#">베이비 (0-3세)</a></li>
										<li><a href="#">리틀키즈 (4-7세)</a></li>
										<li><a href="#">주니어 (7-15세)</a></li>
										<li><a href="#">Sale: Up to 40% OFF</a></li>
									</ul>
								</div>
								<div class="sub_menu_text text17">
									<a href="#"><h5 class="sub_menu_title">신발</h5></a>
									<ul>
										<li><a href="#">베이비 (160mm 이하)</a></li>
										<li><a href="#">리틀키즈 (165-220mm)</a></li>
										<li><a href="#">주니어 (225-250mm)/a></li>
										<li><a href="#">라이프스타일</a></li>
										<li><a href="#">러닝</a></li>
										<li><a href="#">축구</a></li>
										<li><a href="#">농구</a></li>
										<li><a href="#">샌들 & 슬리퍼</a></li>
										<li><a href="#">Sale: Up to 40% OFF</a></li>
									</ul>
								</div>
								<div class="sub_menu_text text18">
									<a href="#"><h5 class="sub_menu_title">의류</h5></a>
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
										<li><a href="#">Sale: Up to 40% OFF</a></li>
									</ul>
								</div>
								<div class="cont">
									<div class="sub_menu_text text19">
										<a href="#"><h5 class="sub_menu_title">용품</h5></a>
										<ul>
											<li><a href="#">가방</a></li>
											<li><a href="#">모자</a></li>
											<li><a href="#">양말</a></li>
											<li><a href="#">Sale: Up to 40% OFF</a></li>
										</ul>
									</div>
									<div class="sub_menu_text text20">
										<a href="#"><h5 class="sub_menu_title">Shop
												Collection</h5></a>
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
						</div></li>
					<!-- Sale 서브메뉴 -->
					<li class="wrap_li wrap_li5"><a href="#"><h4>Sale</h4></a>
						<div id="sub_menu5" class="sub_menu">
							<div class="sub_menu_wrap sub_menu_wrap5">
								<div class="sub_menu_text text21">
									<a href="#"><h5 class="sub_menu_title">Sale</h5></a>
									<ul>
										<li><a href="#">Sale</a></li>
									</ul>
								</div>
								<div class="sub_menu_text text22">
									<a href="#"><h5 class="sub_menu_title">Mens Sale</h5></a>
									<ul>
										<li><a href="#">신발</a></li>
										<li><a href="#">의류</a></li>
										<li><a href="#">용품</a></li>
										<li><a href="#">전체 보기</a></li>
									</ul>
								</div>
								<div class="sub_menu_text text23">
									<a href="#"><h5 class="sub_menu_title">Womens Sale</h5></a>
									<ul>
										<li><a href="#">신발</a></li>
										<li><a href="#">의류</a></li>
										<li><a href="#">용품</a></li>
										<li><a href="#">전체 보기</a></li>
									</ul>
								</div>
								<div class="sub_menu_text text24">
									<a href="#"><h5 class="sub_menu_title">Kids Sale</h5></a>
									<ul>
										<li><a href="#">신발</a></li>
										<li><a href="#">의류</a></li>
										<li><a href="#">용품</a></li>
										<li><a href="#">전체 보기</a></li>
									</ul>
								</div>
							</div>
						</div></li>
					<!-- SNKRS 메뉴 -->
					<li class="wrap_li wrap_li6"><a href="#"><h4>SNKRS</h4></a></li>
				</ul>
			</div>
			<!-- 검색 & 버튼 메뉴 -->
			<div class="btn">
				<ul class="category_btn">
					<!-- 검색 아이콘 -->
					<li class="search"><a href="#" id="search_icon">
							<img src="resources/nike/search.svg"></a> <!-- 검색 입력 부분 --> 
						    <input id="search_area" class="search-box" type="text" placeholder="검색">
					</li>
					<!-- 위시리스트&카트 버튼 -->
					<c:if test="${i eq null}">  
					<li class="icon"><a href="login_form_1.do" id="wish_icon"><img
							src="resources/nike/wish.svg"></a> <a href="login_form_1.do"
						id="shopping_icon"><img src="resources/nike/cart.svg"></a></li>
						</c:if>
					<c:if test="${i ne null}">
						<li class="icon"><a href="favorites.do?userid=${vo.userid }" id="wish_icon"><img
						src="resources/nike/wish.svg"></a> <a href="cart.do?userid=${param.userid}"
						id="shopping_icon"><img src="resources/nike/cart.svg"></a></li>
					
					</c:if>  	
						
				</ul>
			</div>
		</div>
	</header>

		<!-- section0:banner -->
	    <section class="section section0">
	    	<!-- 회색 배너 부분 : 나이키 사이트에 현재 content가 비어있음 -->
	        <div class="banner">
	        </div>
	    </section>
		
		<!-- 사이트 Members day 부분이었음 -->
		<!-- section1:main -->
	    <!-- <section class="section section1">
	        <div class="banner">
	            <p>카카오페이, 네이버페이 프로모션 안내</p>
	            <p class="promotion"><a href="#">카카오페이 자세히보기</a> & <a href="#">네이버페이 자세히보기</a></p>
	        </div>
	        <div class="main-img">
	            <img src="nike/image.jpg" class="img img1">
	        </div>
	        <div class="text">
	            <p>11.14(월) - 11.20(일)</p>
	            <h4>MEMBER DAYS</h4>
	            <p>
	                나이키닷컴과 스토어에서 7일간 진행되는<br>
	                나이키 멤버데이즈에 오신 것을 환영합니다.<br>
	                <br>
	                다가오는 겨울, 오직 멤버만을 위해 준비된 다양한 멤버 혜택과 제품.<br>
	                나이키 멤버데이즈를 통해 스포츠로 하나되는 순간을 맞이하세요.
	            </p>
	        </div>
	        <div class="button">
	            <button><a href="#">구매하기</a></button>
	            <button><a href="#">자세히 보기</a></button>
	        </div>
	    </section> -->
		
		<!-- section2:video -->
	    <section class="section section2">
	        <div class="video">
              <!-- 비디오 부분이었는데 사진으로 대체 해놓은 부분 ?autoplay=1&mute=1&controls=0&loop=1&playlist=0bD2O2NpKdc-->
               <!-- <img src="resources/nike/video.jpg" class="img img2"> -->
               <div class="container">
                  <p align="middle"><iframe width="1824" height="933" src="https://www.youtube.com/embed/0bD2O2NpKdc?autoplay=1&mute=1&controls=0&loop=1&playlist=0bD2O2NpKdc" 
                     title="YouTube video player" frameborder="0" 
                     allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
                  </iframe></p>
               </div>
           </div>
	        <div class="text">
	            <h4>너만의 무늬가 우리의 무기</h4>
	            <p>
	                단 한 명도 같은 사람은 없어요. 가능성도, 특별함도 모두 다 다르니까.<br>
	                자신만의 무늬를 가져요. 그게 우리를 더 강하게 만드는 무기가 될 테니까.
	            </p>
	        </div>
	        <div class="button">
	            <button><a href="#">자세히 보기</a></button>
	            	            <button>
	          <c:if test="${i eq null}">
				<a href="market.do">구매하기</a>
			</c:if>
	         <c:if test="${i ne null}">
				<a href="market.do?userid=${vo.userid}">구매하기</a>
			</c:if>  
	            
	            </button>
	        </div>
	    </section>
	
		<!-- section3:collection -->
	    <section class="section section3">
	        <div class="collection">
	        	<!-- gif 부분 -> 사진으로 대체  -->
	            <img src="resources/nike/collection.jpg" class="img img3">
	        </div>
	        <div class="text">
	            <h4>지속가능한 미래를 향해</h4>
	            <p>
	                기존 니트 플리스보다 탄소 배출량을 75% 가량 줄여 제작된 혁신적인 컬렉션.<br>
	                미래를 위하는 미니멀리스트를 위한 필수 아이템, 나이키 Forward 컬렉션을 지금 만나보세요.
	            </p>
	        </div>
	        <div class="button">
	        <button>
	        <c:if test="${i eq null}">
	     
				<a href="market.do">구매하기</a>
			</c:if>
	         <c:if test="${i ne null}">
				<a href="market.do?userid=${vo.userid}">구매하기</a>
			</c:if>  
			 </button>
	            <button><a href="#">자세히 보기</a></button>
	        </div>
	    </section>
	
	    <!-- section4:kids -->
	    <section class="section section4">
	        <div class="kids">
	            <img src="resources/nike/kids.jpg" class="img img4">
	        </div>
	        <div class="text">
	            <h4>즐거운 놀이의 세계로</h4>
	            <p>
	                아이들을 준비 시키는 건 어려운 일이죠.<br>
	                새로운 다이나모 고 부츠와 함께 보다 쉽게 외출을 준비해보세요.
	            </p>
	        </div>
	        <div class="button">
	            	            <button>
	          <c:if test="${i eq null}">
				<a href="market.do">구매하기</a>
			</c:if>
	         <c:if test="${i ne null}">
				<a href="market.do?userid=${vo.userid}">구매하기</a>
			</c:if>  
	            
	            </button>
	        </div>
	    </section>	
	
	    <!-- section5:yoga -->
	    <section class="section section5">
	        <a href="#">
	             <div class="yoga">
	                <img src="resources/nike/yoga.jpg" class="img img5">
	            </div>
	            <div class="text">
	                <p>나이키 요가 ADV 컬렉션</p>
	                <h4>일상을 위한 준비</h4>
	                <p>
	                    움직이는 모든 순간에 편안함을 제공합니다.
	                </p>
	            </div>
	            <div class="button">
	                	            <button>
	          <c:if test="${i eq null}">
				<a href="market.do">구매하기</a>
			</c:if>
	         <c:if test="${i ne null}">
				<a href="market.do?userid=${vo.userid}">구매하기</a>
			</c:if>  
	            
	            </button>
	            </div>
	        </a>
	    </section>	

	    <!-- section6:magazine -->
	    <section class="section section6">
	        <div class="container">
	            <div class="item item1">
	                <div class="magazine magazine1">
	                    <img src="resources/nike/magazine1.jpeg" class="img img6">
	                </div>
	                <div class="text">
	                    <p>Blazer Low</p>
	                </div>
	                <div class="button">
	                    <button>	          <c:if test="${i eq null}">
				<a href="market.do">구매하기</a>
			</c:if>
	         <c:if test="${i ne null}">
				<a href="market.do?userid=${vo.userid}">구매하기</a>
			</c:if>  </button>
	                </div>
	            </div>
	            <div class="item item2">
	                <div class="magazine magazine2">
	                    <img src="resources/nike/magazine2.jpeg" class="img img7">
	                </div>
	                <div class="text">
	                    <p>나이키 메트콘</p>
	                </div>
	                <div class="button">
	                    <button><a href="#">구매하기</a></button>
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
	                    <img src="resources/nike/running1.jpg" class="img img8">
	                </div>
	                <div class="text">
	                    <p>나이키 러닝화 가이드</p>
	                </div>
	                <div class="button">
	                    <button><a href="#">자세히 보기</a></button>
	                </div>
	            </div>
	            <div class="right">
	                <div class="top">
	                    <div class="running running2">
	                        <img src="resources/nike/running2.jpg" class="img img9">
	                    </div>
	                    <div class="text">
	                        <p>남성 러닝 스타일 가이드</p>
	                    </div>
	                    <div class="button">
	                        <button><a href="#">자세히 보기</a></button>
	                    </div>
	                </div>
	                <div class="bottom">
	                    <div class="running running3">
	                        <img src="resources/nike/running3.jpg" class="img img10">
	                    </div>
	                    <div class="text">
	                        <p>여성 러닝 스타일 가이드</p>
	                    </div>
	                    <div class="button">
	                        <button><a href="#">자세히 보기</a></button>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </section>	
	
	    <!-- section8:shoes -->
	    <section class="section section8">
	        <div class="container">
	            <h4>Featured Shoes</h4>
	        </div>
	        <!-- owl carousel 이용하여 슬라이드 구현 -->
	        <div class="owl-carousel shoes-slider">
	            <div class="box box1">
	                <img src="resources/nike/shoes1.jpeg">
	                <h4>나이키 에어 줌 G.T. 컷 2</h4>
	                <p>남성 신발</p>
	                <p class="price">209,000 원</p>
	            </div>
	            <div class="box box2">
	                <img src="resources/nike/shoes2.jpeg">
	                <h4>나이키 티엠포 레전드 9 엘리트 FG</h4>
	                <p>천연 잔디 클리트 축구화</p>
	                <p class="price">269,000 원</p>
	            </div>
	            <div class="box box3">
	                <img src="resources/nike/shoes3.jpeg">
	                <h4>나이키 버로우 SE</h4>
	                <p>여성 슬리퍼</p>
	                <p class="price">79,000 원</p>
	            </div>
	            <div class="box box4">
	                <img src="resources/nike/shoes4.jpeg">
	                <h4>조던 시스템.23</h4>
	                <p>남성 신발</p>
	                <p class="price">129,200 원</p>
	            </div>
	            <div class="box box5">
	                <img src="resources/nike/shoes5.jpeg">
	                <h4>나이키 프리 메트콘 4 AMP</h4>
	                <p>트레이닝화</p>
	                <p class="price">139,000 원</p>
	            </div>
	            <div class="box box6">
	                <img src="resources/nike/shoes6.jpeg">
	                <h4>나이키 에어 포스 1 '07 SE</h4>
	                <p>여성 신발</p>
	                <p class="price">139,000 원</p>
	            </div>
	            <div class="box box7">
	                <img src="resources/nike/shoes7.jpeg">
	                <h4>나이키 줌 플라이 5 프리미엄</h4>
	                <p>남성 로드 러닝화</p>
	                <p class="price">209,000 원</p>
	            </div>
	            <div class="box box8">
	                <img src="resources/nike/shoes8.jpeg">
	                <h4>나이키 와플 원 SE</h6>
	                <p>남성 신발</p>
	                <p class="price">129,000 원</p>
	            </div>
	            <div class="box box9">
	                <img src="resources/nike/shoes9.jpeg">
	                <h4>나이키 에어맥스 90 G</h6>
	                <p>골프화</p>
	                <p class="price">169,000 원</p>
	            </div>
	        </div>
	    </section>	
	
	    <!-- section9:Apparel -->
	    <section class="section section9">
	        <h4>Apparel Essentials</h4>
	        <div class="container">
	            <div class="box box1">
	                <img src="resources/nike/apparel1.jpeg">
	                <p>재킷 & 베스트</p>
	            </div>
	            <div class="box box2">
	                <img src="resources/nike/apparel2.jpeg">
	                <p>후디 & 크루</p>
	            </div>
	            <div class="box box3">
	                <img src="resources/nike/apparel3.jpeg">
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
	                        <p><a href="https://agreementservice.svs.nike.com/rest/agreement?agreementType=termsOfUse&uxId=com.nike.commerce.nikedotcom.web&country=KR&language=ko&requestType=redirect">이용약관</a></p>
	                        <p><a href="https://agreementservice.svs.nike.com/rest/agreement?agreementType=privacy-policy&uxId=default&country=KR&language=ko&requestType=redirect">개인정보처리방침</a></p>
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