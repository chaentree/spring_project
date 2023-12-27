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
/* table {
	width: 500px;
	height: 500px;
	border-collapse: collapse;
	margin-top: 50px;
} */
/* 위쪽 오른쪽 아래쪽 왼쪽 마진속성 한번에 주기*/
div{
	/*margin:10px;
	padding: 10px;*/
	/* overflow: hidden; */
}

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
	left : 35%;
	top : 35%;
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
	    	font-weight: 600;
	    	transition: 0.25s;
	    	border:1px solid #e5e5e5;
	    	cursor:pointer;
		}
</style>
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script>
	function save(f){
		var userid = f.userid.value.trim();
		var pwd = f.pwd.value.trim();
		var pwd_check = f.pwd_check.value.trim();
		var first_name = f.first_name.value.trim();
		var last_name = f.last_name.value.trim();
		var phone = f.phone.value.trim();
		var email = f.email.value.trim();
		var email_form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		
		
		if (pwd == '') {
			alert('비밀번호를 입력해주세요');
			return;
		}
		if (pwd_check == '') {
			alert('비밀번호를 입력해주세요');
			return;
		}
		if (last_name == ''){
			alert('성을 입력해주세요');
			return;
		}
		if (first_name == ''){
			alert('이름을 입력해주세요');
			return;
		}
		if (phone == '' || phone.length <= 10) {
			alert('연락처를 입력해주세요');
			return;
		}
		if (email == '') {
			alert('이메일을 입력해주세요');
			return;
		}
		if(!email_form.test(email)){
			alert('이메일 형식이 올바르지 않습니다');
			return;
		}
		if (pwd != pwd_check) {
			alert('비밀번호가 일치하지 않습니다.');
			return;
		}
		
		alert('계정 정보가 변경 되었습니다');
		
		f.method='post';
		f.action='modi_member.do';
		f.submit();
		
	}
	function del(f){
		
		var userid = document.getElementById("userid").value;

		var _width ='530';
		var _height = '670';
		
		 var _left = Math.ceil(( window.screen.width - _width )/2);
		 var _top = Math.ceil(( window.screen.height - _height )/2);
		
		 openWin = window.open('del_member_agree.do?userid='+userid, 'popup-test', 
				 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
		

	}


	function passwordCheckFunction() {
	
	
		/* 비밀번호, 비밀번호 확인 입력창에 입력된 값을 비교해서 같다면 비밀번호 일치, 그렇지 않으면 불일치 라는 텍스트 출력.*/
		/* document : 현재 문서를 의미함. 작성되고 있는 문서를 뜻함. */
		/* getElementByID('아이디') : 아이디에 적힌 값을 가진 id의 value를 get을 해서 password 변수 넣기 */
		var password = document.getElementById('pwd'); //비밀번호 
		var passwordConfirm = document.getElementById('pwd_check'); //비밀번호 확인 값
		var checkMessage = document.getElementById('checkMessage'); //확인 메세지
		var correctColor = "#83dcb7"; //맞았을 때 출력되는 색깔.
		var wrongColor = "#D43F21"; //틀렸을 때 출력되는 색깔
		
		
	
	
		if (password.value == passwordConfirm.value) {//password 변수의 값과 passwordConfirm 변수의 값과 동일하다.
			checkMessage.style.color = correctColor;/* span 태그의 ID(confirmMsg) 사용  */
			checkMessage.innerHTML = "비밀번호가 일치합니다.";/* innerHTML : HTML 내부에 추가적인 내용을 넣을 때 사용하는 것. */
		}
		else{
			checkMessage.style.color = wrongColor;
			checkMessage.innerHTML = "비밀번호가 일치하지 않습니다.";
		}    
	}
</script>
</head>
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

		<form>
		<table class="main">
			<tr>
				<td><h1>계정 설정<br></h1></td>
			</tr>
			<tr>
				<td><br>아이디 <a style="color:#D43F21">*수정 불가*</a><br>
				<input type="text" name="userid" id="userid" value="${vo.userid}" readonly="readonly" style="padding: 15px 30px;"></td>
			</tr>
			<tr>
			<td><br>
			비밀번호<br>
				<input type="password" name="pwd" id="pwd" value="${vo.pwd}" placeholder='비밀번호를 입력하세요' onkeyup="passwordCheckFunction()" style="padding: 15px 30px;">
			</td>
			</tr>
			<tr>
				<td colspan="2" >
			비밀번호 확인<br><input type="password" name="pwd_check" id="pwd_check"
				onkeyup="passwordCheckFunction()" placeholder="비밀번호 확인"  style="width:70%; padding: 15px 30px;" value="${vo.pwd}"><br><span id="checkMessage" > <br></span>
			</tr>
			<tr>
					<td><br>성명
					<br><input type="text" name="last_name" value="${vo.last_name}" placeholder="성" style="width:20%; padding: 15px 30px;" maxlength='2'>
					&nbsp;&nbsp;<input type="text" name="first_name" value ="${vo.first_name}" placeholder="이름" style="width:39%; padding: 15px 30px;" maxlength='4'><br></td>
			</tr>
			<tr>
			<td><br>
			전화번호<br>
				<input type="text" name="phone" id="phone" value="${vo.phone}" placeholder='전화번호를 입력하세요' maxlength='11' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
				style="padding: 15px 30px;">
			</td>
			</tr>
			<tr>
			<td><br>
			이메일<br>
				<input type="text" name="email" id="email" value="${vo.email}" placeholder='이메일을 입력하세요 예)aaa123@gmail.com' style="padding: 15px 30px;">
			</td>
			</tr>
			<tr>
			<td><br><br><hr style="width:80%; opacity:0.5;"></td>
			</tr>
			<tr><td><br><span>계정 삭제</span>
			</td></tr>
			<tr><td align="right">
			<input type="button" id="delete" name="delete" value="삭제" style="margin:0px 150px 0px 0px; background-color:#fff; color:#111;" onclick="del(this.form)"><br><br></td></tr>
			<tr><td>
			<!-- 위쪽 오른쪽 아래쪽 왼쪽 마진속성 한번에 주기 -->
			<hr style="width:80%; opacity:0.5;">
			</td>
			</tr>
			<tr>
			<td align="right">
			<br>
			<input type="button" value="저장" style="margin:0px 150px 0px 0px; background-color:#e5e5e5; color:#757575;" onclick="save(this.form)">
			</td>
			</tr>
		</table>
		</form>
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