<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link href="resources/nike/favicon.png" rel="icon">
		<meta charset="UTF-8">
		<title>Nike. Just Do It. Nike 코리아</title>
		<style>
		table{
			width : 500px;
			height : 500px;
			border-collapse : collapse;
			margin-top : 50px;
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
		}
	</style>
	<script>
	function send(f){
	f.method = "post"; //전송방식
	f.action = "sign_clear.do"; //목적지
	f.submit();
	}
	</script>
	</head>
	<body>
	<form>
	<input type="hidden" id="userid" name="userid" value="${vo.userid}">
		<table align="center">
		<tr>
		<td><img src = "${pageContext.request.contextPath}/resources/img/nike_logo.png" style="width:60px;"><br>
			<br><p style = "font-size:24px; font-family: sans-serif; margin:0px;">로그인되었습니다.</p>
			<br>
			<p><input type="button" value="계속" onclick="send(this.form)" style = "width:83%;"></p>
		</td></tr>
		</table>
	</form>
	</body>
</html>