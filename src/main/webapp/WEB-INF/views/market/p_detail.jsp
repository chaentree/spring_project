<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>상세페이지</title>
		<link rel="stylesheet" 
    		href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" 
    		integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/> 
    	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/p_detail.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
		<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
		<script>
			var userid = $("#product_id").val();
	    	// input태그를 hidden속성으로 숨겨서 값을 가져왔다.
	    	$("#cart").click(function(event) {
				event.preventDefault();
				location.assign("/order/mycart/" + userid);			
			});

	    	
	    	function cart_add(f){
	    		
	    		
	    	 	var product_id = f.product_id.value.trim();
	    	 	var p_price = f.p_price.value.trim();
	    	 	var p_size = f.p_size.value.trim();
	    	 	var p_material = f.p_material.value.trim();
	    	 	var p_name = f.p_name.value.trim();
	    	 	var filename = f.filename.value.trim();
	    	 	var userid = f.userid.value.trim();
	    		
	   			
	    	 
	    		var url = "cart_add.do";
	    		var param = "userid="+encodeURIComponent(userid)+
	    		"&product_id="+encodeURIComponent(product_id)+
	    		"&p_price="+encodeURIComponent(p_price)+
	    		"&p_size="+encodeURIComponent(p_size)+
	    		"&p_material="+encodeURIComponent(p_material)+
	    		"&p_name="+encodeURIComponent(p_name)+
	    		"&filename="+encodeURIComponent(filename);
	    		
	    		sendRequest(url, param, resultFn, "GET");			
	    		
	    	}
	    	function resultFn(){
				if(xhr.readyState == 4 && xhr.status == 200){
					//"[{'res':'no'}]"
					var data = xhr.responseText;
					var json = (new Function('return' + data))();
					
					
					if(json.result == 'no'){
						alert("추가 오류");
						return;
					} else{
						alert("장바구니 추가 완료.");
					}
				}	
			}
	    	
