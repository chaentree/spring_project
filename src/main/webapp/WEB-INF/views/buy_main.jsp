<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Nike. Just Do It. Nike 코리아</title>
<script
	src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/nike.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/buy_main.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
		POST /v1/payment/ready HTTP/1.1
		Host: kapi.kakao.com
		Authorization: KakaoAK ${APP_ADMIN_KEY}
		Content-type: application/x-www-form-urlencoded;charset=utf-8
		
			/*header&main*/
			$(".center").mouseenter(function() {
				$(".menu-sub").stop().slideDown();
			})
			$(".center").mouseleave(function() {
				$(".menu-sub").stop().slideUp();
			})
		</script>
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }
           
           var fulladdr = data.zonecode + " " + fullRoadAddr;
           
        // 우편번호와 주소 정보를 해당 필드에 넣는다.
           //document.getElementById('addr1').value = data.zonecode; //5자리 새우편번호 사용
           //document.getElementById('addr2').value = fullRoadAddr;
           document.getElementById('address').value = fulladdr;
          
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}
	    
</script>

<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
	        var IMP = window.IMP;  // 팝업창
	        /* IMP.init("imp67011510"); */
	        IMP.init("imp67225614");// 아임포트 가맹점 식별코드
	      
	        var today = new Date(); //일 
	        var hours = today.getHours(); // 시
	        var minutes = today.getMinutes();  // 분
	        var seconds = today.getSeconds();  // 초
	        var milliseconds = today.getMilliseconds(); //밀리초
	        var makeMerchantUid = hours +  minutes + seconds + milliseconds;

	           
	        	        
	        
	        function requestPay(f) { //인자 값으로 컨트롤러로부터 받아온 차량명 데이터를 삽입하였다.
				
	        	var phone = f.phone.value.trim();
 				var first_name = f.first_name.value.trim();
				var last_name = f.last_name.value.trim();
				var address = f.address.value.trim();
				
				if(last_name==''){
					alert('성을 입력해주세요')
					return;
				}
				if(first_name == ''){
					alert('이름을 입력해주세요')
					return;
				}
				if(phone == ''){
					alert('번호를 입력해주세요')
					return;
					
				}
				if(address == ''){
					alert('주소를 입력해주세요')
					return;
					
				}
				
	
	
	        	IMP.request_pay({ //요청하는 것들
	                pg : 'html5_inicis', //카카오페이 API래핑
	              
				
		
	
	                
	                
	                
	                
	                /*                 'kakao':카카오페이,       
	            html5_inicis':이니시스(웹표준결제)                 
	            'nice':나이스페이                  
	            'jtnet':제이티넷   
	            'uplus':LG유플러스             
	            'danal':다날             
	            'payco':페이코             
	            'syrup':시럽페이              
	            'paypal':페이팔              
	             */
	             pay_method : 'card',
	          /*                
	               'samsung':삼성페이,  
	               'card':신용카드,          
	               'trans':실시간계좌이체,            
	               'vbank':가상계좌,            
	               'phone':휴대폰소액결제          
	                */
	                merchant_uid: "IMP"+makeMerchantUid,  // 상점에서관리하는 상품번호
	                name : "hihi", //상품명
	                amount : ${total.totalprice}, //가격
	                buyer_email : 'Iamport@chai.finance', //구매자 이메일
	                buyer_name : '아임포트 기술지원팀', //구매자 이름
	                buyer_tel : '010-1234-5678', //구매자 번호
	                buyer_addr : '서울특별시 강남구 삼성동', //구매자 주소 
	                buyer_postcode : '123-456'
	                /* m_redirect_url : 'https://www.yourdomain.com/payments/complete' */
	            }, function (rsp) { // callback
	                if (rsp.success) {
	                    console.log(rsp);
	                    var msg = '결제가 완료되었습니다.\n';
	               msg += '고유ID : ' + rsp.imp_uid+"\n";
	               msg += '상점 거래ID : ' + rsp.merchant_uid+"\n";
	               msg += '결제 금액 : ' + rsp.paid_amount+'원\n';
	               msg += '카드 승인번호 : ' + rsp.apply_num;
					
	               
	               
	               
	               
	               //결제 완료 후 다음 페이지로 넘어가야 하는데 넘어가지 않음 
					/* f.method="post";
					f.action="buy_main_2.do"
					f.submit(); */
					
					//폼태그가 아니라 loaction.href로 해보겠습니당.
					
	               location.href="buy_main_2.do?userid=${vo.userid}";
	               
	                } else {
	                    console.log(rsp);
	                    var msg = '결제에 실패하였습니다.\n';
	                    check = false;
	                    location.href="buy_main_2.do?userid=${vo.userid}";
	               msg += '에러내용 : ' + rsp.error_msg;
	               
	                }
	                alert(msg);
	            });
	     
	     
	        }
	    </script>





<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/nike.css">



<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/nike.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js">
			/*header&main*/
				$(".center").mouseenter(function() {
					$(".menu-sub").stop().slideDown();
				})
				$(".center").mouseleave(function() {
					$(".menu-sub").stop().slideUp();
				})
			</script>
<script>
				
				
				
				const autoHyphen2 = (target) => {
					 target.value = target.value
					   .replace(/[^0-9]/g, '')
					  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
					}
				
				
				
				
		
		
		</script>
