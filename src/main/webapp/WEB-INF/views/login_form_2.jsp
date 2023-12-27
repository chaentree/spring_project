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
	
	
	function login(f){
		
		var userid = f.userid.value.trim();
		var pwd = f.pwd.value.trim();
		
		
		var url = "login_check.do";
		var param = "userid="+encodeURIComponent(userid)+"&pwd="+encodeURIComponent(pwd);
		
		sendRequest(url, param, resultFn, "POST");

	}
	function resultFn(){
		var userid = document.getElementById("userid").value; //확인 메세지
		var pwd = document.getElementById("pwd").value; //확인 메세지
		var checkMessage = document.getElementById('checkMessage'); //확인 메세지
		var correctColor = "#83dcb7"; //맞았을 때 출력되는 색깔.
		var wrongColor = "#D43F21"; //틀렸을 때 출력되는 색깔
		
		if(xhr.readyState == 4 && xhr.status == 200){
			//"[{'res':'no'}]"
			var data = xhr.responseText;
			var json = (new Function('return' + data))();
			
			
			if(json.result == 'yes'){
				checkMessage.style.color = wrongColor;
				checkMessage.innerHTML = "비밀번호가 일치하지 않습니다.";
			} else{
				location.href="login.do?userid="+userid;
			}
			
		}
	}
		
		
	
	</script>
			<style>
			table{
				width : 500px;
				height : 500px;
				border-collapse : collapse;
				margin-top : 50px;
				}
			input[type="password"]
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
		
		</style>
	</head>
<body>
	<form>
	<input type="hidden" id="userid" name="userid" value="${param.userid}"> 
		<table align="center">
			<tr><td><img src = "${pageContext.request.contextPath}/resources/img/nike_logo.png" style="width:60px;"><br>
			<p style = "font-size:28px; font-family: sans-serif; margin:0px;">
			비밀번호를 입력하세요
			</p><br>
			<span id="name">${vo.userid}</span>님 환영합니다
			<br><br><br>
			<span id="checkMessage"></span><br>
			<input type="password" name="pwd" id="pwd" placeholder="비밀번호" style = "width:85%;">
			<br> 
			<span style="color :#6e6e6e" ><br><br><a href="pwd_search.do?userid=${vo.userid}" style="color : #6e6e6e; cursor:pointer;">비밀번호 찾기</a>
			</span>
			<br><br><br><input type="button" value="로그인" onclick="login(this.form)" >
			
			</td></tr>
		</table>
	</form>
</body>
</html>