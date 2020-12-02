<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
</head>
<h3>SELECT_SALES</h3>
<body>
<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//122.128.169.32:1521/xe", "sdh_14", "1234");
		if (conn != null) {
			System.out.println("Database Connected!");
		}
		else {
			System.out.println("Database Connect Fail!");
		}
		Statement stmt = conn.createStatement();
		String query = "SELECT " +
			    "SL.SALENO AS 판매ID, SH.SCODE || '-' || SH.SNAME 지점명, SL.SALEDATE 판매일자, P.PCODE 피자코드, P.PNAME 피자명, SL.AMOUNT 판매수량, P.COST*SL.AMOUNT 매출액" +
			    " FROM " +
			        "TBL_PIZZA_01 P, TBL_SALELIST_01 SL, TBL_SHOP_01 SH" +
			    " WHERE SL.SCODE = SH.SCODE AND " + 
			          "SL.PCODE = P.PCODE" +
			    " ORDER BY SL.SALENO";

		ResultSet rs = stmt.executeQuery(query);
		
		%>
		<table border=1>
			<thead>
				<tr>
					<td>판매ID</td>
					<td>지점명</td>
					<td>판매일자</td>
					<td>피자코드</td>
					<td>피자명</td>
					<td>판매수량</td>
					<td>매출액</td>
				</tr>
			</thead>
			<tbody>
			<%
				while (rs.next()) {
			%>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
					<td><%=rs.getInt(6)%></td>
					<td><%=rs.getInt(7)%></td>
				</tr>
			<%
				}
			%>
			</tbody>
		</table>
		<%
		stmt.close();
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>
</body>
</html>
