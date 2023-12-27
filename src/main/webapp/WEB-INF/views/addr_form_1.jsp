<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>주소 추가</title>
	<style>
		input[type="text"],
		input[type="password"]{
		    padding: 15px 30px;
	    	border-radius: 15px;
	    	font-family: "paybooc-Light", sans-serif;
	    	text-decoration: none;
	    	font-weight: 600;
	    	transition: 0.25s;
	    	border:1px solid #6e6e6e;
	    	color: #6e6e6e;
		}
		
		button{
			padding: 15px 30px;
	    	border-radius: 30px;
	    	font-family: "paybooc-Light", sans-serif;
	    	text-decoration: none;
	    	font-weight: 600;
	    	transition: 0.25s;
	    	border:1px solid #e5e5e5;
	    	color: #fff;
	    	background-color : #111111;
	    	cursor:pointer;
		}
	</style>
	<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
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
           
           
        // 우편번호와 주소 정보를 해당 필드에 넣는다.
           document.getElementById('addr1').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('addr2').value = fullRoadAddr;
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}

function send(f){
	
	
 	var addr1 = f.addr1.value.trim();
 	var addr2 = f.addr2.value.trim();
 	var addr3 = f.addr3.value.trim();
 	var userid = f.userid.value.trim();
	
	if(addr1 ==''){
		alert('주소를 입력해주세요');
		return;
	} 
	var url = "addr_modi.do";
	var param = "userid="+encodeURIComponent(userid)+"&addr1="+encodeURIComponent(addr1)+"&addr2="+encodeURIComponent(addr2)+"&addr3="+encodeURIComponent(addr3);
	
	sendRequest(url, param, resultFn, "GET");
	
}
function resultFn(){
	if(xhr.readyState == 4 && xhr.status == 200){
		//"[{'res':'no'}]"
		var data = xhr.responseText;
		var json = (new Function('return' + data))();
		
		
		if(json.result == 'yes'){
			window.opener.parent.location.href="addr_form.do?userid=${vo.userid}";
			self.close();
		} else{
			alert('수정오류');
		
		}
	}	
}
</script>
	</head>
	<body>
	<form>
	<input type="hidden" value=${vo.userid } id="userid" name="userid">
		<div style="padding:48px 68px 36px; vertical-align: baseline;">
			<div style= "width: 432px; height:380px;">
				<div style="width:420px;height:68px; padding : 4px 48px 36px 0px;">
					<h1 style="display:inline;">주소 추가</h1>
					<span><img src="resources/nike/close.png" style="width: 40px; height:atuo; float:right; cursor:pointer;" onClick='window.close()'></span>
				</div>
				
				<!-- 주소찾기 div -->
				<div style="width:426px; height:84px;">
						<div class="form-group">
						<input class="form-control" style="width: 40%; display: inline;"
							placeholder="우편번호" name="addr1" id="addr1" type="text"
							readonly="readonly">
						<button type="button" class="btn btn-default" style="margin-left: 40px;"
							onclick="execPostCode();">
							<i class="fa fa-search"></i> 우편번호 찾기
						</button>
						<br>
					</div>	
					<div class="form-group">
					<br>
						<input class="form-control" style="top: 5px; width:100%;" placeholder="도로명 주소"
							name="addr2" id="addr2" type="text" readonly="readonly" />
					</div>
					<div class="form-group">
					<br>
						<input class="form-control" placeholder="상세주소" name="addr3"
							id="addr3" type="text" style="width:100%;"/>
					</div>
					<div>
					<br>
					<button type="button" id="save" name="save" style="margin-left : 79%; background-color: #E5E5E5;
						color:#757575; padding : 6px 20px;"
							onclick="send(this.form);"> 저장</button>
					</div>
				</div>
			

			</div>
		</div>
	</form>
	</body>
</html>