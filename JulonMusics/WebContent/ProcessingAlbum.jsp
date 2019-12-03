<%@ page import="java.sql.*" contentType="text/html;charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Processing Album</title>
</head>
<body>
	앨범 추가중 입니다.
	<br>
	<%
	//받아온 값을 DB에 추가하는 작업을 합니다.
		Class.forName("oracle.jdbc.driver.OracleDriver");
		/* 11g express edition은 orcl 대신 XE를 입력한다. */
		// Connection dbconn=DriverManager.getConnection("jdbc:oracle:thin:@172.16.35.194:1521:orcl", "C##DBTEST", "dbgood");
		Connection dbconn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "C##DBTEST",
				"dbgood");
		Statement stmt = dbconn.createStatement();
		ResultSet myResultSet = stmt.executeQuery("SELECT ID FROM ALBUM ORDER BY ID DESC");

		myResultSet.next();
		int idNum = Integer.parseInt(myResultSet.getString("ID")) + 1;
		String albumName = new String(request.getParameter("ALBUMNAME").getBytes("8859_1"), "UTF-8");
		String releasesYear = new String(request.getParameter("RELEASEYEAR").getBytes("8859_1"), "UTF-8");
		String planningCompany = new String(request.getParameter("PLANNINGCOMPANY").getBytes("8859_1"), "UTF-8");
		int artistId = Integer.parseInt(request.getParameter("album"));
	%>

	받아온 값
	<br>
	<%=albumName%>
	<%=releasesYear%>
	<%=planningCompany%>
	<%=artistId%>
	<br><br><hr>

	<%
		stmt.execute("INSERT INTO ALBUM(NAME,RELEASEYEAR,ID,ARTISTID,PLANNINGCOMPANY) VALUES ('" + albumName
				+ "' , '" + releasesYear + "'," + idNum + "," + artistId + ",'" + planningCompany + "'" + ")");

		myResultSet = stmt.executeQuery("SELECT * FROM ALBUM ORDER BY ID ASC");

		if (myResultSet != null) {
			while (myResultSet.next()) {
	%>
	<%=myResultSet.getString("NAME")%>
	<%=myResultSet.getString("RELEASEYEAR")%>
	<%=myResultSet.getString("ID")%>
	<%=myResultSet.getString("ARTISTID")%>
	<%=myResultSet.getString("PLANNINGCOMPANY")%>
	<br>
	<%
		}
		}
	%>
	<%
		stmt.close();
		dbconn.close();
	%>
	추가 완료 했습니다.
	<br> 앨범 이미지를 추가해 주세요
	<br>
	<form action="AddAlbumImage.jsp" method="post"
		enctype="Multipart/form-data">
		<input type="hidden" value="<%=idNum%>" name="ID" /> 앨범 이미지 : <input
			type="file" name="image" accept=".jpg,.jpeg,.png,.gif,.bmp"><br> <input type='submit'
			value="저장">
	</form>


</body>
</html>