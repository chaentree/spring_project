<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
	<link href="resources/nike/favicon.png" rel="icon">
	<meta charset="UTF-8">
	<title>Nike. Just Do It. Nike 코리아</title>
		<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
		<script>
		
		
		
		function idCheckFunction() {
			
			var b_idcheck = false;
			
			var userid = document.getElementById("userid").value.trim();
			
			var url = "check_id.do";
			var param = "userid="+encodeURIComponent(userid);
			
			sendRequest(url, param, resultFn, "GET");
		}
		
		function resultFn(){
			
			var checkMessage = document.getElementById('checkMessage'); //확인 메세지
			var correctColor = "#83dcb7"; //맞았을 때 출력되는 색깔.
			var wrongColor = "#D43F21"; //틀렸을 때 출력되는 색깔
			
			if(xhr.readyState == 4 && xhr.status == 200){
				//"[{'res':'no'}]"
				var data = xhr.responseText;
				var json = (new Function('return' + data))();
				
				
				if(json.result == 'no'){
					checkMessage.style.color = correctColor;
					checkMessage.innerHTML = "일치하는 아이디가 존재합니다.";
					b_idcheck =true;
				} else{
					checkMessage.style.color = wrongColor;
					checkMessage.innerHTML = "일치하는 아이디가 존재하지 않습니다.";
					b_idcheck =false;
				}
			}	
	
		}
		
		function send(f){
			
			var userid = f.userid.value.trim();
			if(userid ==''){
				alert('아이디를 입력해주세요');
				return;
			}
			if(!b_idcheck){
				location.href="agree.do?userid="+userid;
				alert('회원가입을 위해 페이지를 이동합니다');
				return;
			} 
			
			
				f.method="post";
				f.action="login_form_1_1.do"
				f.submit();
				
						
		}
		


			

		
		</script>
		<style>
			table{
				width : 500px;
				height : 500px;
				border-collapse : collapse;
				margin-top : 50px;
				}
			input[type="text"]
				{
			    padding: 15px 30px;
		    	border-radius: 15px;
		    	font-family: "paybooc-Light", sans-serif;
		    	text-decoration: none;
		    	font-weight: 600;
		    	transition: 0.25s;
		    	border:1px solid #D43F21;
		    	color: #6e6e6e;
				}
			input[type="button"]{
				padding: 15px 30px;
		    	border-radius: 30px;
		    	font-family: "paybooc-Light", sans-serif;
		    	text-decoration: none;
		    	font-weight: 600;
		    	transition: 0.25s;
		    	border:1px solid #6e6e6e;
		    	color: #fff;
		    	background-color : #111111;
		    	cursor:pointer;
		    	width : 100%;
				}
			input::placeholder {
  				color: #D43F21;
				font-family: "paybooc-Light", sans-serif;
					}
			input:focus {
				font-family: "paybooc-Light", sans-serif;
					}
			span {
			font-family : "paybooc-Light", sans-serif;
			text-decoration: none;
			font-weight: 600;
			transition: 0.25s;
			}	
			a{
			color :#6e6e6e;
			}	
		
		</style>
	</head>
	<body>
	<form>
		<table align="center">
			<tr><td><img src = "${pageContext.request.contextPath}/resources/img/nike_logo.png" style="width:60px;"><br>
			<p style = "font-size:28px; font-family: sans-serif; margin:0px;">
			가입 또는 로그인을 위해 아이디를 입력하세요.
			</p><br>
			대한민국
			<br><br><br>
			<input type="text" name="userid" id="userid" placeholder="아이디" style = "width:85%;"  onkeyup="idCheckFunction();">
			<br><span id="checkMessage"></span> 
			<span style="color :#6e6e6e"><br><br>계속 진행하면 나이키의 <a href="https://agreementservice.svs.nike.com/rest/agreement?agreementType=privacyPolicy&country=KR&language=ko&requestType=redirect&uxId=4fd2d5e7db76e0f85a6bb56721bd51df" target=”_blank”>
			개인정보처리방침</a>및 <a href="https://agreementservice.svs.nike.com/rest/agreement?agreementType=termsOfUse&country=KR&language=ko&requestType=redirect&uxId=4fd2d5e7db76e0f85a6bb56721bd51df" target=”_blank”>
			이용약관</a>에 동의하게 됩니다.
			</span>
			<br><br><br><input type="button" value="계속" onclick="send(this.form)" >
			
			</td></tr>
		</table>
	</form>
	</body>
</html>