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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.css">
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
		
		
	</head>
	<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
		<script>
		
		function b_cancel(orderid){
				
				
				if(confirm('주문 취소하시겠습니까?')==true){
				var url = "b_del.do";
				var param = "orderid="+encodeURIComponent(orderid);
				
				sendRequest(url, param, resultFn, "GET");
				}
				else{
					return;
				}
			}
		
		function resultFn(){
			
			if(xhr.readyState == 4 && xhr.status == 200){
				//"[{'res':'no'}]"
				var data = xhr.responseText;
				var json = (new Function('return' + data))();
				
				
				if(json.result == 'no'){
					alert("주문취소에 실패하였습니다.");
					return;
				} else{
					location.href= "myorder.do?userid=${vo.userid}";
				}
			}
		}
		</script>
	<body>
	<%@ include file = "../views/header.jsp" %>
	

		<!-- section0:banner -->
	    <section class="section section0" style="background-color: #fff; box-shadow: inset 0 0px 0 0 #fff;">
	    	<!-- 회색 배너 부분 : 나이키 사이트에 현재 content가 비어있음 -->
	        <div class="banner">
	        </div>
	    </section>

	    
	    
			<h2	style="width:302.25px; height:28px; left:10%">주문</h2>
			<div style="width: 652.48px; height:28px; float:none; left : 42%">
			<a href="profile.do?userid=${vo.userid }" align="center" style="padding: 0 16px; color:#111111;">프로필&nbsp;</a>
			<a href="myorder.do?userid=${vo.userid }" align="c호enter" style="padding: 0 16px; color:#757575;">주문&nbsp;</a>
			<a href="favorites.do?userid=${vo.userid }" align="center" style="padding: 0 16px; color:#111111;">위시리스트&nbsp;</a>
			<a href="member_modi_form.do?userid=${vo.userid}" align="center" style="padding: 0 16px; color:#111111;">설정&nbsp;</a>
			</div>
		<div>
		<br>
		<hr style="opacity:0.5; width:1305px; left :10%">
		</div>
			
		</div>
		<div style="padding : 0 48px; color:#757575; width:1401px; ">
			
			<c:if test="${i eq null}">
		<div style="height:480px;">
			<div style="left:50%;"><h1><br><br>로그인이 필요한 기능입니다.<br><br></h1></div>
			<div style="left:13%" align="center">
				<input type="button" value="로그인 하기" onclick="location.href ='login_form_1.do'" style="padding: 15px 30px; border-radius: 30px; border:1px solid #6e6e6e; font-weight: 600; color: #fff; background-color : #111111; cursor:pointer;">		
				&nbsp;&nbsp;
				<input type="button" value="뒤로가기" onclick="javascript:window.history.back();" style="padding: 15px 30px; border-radius: 30px; border:1px solid #6e6e6e; font-weight: 600; color: #fff; background-color : #111111; cursor:pointer;">
			</div>
		</div>
			</c:if>
			
			<c:if test="${i ne null}">
			<!-- 주문한 품목이 나오는 곳 --> 
			<c:set var="j" value="${list}"/>
			<c:if test="${j eq '[]'}">
			<div style="width:602px; height:540px; left:15%">
				<div style="color:#757575;">
				주문이 없습니다.
				</div>	
			</div>	
			</c:if>
			
			
			<c:if test="${j ne '[]' }">
				<div style="width:602px; height:auto; left:15%">
				<div style="color:#757575;">
					<div>
					
					<form>
					
						<c:forEach var= "buyvo" items="${list}">
							<br>
							<table style="width : 1205px;" >
								<tr>
									<td style="font-weight:bold; font-size:18px; font-family:Arial; margin-left : 3%; margin-top:5%; background-color:#f5f5f5;" > ${buyvo.orderdate }</td>
									<td style="background-color:#f5f5f5; widht:580px;">&nbsp;&nbsp;총 주문금액 <fmt:formatNumber pattern="###,###,###" value="${buyvo.ordersaleprice}" /> 원</td>
									<td style="background-color:#f5f5f5; width:264.69px;">&nbsp;&nbsp;주문번호 	 ${buyvo.orderid}</td>
									<td align="right" style="background-color:#f5f5f5; width:170.31px;"><a href="sorry.do" style="color:#757575;">상세보기 ></a></td>
								
								</tr>
								<tr>
								<td style="width:180px; heigh:180px;">
									<a href="p_detail.do?userid=${vo.userid}&product_id=${buyvo.product_id}"><img src = "${pageContext.request.contextPath}/resources/upload/${buyvo.filename}" style =" width :150px; height:150px; margin : 1%; display:inline;"></a>
								</td>
								<c:if test = "${buyvo.order_info eq 0 || buyvo.order_info eq 1 || buyvo.order_info eq 2}">
								<td style="width:580px;">
								  ${buyvo.p_name}<br>
								  
								  사이즈 : ${buyvo.p_size}<br>
								  
								 수량 : ${buyvo.b_count} ea<br>
								 
								 가격 : <fmt:formatNumber pattern="###,###,###" value="${buyvo.p_price}" /> 원<br>
								</td>
								</c:if>
								<c:if test ="${buyvo.order_info eq -1 }">
									주문 취소
								</c:if>	
								<td>
								<c:if test ="${buyvo.order_info eq 0 }">
									<span>배송 준비중<br><br></span>
									배송비 : <fmt:formatNumber pattern="###,###,###" value="${buyvo.deliverycost}" />원
								</c:if>
								<c:if test ="${buyvo.order_info eq 1 }">
									<span >배송중<br><br></span>
									배송비 : <fmt:formatNumber pattern="###,###,###" value="${buyvo.deliverycost}" />원
								</c:if>
								<c:if test ="${buyvo.order_info eq 2 }">
									<span>배송완료<br><br></span>
									배송비 : <fmt:formatNumber pattern="###,###,###" value="${buyvo.deliverycost}" />원
								</c:if>
								<c:if test ="${buyvo.order_info eq -1 }">
									<span>주문 취소 되었습니다.<br><br></span>
								</c:if>
								
								</td>

								<td align="center">
								<c:if test = "${buyvo.order_info eq 0 || buyvo.order_info eq 1}">
										<input type="button" name="buy_cancel" name="buy_cancel" value="주문취소" onclick="b_cancel(${buyvo.orderid})" style="padding: 10px 30px; border:1px solid #6e6e6e; color: #fff; background-color : #111111; cursor:pointer;">
								</c:if>
								<c:if test = "${buyvo.order_info eq -1}">
										주문취소 되었습니다.
								</c:if>
								<c:if test = "${buyvo.order_info eq 2}">
										
								</c:if>
								</td>
								</tr>
								
							</table>
						</c:forEach>
						</form>
					</div>
				</div>	
			</div>
			
			</c:if>
		</c:if>
		</div>
		
		
		<br><br><br><br>






<%@ include file = "../views/footer.jsp" %>