</script>
		
	</head>
	<body>
	<%@ include file = "../header.jsp" %>
	
		<div class="container">
			<div class="left-img">
				<img src="${pageContext.request.contextPath}/resources/upload/${marketvo.filename}"
									 width="434px" height="542px">
			</div>
			<div class="right-info">
				<div class="p-content">
					<h1>${marketvo.p_name}</h1>
					<h2>${marketvo.p_material}</h2>
					<p class="price"><fmt:formatNumber value="${marketvo.p_price}" pattern="###,###,###"/>원</p>
					<p class="size">${marketvo.p_size}</p>
					<p class="info">${marketvo.p_info}</p>
					<a href="#">상품 상세 정보 보기</a>
					<form>
						<input type="hidden" id="product_id" name="product_id" value="${marketvo.product_id}">
						<input type="hidden" id="p_price" name="p_price" value="${marketvo.p_price}">
						<input type="hidden" id="userid" name="userid" value="${vo.userid}">
						<input type="hidden" id="p_size" name="p_size" value="${marketvo.p_size}">
						<input type="hidden" id="p_material" name="p_material" value="${marketvo.p_material}">
						<input type="hidden" id="p_name" name="p_name" value="${marketvo.p_name}">
						<input type="hidden" id="filename" name="filename" value="${marketvo.filename}">
						
						<c:set var="i" value="${vo.userid}"/>
	                    <c:if test="${i eq null or i eq ''}"> 
	                    <input id="cart" type="button" value="장바구니" onclick="location.href='login_form_1.do'">
	                    </c:if>
	                    <c:if test="${i ne null}"> 
						<input id="cart" type="button" value="장바구니" onclick="cart_add(this.form)">
						</c:if>
						<input id="wish" type="button" value="위시리스트 ♡" onclick="location.href='sorry.do'">
					</form>
				</div>
				<div class="p-info">
					<div class="wrap">
						<div class="title-box">
							<h3 class="title">무료 배송 및 반품</h3>
							<span class="acod">
	                        	<i class="fas fa-plus"></i>
	                        	<i class="fas fa-minus"></i>
	                    	</span>
                    	</div>
                    	<div class="txt-box">
                    	<p class="s-title">일반 배송</p>
                    	<p>• 배송지역: 전국 (일부 지역 제외)</p>
                    	<p>• 배송비: 무료배송</p>
                    	<p>• 제품 수령일로부터 14일 이내 제품에 대해서만 무료 반품 서비스가 가능합니다.</p>
                    	<p>일반배송
                    		<a href="#">자세히 알아보기</a>
                    	</p>
                    	<p>반품
                    		<a href="#">자세히 알아보기</a>
                    	</p>
                    	
                    	<br>
                    	
                    	<p class="s-title">오늘도착 서비스</p>
                    	<p>• 이용시간: 낮 12시까지 결제 시, 당일 도착 (일요일, 공휴일 제외)</p>
                    	<p>• 서비스지역: 서울∙과천∙의왕∙군포∙수원∙성남∙안양시 전체, 용인시 수지구∙기흥구, 부천시 중동∙상동∙심곡동</p>
                    	<p>• 서비스비용: 5,000원</p>
                    	<p>
                    		<a href="#">자세히 알아보기</a>
                    	</p>
                    	
                    	<br>
                    	
                    	<p class="s-title">A/S 안내 </p>
                    	<p>• 나이키 온라인에서 구매하신 제품에 대한 A/S 는 나이키코리아 고객센터(
                    	<a href="tel:080-022-0182">080-022-0182</a>
                    	)에서 유선으로만 접수 가능합니다.</p>
                    	<p>
                    		<a href="#">자세히 알아보기</a>
                    	</p>
                		</div>
					</div>
					<div class="wrap">
						<div class="title-box">
							<h3 class="title">리뷰</h3>
							<span class="acod">
	                        	<i class="fas fa-plus"></i>
	                        	<i class="fas fa-minus"></i>
	                    	</span>
                    	</div>
                    	<div class="txt-box">
                    		<p class="s-title">등록된 리뷰가 없습니다!</p>
                		</div>
					</div>
					<div class="wrap">
						<div class="title-box">
							<h3 class="title">추가 정보</h3>
							<span class="acod">
	                        	<i class="fas fa-plus"></i>
	                        	<i class="fas fa-minus"></i>
	                    	</span>
                    	</div>
                    	<div class="txt-box">
                    		<p class="s-title">상품정보제공고시</p>
	                    	<p>• 제조연월: 수입제품으로 각 상품별 입고 시기에 따라 상이하여 정확한 제조연월 제공이 어렵습니다. 제조연월을 확인하시려면 고객센터에 문의하시기 바라며, 정확한 제조연월은 배송받으신 제품의 라벨을 참고하시기 바랍니다.</p>
	                    	<p>• A/S 책임자와 전화번호: (유)나이키코리아 온라인 스토어 고객센터 / 080-022-0182</p>
	                    	<p>• 세탁방법 및 취급시 주의사항: 자세한 내용은 '<a href="#">자세히 보기</a>'를 클릭하여 확인 부탁드립니다.</p>
	                    	<p>• 미성년자 권리 보호 안내: 자세한 내용은 '<a href="#">자세히 보기</a>'를 클릭하여 확인 부탁드립니다.</p>
	                    	<p>• 품질보증기준: 품질보증기간-섬유 및 일반 소재(구입 후 6개월), 가죽소재(구입 후 1년). 유통 중 손상되었거나 품질에 이상이 있는 제품에 한하여 소비자 피해 보상 규정에 의거 보상하여 드립니다. 단, 제품에 부착되어 있는 사용방법 및 취급 시 주의사항에 따라 제품을 관리해 주시고, 소비자 부주의로 인한 품질 이상 및 변형에 대해서는 책임을 지지 않습니다.</p>
	                    	<p>• 제조자/수입품의 경우 수입자를 함께 표기: Nike. Inc / (유)나이키코리아</p>
                		</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file = "../footer.jsp" %>
	</body>
</html>
<script>
    $(".wrap").click(function(){
       $(this).find(".txt-box").slideToggle()
       $(".wrap").not(this).find(".txt-box").slideUp()
    })
</script>