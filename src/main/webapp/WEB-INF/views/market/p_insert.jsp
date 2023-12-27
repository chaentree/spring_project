<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
	<script>
		function send(f){
			//유효성 검사
			var p_name = f.p_name.value;
			var photo = f.photo.value;
			var p_pirce = f.p_price.value;
			var p_size = f.p_size.value;
			var p_material = f.p_material.value;
			var p_info = f.p_info.value;
			
			if(p_name == ''){
				alert('제목을 입력해주세요.');
				return;
			}
			if(photo == ''){
				alert('파일을 첨부해주세요.');
				return;
			}
			
			f.action = "upload.do";
			f.submit();
		}
		
		function cancle(f){
			
			f.action="market.do?userid=${vo.userid}";
			f.submit();
			
		}
	</script>
	</head>
	<body>
	<form method ="post" enctype="multipart/form-data">
	<input type="hidden" name="userid" id="userid" value="${vo.userid }">
	<table align="center">
	<tr>
	<td>
		상품명 : <input type="text" name="p_name"><br><br>
		사진 : <input type ="file" name="photo"><br><br>
		상품 가격 : <input type="text" name= "p_price"><br><br>
		상품 사이즈 : <input type="text" name= "p_size"><br><br>
		상품 소재 : <input type="text" name= "p_material"><br><br>
		상품 설명 : <textarea row="5" cols="50" name="p_info" style="resize:none;" wrap="on"></textarea><br><br>
		상품 재고 : <input type="text" name= "p_stock" maxlength='3' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"><br><br>
	
		<input type="button" value = "전송" onclick ="send(this.form)">
		<input type="button" value = "목록" onclick ="cancle(this.form)">
	</td>
	</tr>
	</table>
	</form>
	
	</body>
</html>