<script
	src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>









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
		</div>
	</header>

	<form>
		<input type="hidden" id="orderfinalprice" name="orderfinalprice"
			value="${total.totalprice}">

		<h1>결제하기</h1>
		<div class="container">
			<div class="left-ship">
				<h2>배송옵션</h2>
				<div class="form-group">

					<input type="text" name="last_name" id="last_name"
						class="radiusinp" placeholder="성" value="${vo.last_name}">
					<input type="text" name="first_name" id="first_name"
						class="radiusinp" placeholder="이름" value="${vo.first_name}">
					<br>
					<br> <input type="text" name="phone" id="phone" class="input2"
						oninput="autoHyphen2(this)" maxlength="13" placeholder="전화번호" value="${vo.phone}">
					<p class="info">모든 주문 관련 안내는 SMS로 전송됩니다.</p>
				</div>

				<div class="form-group2">
					<input type="text" id="address" onclick="execPostCode()"
						name="address" class="input2" placeholder="&#128269;주소입력" value="${vo.addr}" readonly />
					<br>
					<br> <input type="text" id="address2" name="address2"
						class="input2" placeholder="상세 주소 입력"> <br>
					<p class="addr_input">
						<a href="#">직접 주소 입력</a>
					</p>
					<input type="button" class="ab" value="저장 및 계속"
						onclick="requestPay(this.form)">
				</div>
				<div class="text">
					<h2>결제</h2>
					<h2>주문완료</h2>
				</div>
			</div>
			<div class="right-cart">
				<div class="r-title">
					<h2>장바구니</h2>
					<p>
						<a href="cart.do?userid=${vo.userid}">편집</a>
					</p>
				</div>
				<div class="r-info">
					<div class="p-price">
						<p>상품금액</p>
						<p>
							<fmt:formatNumber value="${total.totalprice}"
								pattern="###,###,###" />
							원
						</p>
					</div>
					<div class="p-discount">
						<p>할인</p>
						<p>0 원</p>
					</div>
					<div class="p-ship">
						<p>배송비</p>
						<p>0 원</p>
					</div>
					<div class="total-price">
						<p>총 결제 금액</p>
						<p>
							<fmt:formatNumber value="${total.totalprice}"
								pattern="###,###,###" />
							원
						</p>
					</div>
					<div class="ship-day">
						도착예정일 :
						<div id="current_date"></div>
					</div>
				</div>
				<c:forEach var="va" items="${va}" varStatus="status">
					<div class="r-bottom">
						<div class="left-img">
							<img
								src="${pageContext.request.contextPath}/resources/upload/${va.filename}"
								width="60px" height="60px">
						</div>
						<div class="right-text">
							<h3>${va.p_name}</h3>
							<p>사이즈: ${va.p_size}</p>
							<p>수량: ${va.cart_quantity}</p>
							<p>
								<fmt:formatNumber value="${sub[status.index].subprice}"
									pattern="###,###,###" />
								원
							</p>
						</div>
					</div>
				</c:forEach>
				<div></div>
				<%-- <c:forEach var = "va" items="${va}" varStatus="status" >
            <p>	<img src="${pageContext.request.contextPath}/resources/upload/${va.filename}"
									 width="150px" height="150px"></p>
            <h3>${va.p_name}</h3>
            <p>${va.p_size}</p>
           	<p><fmt:formatNumber value="${sub[status.index].subprice}" pattern="###,###,###"/> 원</p>
            </c:forEach> --%>

			</div>
		</div>
	</form>

	<%-- <div class="buy_right">
			<h4>상품 명${vo.p_name}</h4>
		</div> --%>

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
					<a href="#"><img src="resources/nike/location.png"></a> <a
						href="#">대한민국</a>
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
						<span>(유)나이키코리아 대표 Kimberlee Lynn Chang Mendes, 킴벌리 린 창 멘데스
							| 서울 강남구 테헤란로 152 강남파이낸스센터 30층 |</span><br> <span>통신판매업신고번호
							2011-서울강남-03461 | 등록번호 220-88-09068 <a href="#">사업자 정보 확인</a>
						</span><br> <span>고객센터 전화 문의 <a href="#">080-022-0182</a> FAX
							02-6744-5880 | 이메일 <a href="#">service@nike.co.kr</a> | 호스팅서비스사업자
							(유)나이키코리아
						</span>
					</p>
				</div>
				<div class="right">
					<p>
						<span>현금 등으로 결제 시 안전 거래를 위해 저희 쇼핑몰에서 가입한 파이서브코리아의 구매 안전서비스(<a
							href="#">결제대금예치</a>)를 이용하실 수 있습니다.
						</span><br> <span>온라인디지털콘텐츠산업발전법에 의한 콘텐츠 보호 안내 <a href="#">자세히보기</a></span>
					</p>
				</div>
			</div>
		</div>
	</footer>




</body>
<!--  
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address_kakao").value = data.address; // 주소 넣기
                document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}
</script>-->
</html>
<script>
date = new Date();
year = date.getFullYear();
month = date.getMonth() + 1;
day = date.getDate()+1;
document.getElementById("current_date").innerHTML = month + "월" + day + "일";
</script>
