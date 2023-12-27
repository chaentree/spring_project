<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
	
		<link href="resources/nike/favicon.png" rel="icon">
		<meta charset="UTF-8">
		<title>Nike. Just Do It. Nike 코리아</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nike.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/photo.css">
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
				</a> <a href="#" > <!-- 컨버스 로고 --> <img
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
							<li class="sub-menu-li"><a href="myorder.do?userid=${vo.userid }">주문</a></li>
							<li class="sub-menu-li"><a href="#">로그인 안내</a></li>
							<li class="sub-menu-li"><a href="#">결제 방법</a></li>
							<li class="sub-menu-li"><a href="myorder.do?userid=${vo.userid}">배송</a></li>
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
	                            <li class="sub-menu-li"><a href="profile.do?userid=${vo.userid }">프로필</a></li>
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
					<li class="icon"><a href="#" id="wish_icon"><img
							src="resources/nike/wish.svg"></a> <a href="cart.do?userid=${param.userid}"
						id="shopping_icon"><img src="resources/nike/cart.svg"></a></li>
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

	<script>
	
	 function send(){
		 location.href="p_insert.do?userid=${vo.userid}";
	 }
	
	 function waring(){
		 alert('죄송합니다 준비중인 기능입니다.')
		 
	 }
	 
	 
	</script>
	
</body>


<body>
<div id ="leftbox_mainbox" align="left" style=" margin-top:50px; margin-left : 50px; position:fixed; line-height:30px;">
<h2>나이키 축구 컬렉션</h2>
<br><br>
	<a href="sorry.do" style="color:#111;"><div id="category" >
	신발<br>
	탑 & 티셔츠<br>
	후디 & 크루<br>
	재킷 & 베스트<br>
	팬츠 & 타이즈<br>
	쇼츠<br>
	트랙수트<br><br>
	</div>
	</a>
	<hr>
	<div id="sex">
	<br>성별<br><br>
	<input type="checkbox" name="gender" id="gender" onclick="waring()"> 남성<br>
	<input type="checkbox" name="gender" id="gender" onclick="waring()"> 여성<br>
	<input type="checkbox" name="gender" id="gender" onclick="waring()"> 유니섹스<br><br>
	</div>
	<hr>
	<div id = "kids">
	<br>키즈<br><br>
	<input type="checkbox" name="child"  id="child" onclick="waring()"> 남아<br>
	<input type="checkbox" name="child"  id="child" onclick="waring()"> 여아<br>
	</div>
</div>



			<div id= "main_box">
			
			<div align="right">
			<a  style="cursor:pointer; color:#111111;" href='sorry.do'>필터 숨기기 <img src="resources/nike/filter.png" style="width:20px; height:auto; display: inline;"></a>
			</div>
			<!-- 상품사진이 나오는곳  -->
<div class="photo_box">

<c:forEach var="marketvo" items="${marketvo}">

<a href="p_detail.do?userid=${vo.userid}&product_id=${marketvo.product_id}" style="color:#6e6e6e;"><div class ="photo_type">
	<img src = "${pageContext.request.contextPath}/resources/upload/${marketvo.filename}" >	
	
<div class = "title">
	<span><br>${marketvo.p_name}<br></span>	
	
	<span style="color:#6e6e6e;">${marketvo.p_material}<br></span>
	

	<span style="color:#6e6e6e;">${marketvo.p_stock}개 재고<br><br></span>
	
	<span><fmt:formatNumber pattern="###,###,###" value="${marketvo.p_price}" />  원<br></span>
</div>
</div></a>
	</c:forEach>
	<c:set var="j" value="${vo.op}" />
	<c:if test="${ j eq 1}">
	
		<input type="button" value="상품등록" onclick="send()" style="width:420px; border-radius:30px; padding:15px 30px; 
		border:1px solid #6e6e6e; color:#fff; background-color:#111111; left:30%; font-size:20px; cursor: pointer; margin-bottom:30px;">	
	</c:if>	

</div>
</div>
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

</body>
</html>