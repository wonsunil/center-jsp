<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="action/insert_shoplist.jsp" method="POST">
		<table>
			<tr>
				<td>상점 코드</td>
				<td><input name="scode"></td>
			</tr>
			<tr>
				<td>상점명</td>
				<td><input name="sname"></td>
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