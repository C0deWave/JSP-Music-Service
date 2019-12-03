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
		Class.forName("oracle.jdbc.driver.OracleDriver");
		/* 11g express edition은 orcl 대신 XE를 입력한다. */
		// Connection dbconn=DriverManager.getConnection("jdbc:oracle:thin:@172.16.35.194:1521:orcl", "C##DBTEST", "dbgood");
		Connection dbconn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "C##DBTEST",
				"dbgood");
		Statement stmt = dbconn.createStatement();
		ResultSet myResultSet = stmt.executeQuery("SELECT ID FROM ALBUM ORDER BY ID DESC");

		myResultSet.next();

		int idNum = Integer.parseInt(request.getParameter("ALBUMID"));
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
	<br>

	<%
		stmt.execute("UPDATE ALBUM SET NAME='" + albumName + "',RELEASEYEAR='" + releasesYear + "',ARTISTID="
				+ artistId + "," + "PLANNINGCOMPANY='" + planningCompany + "' WHERE ID =" + idNum + "");

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

		stmt.close();
		dbconn.close();
	%>
	수정 완료 했습니다.
	<br> 앨범 이미지를 수정 하실꺼면 등록해 주세요
	<br>
	<form action="ModiAlbumImage.jsp" method="post"
		enctype="Multipart/form-data">
		<input type="hidden" value="<%=idNum%>" name="ID" /> 앨범 이미지 : <input
			type="file" name="image"><br> <input type='submit'
			value="등록">
	</form>

	</table>
	<table cellpadding="0" cellspacing="0" width="400" height="23"
		style="margin-left: auto; margin-right: auto; text-align: center;">
		<tr>
			<td>
				<p align="right">
					<span style="font-size: 9pt;"> <a href="../Album.jsp"> <font
							color="black">이미지는 수정 안함</font></a></span>
				</p>
			</td>
		</tr>
	</table>

</body>
</html>