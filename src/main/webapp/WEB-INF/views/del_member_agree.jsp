<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<link href="resources/nike/favicon.png" rel="icon">
	<meta charset="UTF-8">
	<title>Nike. Just Do It. Nike 코리아</title>
	<style>
	input[type="button"]{
			padding: 6px 15px;
	    	border-radius: 30px;
	    	font-family: "paybooc-Light", sans-serif;
	    	text-decoration: none;
	    	font-weight: 600;
	    	transition: 0.25s;
	    	border:1px solid #6e6e6e;
	    	cursor:pointer;
		}
	</style>
	<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
	<script>
	function check(){
		var input_check = document.getElementById("input_check").checked;
		
		if(document.getElementById("input_check").checked) {
		    document.getElementById("del_button").style.opacity = 1;
		    document.getElementById("del_button").style.cursor = 'pointer';
		    document.getElementById("input_check_hidden1").disabled = true;
		}else{
			document.getElementById("del_button").style.opacity = 0.35;
			  document.getElementById("del_button").style.cursor = 'default';
		}
		
	}
	
	
	 function del(f){

		 var userid = document.getElementById("userid").value.trim();
		 var check_go = false		 
		 var input_check = document.getElementById("input_check").checked;
		 
			
			if(input_check == false){
				return;
				}
			else{
			
			var url = "del.do";
			var param = "userid="+encodeURIComponent(userid);
			
			sendRequest(url, param, resultFn, "GET");
			}

	 }
	 
		function resultFn(){
			if(xhr.readyState == 4 && xhr.status == 200){
				//"[{'res':'no'}]"
				var data = xhr.responseText;
				var json = (new Function('return' + data))();
				
				
				if(json.result == 'no'){
					window.opener.parent.location.href="main.do"
					self.close();
				} else{
					alert('삭제오류');
				
				}
			}	
		}
	</script>
	</head>
	<body>
		<br>
		<span style="font-size: 28px;">&nbsp;&nbsp;계정을 삭제하시겠습니까?</span> <img src="resources/nike/close.png" style="width: 40px; height:atuo; float:right; margin-right:30px; cursor:pointer;" onClick='window.close()'>
		<br>
		<br>
		<form>
		<input type="hidden" id="userid" name="userid" value="${vo.userid}">
		<div style="font-size: 18px; font-weight : bold;">&nbsp;나이키 멤버 혜택:</div>
		<ul>
		<li> 무료 반품</li>
		<li> 빠른 결제</li>
		<li> 개인 위시리스트</li>
		<li> 간편한 주문 확인</li>
		<li> 나이키 멤버십을 통한 활동 추적</li>
		</ul>
		
		<div style="font-size: 18px; font-weight : bold;">&nbsp;계정 삭제 시:</div>
		<ul>
		<li>더 이상 나이키닷컴 또는 나이키 멤버 프로필에 엑세스 할 수<br>없습니다.</li>
		<li>주문 관련 정보는 <a href="#" style="color:#111;">고객센터</a>에 문의해 주시기 바랍니다.</li>
		<li>로그아웃 혹은 앱 삭제 전까지는 정보를 확인하실 수<br> 있습니다.</li>
		<li>요청을 제출하시면 계정을 비활성화해 드립니다. 데이터를<br> 완전히 삭제 및 제거하기까지는 최대 10일이 소요될 수<br> 있습니다.</li>
		</ul>
		
		<div>&nbsp;SNS나 나이키닷컴 이외의 플랫폼에 공유된 정보는 영향을 받지<br>&nbsp;않습니다.</div>
		<div>
		<br>&nbsp;&nbsp;<input type="checkbox" name="input_check" value='1' id="input_check" onclick="check()"/> 예, 나이키 계정을 삭제하겠습니다. 이 작업을 취소할 수<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;없습니다.
				<input type="hidden" name="input_check" value='0' id="input_check_hidden1">
		</div>
		<br><br>
		<div style="float:right"><input type="button" id="del_button" name = "del_button" value = "계정 삭제 " style="text-align: center; opacity:0.35; cursor:default;" onclick="del(this.form)">
		&nbsp;
		<input type="button" id="close" name="close" value="취소" style="background-color: #111; color:#fff; margin-right:30px;" onclick="window.close()"></div>
		</form>
	</body>
</html>