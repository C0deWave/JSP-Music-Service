<%@ page import="java.sql.*" contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Processing Album</title>
</head>
<body>
	음악을 추가중 입니다.
	<br>
	<%
		//DB 연동 부분
		Class.forName("oracle.jdbc.driver.OracleDriver");
		/* 11g express edition은 orcl 대신 XE를 입력한다. */
		// Connection dbconn=DriverManager.getConnection("jdbc:oracle:thin:@172.16.35.194:1521:orcl", "C##DBTEST", "dbgood");
		Connection dbconn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "C##DBTEST",
				"dbgood");
		Statement stmt = dbconn.createStatement();
		ResultSet myResultSet = stmt.executeQuery("SELECT * FROM MUSIC ORDER BY ID DESC");

		myResultSet.next();
		int idNum = Integer.parseInt(myResultSet.getString("ID")) + 1;
		String musicName = new String(request.getParameter("MUSICNAME").getBytes("8859_1"), "UTF-8");
		String genre = new String(request.getParameter("GENRE").getBytes("8859_1"), "UTF-8");
		int albumId = Integer.parseInt(request.getParameter("album"));

		myResultSet = stmt.executeQuery("SELECT ARTISTID FROM ALBUM WHERE ID = " + albumId + "");
		myResultSet.next();
		int artistId = Integer.parseInt(myResultSet.getString("ARTISTID"));
		int musicId = idNum;
	%>

	받아온 값
	<br>
	<%=musicName%>
	<%=genre%>
	<%=albumId%>
	<%=musicId%>
	<%=artistId%>
	<br>
<br><hr>

	<%
		stmt.execute("INSERT INTO MUSIC(NAME,LIKES,ALBUMID,ARTISTID,ID,GENRE) VALUES ('" + musicName + "' ,0, "
				+ albumId + "," + artistId + "," + musicId + ",'" + genre + "')");

		myResultSet = stmt.executeQuery("SELECT * FROM MUSIC ORDER BY ID ASC");

		if (myResultSet != null) {
			while (myResultSet.next()) {
	%>
	<%=myResultSet.getString("NAME")%>
	<%=myResultSet.getString("LIKES")%>
	<%=myResultSet.getString("ALBUMID")%>
	<%=myResultSet.getString("ARTISTID")%>
	<%=myResultSet.getString("ID")%>
	<%=myResultSet.getString("GENRE")%>
	<%=myResultSet.getString("FILENAME")%>
	<br>
	<%
		}
		}
	%>
	<%
		stmt.close();
		dbconn.close();
	%>
	<br><br><hr>
	정보 추가 완료 했습니다.
	<br> 음악 파일을 추가해 주세요
	<br>
	<form action="AddMusicFile.jsp" method="post"
		enctype="Multipart/form-data">
		<input type="hidden" value="<%=idNum%>" name="ID" /> 음악 파일 : <input
			type="file" name="image" accept=".mp3,.mpeg,.wav"><br> <input type='submit'
			value="저장">
	</form>


</body>
</html>