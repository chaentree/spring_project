<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <head>
   <link href="resources/nike/d-favicon.png" rel="icon">
   <meta charset="UTF-8">
   <title>장바구니 나이키 매장</title>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cart.css">
   <link rel="preconnect" href="https://fonts.gstatic.com">
   <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.css">
   <script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
   <script>
      function send(f){
    	  if(${total.totalprice}==0){
    		  alert('상품 수량이 존재하지 않습니다. 수량 변경후 다시 시도해주세요.');
    		  return;
    	  }
         f.action = 'buy_main.do';
         f.submit();
      }
      
      // 장바구니 삭제
      function del(cart_id) {
         
         
         if(!confirm("삭제하시겠습니까?")){
            return;
         }
         
         //ajax
         var url = "c_del.do";
         var param = "userid=${vo.userid}&cart_id="+cart_id;
         
         sendRequest(url, param, delCheck, "POST");
      }
      
      //삭제여부를 판단하는 콜백 메서드
       function delCheck() {
         if(xhr.readyState == 4 && xhr.status == 200){
            
            var data = xhr.responseText;
            var json = (new Function('return' + data))();
            
            if(json[0].param =='yes'){
               alert('삭제 성공');
               location.href="cart.do?userid=${vo.userid}";
            }else{
               alert('삭제 실패');
            }
         }
      } 
      
      function count(target, product_id){
      
         var userid = document.getElementById("userid").value.trim();
         var cart_quantity = target.value;
         
         if(cart_quantity == 0){
        	 alert('수량을 선택해 주세요');
        	 location.reload();
        	 return;
         }
         
         
         var url = "count.do";
         var param = "userid="+encodeURIComponent(userid)+"&cart_quantity="+encodeURIComponent(cart_quantity)+"&product_id="+encodeURIComponent(product_id   );
         
         sendRequest(url, param, resultFn, "GET");
      }
      
      function resultFn(){
         if(xhr.readyState == 4 && xhr.status == 200){
            //"[{'res':'no'}]"
            var data = xhr.responseText;
            var json = (new Function('return' + data))();
            
            
            if(json.result == 'no'){
               alert("수량변경오류");
               return;
            } else{
               location.reload();
            }
         }   
      }
   </script>
   </head>
<body>
   <%@ include file = "../header.jsp" %>
<form>
      <input type="hidden" name="userid" id = "userid" value=${vo.userid }>
      
      <div class="container">
         <div class="left-item">
            <h2>장바구니</h2>
            <c:set var="j" value="${list}"/>
            <c:if test="${j eq '[]'}">
				<span>장바구니에 상품이 없습니다.</span>
            </c:if>
            <c:forEach var= "cartvo" items="${list}"  varStatus="status">
         
            <div class="item">
               <div class="img">
                 <a href='p_detail.do?userid=${vo.userid}&product_id=${cartvo.product_id}'> <img src="${pageContext.request.contextPath}/resources/upload/${cartvo.filename}"
                            width="150px" height="150px"> </a>
               </div>
               <div class="p-content">
            
                  <p> ${cartvo.p_name}</p>
                  <p>${cartvo.p_material}</p>
                  <p>사이즈 ${cartvo.p_size} 
                     수량 
                     <select onchange="count(this,${cartvo.product_id} )">
                           <option value="${cartvo.cart_quantity}">${cartvo.cart_quantity}</option>
                           <option value="0">---선택하세요---</option>
                           <option value="1">1</option>
                           <option value="2">2</option>
                           <option value="3">3</option>
                           <option value="4">4</option>
                           <option value="5">5</option>
                           <option value="6">6</option>
                     </select>
                  </p>
                  <form>
                     <input type="hidden" name="userid_del" id="userid_del" value="${vo.userid}"> 
                     <input type="hidden" name="cart_id" id="cart_id_del" value="${cartvo.cart_id}">
                     <a href="#"> <img src="${pageContext.request.contextPath}/resources/nike/wish.svg"
                        width="20px" height="20px"> </a>
                     <a href="#" onclick="del(${cartvo.cart_id})"><img src="${pageContext.request.contextPath}/resources/nike/trashcan.svg"
                        width="20px" height="20px"></a>
                  </form>
               </div>
               <div class="p-price">
                  <p><fmt:formatNumber value="${sub[status.index].subprice}" pattern="###,###,###"/>원</p>
               </div>
            </div>
         </c:forEach>
         </div>
         <div class="right-item">
            <h2>주문 내역</h2>
            <!-- <p>프로모션 코드가 있으신가요?</p> -->
            <div class="p-price">
               <p>상품금액</p>
               <p><fmt:formatNumber value="${total.totalprice}" pattern="###,###,###"/> 원</p>
            </div>
            <div class="p-ship">
               <p>배송비</p>
               <p>무료</p>
            </div>
            <div class="discount">
               <p>총 할인</p>
               <p></p>
            </div>
            <div class="total-price">
               <p>총 결제 금액</p>
               <p><fmt:formatNumber value="${total.totalprice}" pattern="###,###,###"/> 원</p>
            </div>
            	<c:if test="${j eq '[]'}">
               <input id="buy" type="button" value="주문결제" style="background-color:#f5f5f5; color:#8a8a8a; cursor:default; opacity:0.7;">
               </c:if>
               <c:if test="${j ne '[]'}">
               <input id="buy" type="button" value="주문결제" onclick="send(this.form)">
               </c:if>
         </div>
      </div>
      <div class="ship">
         <p>무료 배송</p>               
         <p>도착 예정일 : 12월 5일 (월)</p>               
      </div>
      </form>
      <div class="wishlist">
         <h2>위시리스트</h2>
         <p>위시리스트에 저장된 상품이 없습니다.</p>
      </div>
      
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
       
       <%@ include file = "../footer.jsp" %>
</body>
</html>
<script>
   /* section8 슬라이드 부분 */
   $('.shoes-slider').owlCarousel({
      items : 3, // 보여지는 개수
      nav : true, // prev, next 버튼
      loop : true, // 마지막 이미지 다음에 첫번째 이미지 나오게
      margin : 30, // 이미지 양 옆 마진
      autoplay : false, // 자동 이미지 슬라이드
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