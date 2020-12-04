<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="action/insert_data.jsp" method="POST">
		<table border=1>
			<tr>
				<td>피자 코드</td>
				<td><input type="text" name="pizza_code"></td>
			</tr>
			<tr>
				<td>피자 이름</td>
				<td><input type="text" name="pizza_name"></td>
			</tr>
			<tr>
				<td>피자 가격</td>
				<td><input type="text" name="cost"></td>
			</tr>
			<tr>
				<td collspan=2>
					<input type="submit" value="등록하기">
					<input type="button" value="다시쓰기" onclick="resetForm();">
				</td>
			</tr>
		</table>
	</form>
</body>
<script>
	function resetForm() {
		document.forms[0].reset();
	};
</script>
</html>