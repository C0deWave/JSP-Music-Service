<%@ page import="java.sql.*" contentType="text/html;charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Processing Album</title>
</head>
<body>
	음악 수정중 입니다.
	<br>
	<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
		/* 11g express edition은 orcl 대신 XE를 입력한다. */
		// Connection dbconn=DriverManager.getConnection("jdbc:oracle:thin:@172.16.35.194:1521:orcl", "C##DBTEST", "dbgood");
		Connection dbconn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "C##DBTEST",
				"dbgood");
		Statement stmt = dbconn.createStatement();
		//ResultSet myResultSet=stmt.executeQuery("SELECT ID FROM MUSIC ORDER BY ID DESC");

		//myResultSet.next();

		int idNum = Integer.parseInt(request.getParameter("ALBUMID"));
		String musicName = new String(request.getParameter("MUSICNAME").getBytes("8859_1"), "UTF-8");
		String likes = new String(request.getParameter("LIKES").getBytes("8859_1"), "UTF-8");
		String genre = new String(request.getParameter("GENRE").getBytes("8859_1"), "UTF-8");
		int albumId = Integer.parseInt(request.getParameter("album"));
	%>

	받아온 값
	<br>
	<%=musicName%>
	<%=likes%>
	<%=genre%>
	<%=albumId%>
	<br>

	<%
		stmt.execute("UPDATE MUSIC SET NAME='" + musicName + "',LIKES='" + likes + "',ALBUMID=" + albumId + ","
				+ "GENRE='" + genre + "' WHERE ID =" + idNum + "");

		ResultSet myResultSet = stmt.executeQuery("SELECT NAME,LIKES,GENRE FROM MUSIC ORDER BY ID ASC");

		if (myResultSet != null) {
			while (myResultSet.next()) {
	%>
	<%=myResultSet.getString("NAME")%>
	<%=myResultSet.getInt("LIKES")%>
	<%=myResultSet.getString("GENRE")%>
	<br>
	<%
		}
		}

		stmt.close();
		dbconn.close();
	%>
	수정 완료 했습니다.
	<br> 음악 파일을 수정 하실꺼면 등록해 주세요
	<br>
	<form action="ModiMusicFile.jsp" method="post"
		enctype="Multipart/form-data">
		<input type="hidden" value="<%=idNum%>" name="ID" /> 음악파일(mp3형식) : <input
			type="file" name="image"><br> <input type='submit'
			value="등록">
	</form>
	<table cellpadding="0" cellspacing="0" width="400" height="23"
		style="margin-left: auto; margin-right: auto; text-align: center;">
		<tr>
			<td>
				<p align="right">
					<span style="font-size: 9pt;"> <a href="../Album.jsp"> <font
							color="black">음악파일 수정 안함</font></a></span>
				</p>
			</td>
		</tr>
	</table>

</body>
</html>