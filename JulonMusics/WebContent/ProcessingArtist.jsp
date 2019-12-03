<%@ page import="java.sql.*" contentType="text/html;charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	추가중 입니다.
	<br>
	<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
		/* 11g express edition은 orcl 대신 XE를 입력한다. */
		// Connection dbconn=DriverManager.getConnection("jdbc:oracle:thin:@172.16.35.194:1521:orcl", "C##DBTEST", "dbgood");
		Connection dbconn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "C##DBTEST",
				"dbgood");
		Statement stmt = dbconn.createStatement();
		ResultSet myResultSet = stmt.executeQuery("SELECT ID FROM ARTIST ORDER BY ID DESC");

		myResultSet.next();
		int idNum = Integer.parseInt(myResultSet.getString("ID")) + 1;
		String name = new String(request.getParameter("NAME").getBytes("8859_1"), "UTF-8");
	%>

	받아온 값
	<br>
	<%=name%>
	<%=request.getParameter("DEBUTYEAR")%>
	<br><br><hr>

	<%
		stmt.execute("INSERT INTO ARTIST VALUES ('" + name + "' , '" + request.getParameter("DEBUTYEAR") + "',"
				+ idNum + ")");

		myResultSet = stmt.executeQuery("SELECT * FROM ARTIST ORDER BY ID ASC");

		if (myResultSet != null) {
			while (myResultSet.next()) {
	%>
	<%=myResultSet.getString("NAME")%>
	<%=myResultSet.getString("DEBUTYEAR")%>
	<%=myResultSet.getString("ID")%>
	<br>
	<%
		}
		}
	%>
	<br><br><hr>
	추가 완료 했습니다.
	<br>

	<table cellpadding="0" cellspacing="0" width="400" height="23"
		style="margin-left: auto; margin-right: auto; text-align: center;">
		<tr>
			<td width="1350">
				<p align="right">
					<b><a href="Album.jsp"> <font size="2" face="돋움체"
							color="black">앨범 목록으로</font></a></b>
				</p>
			</td>
		</tr>
	</table>

</body>
</html>