<%@ page import="java.sql.*" contentType="text/html;charset=EUC-KR"%>
<%
	//음악 추가폼이다.
	//ID를 자동으로 할당하기 위해서 DB를연동한다.
	Class.forName("oracle.jdbc.driver.OracleDriver");
	/* 11g express edition은 orcl 대신 XE를 입력한다. */
	// Connection dbconn=DriverManager.getConnection("jdbc:oracle:thin:@172.16.35.194:1521:orcl", "C##DBTEST", "dbgood");
	Connection dbconn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "C##DBTEST",
			"dbgood");
	Statement stmt = dbconn.createStatement();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	음악 추가
	<br>
	<form action="ProcessingMusic.jsp" name="음악 추가폼" method="post"
		accept-charset="utf-8" onsubmit="document.charset='utf-8';">

		<!-- 이름  데뷔년도  ID -->
		<!-- MUSICNAME  GENRE  ID -->
		노래 제목 :<input type="text" name="MUSICNAME" size="20"><br>
		장르 : <input type="text" name="GENRE" size="20"><br> <br>
		<br> 앨범 <br>
		<%
			ResultSet myResultSet = stmt.executeQuery("SELECT * FROM ALBUM ORDER BY ID ASC");
			if (myResultSet != null) {
				while (myResultSet.next()) {
		%>
		<input type="radio" name="album" value=<%=myResultSet.getInt("ID")%>
			checked="checked"><%=myResultSet.getString("NAME")%><br>
		<%
			}
			}
		%>
		<br> <input type='submit' value="저장">
	</form>
	<table cellpadding="0" cellspacing="0" width="400" height="23"
		style="margin-left: auto; margin-right: auto; text-align: center;">
		<tr>
			<td width="1350">
				<p align="right">
					<b><a href="Album.jsp"> <font size="2" face="돋움체"
							color="black">뒤로가기</font></a></b>
				</p>
			</td>
		</tr>
	</table>
</body>
</html>