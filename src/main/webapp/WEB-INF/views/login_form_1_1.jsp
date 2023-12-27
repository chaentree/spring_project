<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<link href="resources/nike/favicon.png" rel="icon">
	<meta charset="UTF-8">
	<title>Nike. Just Do It. Nike 코리아</title>
	<style>
		table {
		width: 500px;
		height: 500px;
		border-collapse: collapse;
		margin-top: 50px;
	} 
	
		input[type="button"]{
			padding: 15px 15px;
	    	border-radius: 30px;
	    	font-family: "paybooc-Light", sans-serif;
	    	text-decoration: none;
	    	font-weight: 600;
	    	transition: 0.25s;
	    	border:1px solid #6e6e6e;
	    	color: #fff;
	    	background-color : #111111;
	    	cursor:pointer;
	    	width : 500px;
		}
	</style>
	<script>
	function send(f){
		//유효성 검사
		
		var checkbox_1 = document.getElementById("checkbox_1").checked;
		var checkbox_2 = document.getElementById("checkbox_2").checked;
		var checkbox_3 = document.getElementById("checkbox_3").checked;
		
		if(document.getElementById("checkbox_1").checked) {
		    document.getElementById("checkbox_1_hidden1").disabled = true;
		}
		if(document.getElementById("checkbox_2").checked) {
		    document.getElementById("checkbox_2_hidden2").disabled = true;
		}
		if(document.getElementById("checkbox_3").checked) {
		    document.getElementById("checkbox_3_hidden3").disabled = true;
		}

		
		
		if(checkbox_1 == false){
		alert('이용약관에 동의해주세요.');
		return;
		}
		if(checkbox_2 == false){
		alert('개인 정보 수집 및 이용에 동의해주세요');
		return;
		}
		if(checkbox_3 == false){
		alert('개인 정보의 제 3자 제공 및 국외 이전에 동의해주세요');
		return;
		}
		
		
		f.method="POST"
		f.action="login_form_2.do"
		f.submit();
	}
	
		function checkall(){
			
		var checkbox_1 =	document.getElementById("checkbox_1").checked;
		var checkbox_2 =	document.getElementById("checkbox_2").checked;
		var checkbox_3 =	document.getElementById("checkbox_3").checked;
		var allcheckbox = 	document.getElementById("allcheckbox").checked;
		
		if(!checkbox_1){
			document.getElementById("checkbox_1").checked =true;
		}
 		if(!checkbox_2){
			document.getElementById("checkbox_2").checked =true;
		}
		if(!checkbox_3){
			document.getElementById("checkbox_3").checked =true;
		}
		if(checkbox_1 && checkbox_2 && checkbox_3 ){
			document.getElementById("checkbox_1").checked =false;
			document.getElementById("checkbox_2").checked =false;
			document.getElementById("checkbox_3").checked =false;
		}
		if(checkbox_1 && checkbox_2 && checkbox_3 && allcheckbox){
			document.getElementById("checkbox_1").checked =true;
			document.getElementById("checkbox_2").checked =true;
			document.getElementById("checkbox_3").checked =true;
		}
	}
		
		function checkcheck(){
			var checkbox_all = document.getElementById("allcheckbox").checked;
			
			if(checkbox_all){
				document.getElementById("allcheckbox").checked = false;
			} 
		}
</script>
	</head>
	<body>
		<form>
		<input type="hidden" name="userid" id="userid" value="${vo.userid}">
		<table align ="center">
			<tr><td><img src = "${pageContext.request.contextPath}/resources/img/nike_logo.png" style="width:60px;"><br><br>
			<p style = "font-size:28px; font-family: sans-serif; margin:0px;">
			계속 진행하시려면 아래 권한에 동의해 주세요.
			</p>
			<tr>
			<td style = "font-size:13px;">*필수 항목</td>
			</tr>
			<tr>
			<td style = "color:#6e6e6e"><br>나이키에 오신 것을 환영합니다! 법률 약관이 업데이트 되었습니다. 진행하시기 전에 내용을 검토하고 동의해 주세요.</td>
			</tr>
			<tr>
			<td><br><input type="checkbox" name="allcheckbox" id="allcheckbox" onclick="checkall()"> 모든 약관에 동의합니다.<br>
			</td>
			</tr>
			<tr><td><br><hr style = "color:#6e6e6e; opacity:0.5"></td></tr>
			<tr><td>
			<br><input type="checkbox" name="checkbox_1" id="checkbox_1" value="1" onclick="checkcheck()"> <a href="https://agreementservice.svs.nike.com/rest/agreement?agreementType=termsOfUse&uxId=4fd2d5e7db76e0f85a6bb56721bd51df&country=KR&language=ko&requestType=redirect"  target=”_blank” style="color :#111">이용약관</a>에 동의합니다.*
			<input type="hidden" name="checkbox_1" value='0' id="checkbox_1_hidden1">	
			</td></tr>
			<tr><td>
			<br><input type="checkbox" name="checkbox_2" id="checkbox_2" value="1" onclick="checkcheck()"> <a href="https://agreementservice.svs.nike.com/rest/agreement?agreementType=piCollectionList&uxId=4fd2d5e7db76e0f85a6bb56721bd51df&country=KR&language=ko&requestType=redirect"  target=”_blank” style="color :#111">개인 정보 수집 및 이용</a>에 동의합니다.*
			<input type="hidden" name="checkbox_2" value='0' id="checkbox_2_hidden2">
			</td></tr>
			<tr><td>
			<br><input type="checkbox" name="checkbox_3" id="checkbox_3" value="1" onclick="checkcheck()"> <a href="https://agreementservice.svs.nike.com/rest/agreement?agreementType=3rdPartyList&uxId=4fd2d5e7db76e0f85a6bb56721bd51df&country=KR&language=ko&requestType=redirect"  target=”_blank” style="color :#111">개인 정보의 제 3자 제공 및 국외 이전</a>에 동의합니다.*
			<input type="hidden" name="checkbox_3" value='0' id="checkbox_3_hidden3">
			</td></tr>
			<tr><td style="color :#6e6e6e">
			<br><br>이 약관에 동의하지 않을 수 있지만, 그럴 경우 나이키 계정에 로그인할 수 없으며 새로운 계정을 생성할 수도 없습니다.
			</td></tr>
			<tr><td>
			<br><br>
				<input type="button" value="계속" onclick="send(this.form)">
			</td></tr>
			<tr><td>
				<br><input type="button" value="취소" onclick="location.href='login_form_1.do'" style="color :#111; background-color : #fff;">
			</td></tr>
		</table>
	</form>
	</body>
</html>