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
		String query = "SELECT P.PNAME, SUM(P.COST*SL.AMOUNT) AS TOTAL " +
				"FROM " + 
			    "TBL_PIZZA_01 P, TBL_SALELIST_01 SL " +
				"WHERE " +
			    "SL.PCODE = P.PCODE " + 
				"GROUP BY " +
			    "P.PCODE, P.PNAME " +
				"ORDER BY " +
			   "TOTAL DESC";

		ResultSet rs = stmt.executeQuery(query);
		
		%>
		<table border=1>
			<thead>
				<tr>
					<td>피자명</td>
					<td>매출액</td>
				</tr>
			</thead>
			<tbody>
			<%
				while (rs.next()) {
			%>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getInt(2)%></td>
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