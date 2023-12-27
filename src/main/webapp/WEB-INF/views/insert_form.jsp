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
		//sing.do전송 함수
		function send(f) {
			
			var b_idcheck =false;
			
			//유효성검사
	
			var userid = f.userid.value.trim();
			var pwd = f.pwd.value.trim();
			var pwd_check = f.pwd_check.value.trim();
			var birth_first = f.birth_first.value.trim();
			var birth_last = f.birth_last.value.trim();
			var phone2 = f.phone2.value.trim();
			var phone3 = f.phone3.value.trim();
			var email = f.email.value.trim();
			var gender = f.gender.value;
			var first_name = f.first_name.value.trim();
			var last_name = f.last_name.value.trim();
			var email_form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			
			if (userid == '') {
				alert('아이디를 입력해주세요');
				return;
			}
			if (pwd == '') {
				alert('비밀번호를 입력해주세요');
				return;
			}
			if (pwd_check == '') {
				alert('비밀번호를 입력해주세요');
				return;
			}
			if (last_name == ''){
				alert('성을 입력해주세요');
				return;
			}
			if (first_name == ''){
				alert('이름을 입력해주세요');
				return;
			}
			if (phone2 == '' || phone2.length <= 3) {
				alert('연락처를 입력해주세요');
				return;
			}
			if (phone3 == '' || phone3.length <= 3) {
				alert('연락처를 입력해주세요');
				return;
			}
			if (birth_first == '' || birth_first.length <= 5) {
				alert('주민번호 앞자리를 입력해주세요');
				return;
			}
			if (birth_last == '' || birth_last.length <= 6) {
				alert('주민번호 뒷자리를 입력해주세요');
				return;
			}
			if (email == '') {
				alert('이메일을 입력해주세요');
				return;
			}
			if(!email_form.test(email)){
				alert('이메일 형식이 올바르지 않습니다');
				return;
			}
			if (pwd != pwd_check) {
				alert('비밀번호가 일치하지 않습니다.');
				return;
			}
			if(!b_idCheck){
				alert("아이디 중복체크를 해주세요")
				return;
			}
			
			f.method = "post"; //전송방식
			f.action = "sign.do"; //목적지
			f.submit();
	
		}
		
		//아이디중복체크
		function id_check() {
			
		
			var userid = document.getElementById("userid").value.trim();
	
			//유효성검사
			if(userid == ''){
				alert("아이디를 입력하세요");
				return;
			}
			
			var url = "check_id.do";
			var param = "userid="+encodeURIComponent(userid);
			
			sendRequest(url, param, resultFn, "GET");
		}
		
		function resultFn(){
			if(xhr.readyState == 4 && xhr.status == 200){
				//"[{'res':'no'}]"
				var data = xhr.responseText;
				var json = (new Function('return' + data))();
				
				
				if(json.result == 'no'){
					alert("이미 사용중인 아이디입니다.");
					return;
				} else{
					alert("사용가능한 아이디입니다.");
					b_idCheck = true;
				}
			}	
		}
		
		function che(){
			b_idCheck=false;
		}
	
		function passwordCheckFunction() {
			
			
			/* 비밀번호, 비밀번호 확인 입력창에 입력된 값을 비교해서 같다면 비밀번호 일치, 그렇지 않으면 불일치 라는 텍스트 출력.*/
			/* document : 현재 문서를 의미함. 작성되고 있는 문서를 뜻함. */
			/* getElementByID('아이디') : 아이디에 적힌 값을 가진 id의 value를 get을 해서 password 변수 넣기 */
			var password = document.getElementById('pwd'); //비밀번호 
			var passwordConfirm = document.getElementById('pwd_check'); //비밀번호 확인 값
			var checkMessage = document.getElementById('checkMessage'); //확인 메세지
			var correctColor = "#83dcb7"; //맞았을 때 출력되는 색깔.
			var wrongColor = "#D43F21"; //틀렸을 때 출력되는 색깔
			
			
	
	
			if (password.value == passwordConfirm.value) {//password 변수의 값과 passwordConfirm 변수의 값과 동일하다.
				checkMessage.style.color = correctColor;/* span 태그의 ID(confirmMsg) 사용  */
				checkMessage.innerHTML = "비밀번호가 일치합니다.";/* innerHTML : HTML 내부에 추가적인 내용을 넣을 때 사용하는 것. */
			}
			else{
				checkMessage.style.color = wrongColor;
				checkMessage.innerHTML = "비밀번호가 일치하지 않습니다.";
			}    
		}
		
		//핸드폰 번호 자동으로 커서 넘기기
		function moveCursor(textbox){
			
			if(textbox.value.length==4){
				document.getElementById("phone3").focus();
			}
		}
		//주민등록 번호 자동으로 커서 넘기기
		function moveCursor_birth(textbox){
			
			if(textbox.value.length==6){
				document.getElementById("birth_last").focus();
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
			<table align="center">
				<tr><td colspan="2"><img src = "${pageContext.request.contextPath}/resources/img/nike_logo.png" style="width:60px;"><br>
				<p style = "font-size:24px; font-family: sans-serif; margin:0px;">이제 나이키 멤버가 되어 볼까요?</p>
				<br></td></tr>
				<tr>
					<td colspan="2"><input type="text" name="userid" id="userid" onchange="che()" placeholder="아이디" value="${param.userid}" style="width:46%;"> <input type="button" value="중복체크" 
						onclick="id_check()"><br><br></td>
				</tr>
	
				<tr>
					<td colspan="2"><input type="password" name="pwd" id="pwd" placeholder="비밀번호" style="width:70%;"><br><br></td>
				</tr>
				<tr>
					<td colspan="2" ><input type="password" name="pwd_check" id="pwd_check"
						onkeyup="passwordCheckFunction()" placeholder="비밀번호 확인"  style="width:70%;"><br><span id="checkMessage"><br></span>
				</tr>
				<tr>
					<td colspan="2"><input type="text" name="last_name" placeholder="성" style="width:20%;">
					<input type="text" name="first_name" placeholder="이름" style="width:37%;"><br></td>
				</tr>
				<tr>
					<th align="left" style ="width : 10%">성별</th>
					<td align="left"><br>남&nbsp;<input type="radio" name="gender" value="men">&nbsp;
					여&nbsp;<input
						type="radio" name="gender" value="girl"><br><br></td>
				</tr> 	
				<tr>
					<td colspan="2">
					<input type="text" name= "phone1" value="010" readonly="readonly" style="width:40px;" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> - 
					<input type="text" name="phone2" id = "phone2" onkeyup="moveCursor(this)" maxlength='4' style="width:75px;" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
					 - <input type="text" name= "phone3" id="phone3" maxlength='4' style="width:75px;" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
					<br></td>
				</tr>
				<tr>
					<td colspan="2">
						<br><input type="text" placeholder="주민번호 앞자리" maxlength='6' id="birth_first" name="birth_first" style="width:25%;" onkeyup="moveCursor_birth(this)" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
						&nbsp;-&nbsp;
						<input type="password" placeholder="주민번호 뒷자리" maxlength='7' id= "birth_last" name="birth_last" style="width:25%;" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">	
					<br><br></td>
				<tr>
					<td colspan="2"><input type="text" name="email" style="width:70%" placeholder="이메일 ex)aaa123@gmail.com"></td>
				</tr>
				<tr>
					<td colspan="2">
					
					<p><input type="button" value="계정 만들기" onclick="send(this.form)" style = "width:83%;"></p>
					</td>
				</tr>
				<tr>
				<td colspan="2" style = "color : #6e6e6e;">입력하신 정보는 회원님의 동의 없이 공개되지 않으며,<br> 개인정보보호정책에 의해 보호를 받습니다.</td></tr>
			</table>
		</form>
	</body>
</html>