<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
<%@ include file = "../views/header.jsp" %>
	<div style="padding : 0px 6px; margin:0px 39.5px;">
			<div style="width: 652.48px; height:28px; float:none; left : 42%;">
			<a href="profile.do?userid=${vo.userid }" align="center" style="padding: 0 16px; color:#757575;">프로필&nbsp;</a>
			<a href="myorder.do?userid=${vo.userid }" align="center" style="padding: 0 16px; color:#111111;">주문&nbsp;</a>
			<a href="favorites.do?userid=${vo.userid }" align="center" style="padding: 0 16px; color:#111111;">위시리스트&nbsp;</a>
			<a href="member_modi_form.do?userid=${vo.userid}" align="center" style="padding: 0 16px; color:#111111;">설정&nbsp;</a>
			</div>
	
			<div style="width:1812px; height:100px;">
			</div>
			
			<div style="width:1812px; height:103px;"> 
			<div style="width:60px; height:60px; border-radius:50%; background-color:#e5e5e5; background-size:60px 60px; 
			 position:absolute;"></div>	
			 <div style="left:5%">
				<h1 style="font-size:32px; font-weight:500; line-height:44px; ">${vo.last_name}${vo.first_name}<br></h1>
				<p style="color:#757575;">나이키 멤버 가입 : ${vo.regidate}</p>
			</div>
			</div>

			
			<!-- 멤버혜택  -->
			<div style="padding:0px 0px 24px;">
				<h2 style="font-weight:500; font-size:24px; line-height:28px;">멤버 혜택</h2>
			</div>
			<ul  aria-labelledby="carousel-title-id-0.9353098086723719" style="width:881px; display: inline-block;  display: flex;">
			<li>
			<a class="pb9-sm mex-benefit-image d-sm-b" href="sorry.do" >
			<img src="${pageContext.request.contextPath}/resources/nike/멤버-홈-캐러셀.jpg" style=" height:200px; margin:0px 0px 16px;"  alt="">
			<p style="color:#111111;">멤버 전용 제품</p></a>
			</li>
			<li>
			<a href="sorry.do">
			<img src="${pageContext.request.contextPath}/resources/nike/멤버-홈-캐러셀 (1).jpg" style="height:200px; margin:0px 0px 16px 36px;" alt="">
			<p style="color:#111111; margin:0 0 0 36px;">멤버 전용 쿠폰</p>
			</a>
			</li>
			<li>
			<a  href="sorry.do">
			<img src="${pageContext.request.contextPath}/resources/nike/멤버-홈-캐러셀 (2).jpg" style="height:200px; margin:0px 0px 16px 36px;" alt="">
			<p style=" color:#111111; margin:0 0 0 36px;">무료 반품</p>
			</a>
			</li>
			<li>
			<a href="sorry.do">
			<img src="${pageContext.request.contextPath}/resources/nike/멤버-홈-캐러셀 (3).jpg" style="height:200px; margin:0px 0px 16px 36px;" alt="">
			<p style=" color:#111111; margin:0 0 0 36px;">러닝 및 트레이닝 앱</p>
			</a>
			</li>
			<li aria-hidden="true">
			</li>
			</ul>
			
			<!-- 멤버혜택 검은칸 -->
			<div style="width:1812px; height:60px; padding :0px 0px 60px;">
			</div>
			<div style="width:1924px; margin:0px -56px 90px; background-color:#111111; padding:0px 56px;">
				<div style="padding : 0px 0px 24px;">
					<h2 style="color:#ffffff; font-family:inherit;"><br>멤버 리워드</h2>
					<br>
					<a href="sorry.do">
					<img src= "${pageContext.request.contextPath}/resources/nike/멤버혜택.jpg" style="width:283.98px; hegith:378.64px; border-radius:8px;">
					</a>
					<div style="width:1812px; height:30.91px;">
					</div>
				</div>
			</div>
			
			<!-- 나이키 앱 다운로드 칸 -->
			<div style="padding:0px 0px 24px; ">
			<h2>Nike 앱</h2>
			</div>
			<div style="width:1824px; margin:0px -6px; display:inline;">
				<div class="check1"  style="heigh:752.58px; display:inline; float:left;">
					<div style="width:456px; height:562px; padding:0px 6px; display:inline;">
						
						<img src="${pageContext.request.contextPath}/resources/nike/nrc.jpg" style="width:444px; height:555px; display:inline;">						<div style="width:456px; height:43.92px; padding:0px 6px; display:inline">
						<br><br><img src="${pageContext.request.contextPath}/resources/nike/nrc.png" style="width:44px; height:43.92px; display:inline;">	
						<h2 style="display:inline;">Nike Run Club</h2>
						<p>러닝: 더 잘 달리기 위해 필요한 동기를<br>찾아보세요.</p>
							<div style="padding:0px 6px;">
							<br>
								<input type="button" value="다운로드" style="padding:6px 20px; border-radius:30px; border:1.5px solid; border-color:#cccccc; background-color:#fff; font-size: 16px; line-height: 24px; cursor:pointer;" onclick="location.href='sorry.do'">
							</div>
						</div>
					</div>
				</div>
				
			<div class="check2" style="heigh:752.58px; display:inline;">
			<div style="width:456px; height:562px; padding:0px 6px; display:inline;">
			<img src="${pageContext.request.contextPath}/resources/nike/ntc.jpg" style="width:444px; height:555px; display:inline;">
			<br>
			<div style="width:456px; height:43.92px; padding:0px 6px; display:inline">
			
			<br>
			<img src="${pageContext.request.contextPath}/resources/nike/ntc.png" style="width:44px; height:43.92px; display:inline;">	
			<h2 style="display:inline;">Nike Training Club</h2>	
			<p>트레이닝: 자세한 설명이 제공되는 160가지 이상의<br>운동을 하며 땀을 흘려 보세요.</p>
			<div style="padding:0px 6px;">
			<br>
				<input type="button" value="다운로드" style="padding:6px 20px; border-radius:30px; border:1.5px solid; border-color:#cccccc; background-color:#fff; font-size: 16px; line-height: 24px; cursor:pointer;" onclick="location.href='sorry.do'">
			</div>
			</div>
			</div>
			</div>
			
			
		</div>
		</div>
		
		
		
		
		
	<%@ include file = "../views/footer.jsp" %>

		
		
		
		
	</body>
</html>