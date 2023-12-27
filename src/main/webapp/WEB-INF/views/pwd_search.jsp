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
	var change = false;
	function jumin_check() {
	  // 토글 할 버튼 선택 (btn1)
	  const modi_pwd = document.getElementById('modi_pwd');
	  var jumin_first = document.getElementById('jumin_first');
	  var jumin_last = document.getElementById('jumin_last');
	  
	  var jumintotal = jumin_first.value + jumin_last.value;
	  
	  if(jumintotal != ${vo.birth}){
	  // btn1 숨기기 (display: none)
	  if(modi_pwd.style.visibility !== 'hidden') {
		  modi_pwd.style.visibility = 'hidden';
	  }
	  }else{ // btn 보이기 (display: block)
		  modi_pwd.style.visibility = 'visible';
		    change=true;
		  }	  
	}
	
	function che(){
		change=false;
	}
	
	function moveCursor(textbox){
		
		if(textbox.value.length==6){
			document.getElementById("jumin_last").focus();
		}
	}
	
	function pwd_change(f){
		//유효성검사
		var jumin_first = f.jumin_first.value.trim();
		var jumin_last = f.jumin_last.value.trim();
		var modi_pwd = f.modi_pwd.value.trim();
		
		if(jumin_first == '' || jumin_first.length <= 5){
			alert('주민번호 앞자리를 입력해 주세요.');
			return;
		}		
		if(jumin_last == '' || jumin_last.length <= 5){
			alert('주민번호 뒷자리를 입력해 주세요.');
			return;
		}
		if(modi_pwd == ''){	
			alert('변경할 비밀번호를 입력해 주세요.');
			return;
		}
		
		f.method='get';
		f.action='modi_pwd.do';
		f.submit();
		
	}
</script>
<style>
input[type="text"], input[type="password"] {
	padding: 15px 30px;
	border-radius: 15px;
	font-family: "paybooc-Light", sans-serif;
	text-decoration: none;
	font-weight: 600;
	/*transition: all 1s;*/

}
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
	}
</style>

</head>
	<body>
	<form>
	<input type="hidden" name="idx" id ="idx" value="${vo.idx}">
	<input type="hidden" name="userid" id ="userid" value="${vo.userid}">
		<table class="main" align="center">
			<tr><td colspan="2"><img src = "${pageContext.request.contextPath}/resources/img/nike_logo.png" style="width:60px;"><br>
			<p style = "font-size:24px; font-family: sans-serif; margin:0px;">주민등록번호를 인증하고 새 비밀번호를 입력하세요.</p>
			<br>
			<p style = "font-size:18px; color:#6e6e6e;">회원님의 주민등록번호를 입력하시면 새 비밀번호를 입력하실수 있습니다.</p>
			성함 : ${vo.last_name }  ${vo.first_name }<br>
			이메일 : ${vo.email }
			</tr>
			
			<tr>
			<td>
				<input type='text' placeholder="주민번호 앞자리" id='jumin_first' name='jumin_first' onkeyup='jumin_check(), moveCursor(this)' onchange='che()' style= "width : 30%" maxlength='6' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
				&nbsp;-&nbsp;
				<input type='password' placeholder="주민번호 뒷자리" id='jumin_last' name='jumin_last' onkeyup='jumin_check()' onchange='che()' style= "width : 30%" maxlength='6' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
				<br><br>
				<input type='password' placeholder="변경 할 비밀번호입력" id='modi_pwd' name='modi_pwd' style="visibility:hidden; width : 79%;">
			</td>
			</tr>
			
			<tr>
				<td colspan="2"><a href='login_form_2.do?userid=${vo.userid}' style="color:#6e6e6e;">취소하기</a>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				<input type="button" value="저장" onclick='pwd_change(this.form)'></td>
			</tr>

		</table>
</form>
	</body>
</html>