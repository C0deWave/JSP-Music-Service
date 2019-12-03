<%@ page import="java.sql.*" contentType="text/html;charset=EUC-KR"%>
<%
	//DB연동 부분
	Class.forName("oracle.jdbc.driver.OracleDriver");
	/* 11g express edition은 orcl 대신 XE를 입력한다. */
	// Connection dbconn=DriverManager.getConnection("jdbc:oracle:thin:@172.16.35.194:1521:orcl", "C##DBTEST", "dbgood");
	Connection dbconn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "C##DBTEST",
			"dbgood");
	Statement stmt = dbconn.createStatement();
	ResultSet myResultSet = stmt.executeQuery("SELECT * FROM ARTIST ORDER BY ID ASC");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	앨범 추가
	<br>
	<form action="ProcessingAlbum.jsp" name="아티스트 추가폼" method="post"
		accept-charset="utf-8" onsubmit="document.charset='utf-8';">
		<!-- 이름  데뷔년도  ID -->
		<!-- NAME  DEBUTYEAR  ID -->
		앨범 이름 :<input type="text" name="ALBUMNAME" size="20"><br>
		발매 년도 : <input type="text" name="RELEASEYEAR" size="20"><br>
		아티스트 <br>
		<%
			if (myResultSet != null) {
				//아티스트 이름을 전부 호출한다.
				while (myResultSet.next()) {
		%>
		<input type="radio" name="album" value=<%=myResultSet.getInt("ID")%>
			checked="checked"><%=myResultSet.getString("NAME")%><br>
		<%
			}
			}
		%>
		기획사 : <input type="text" name="PLANNINGCOMPANY" size="20"><br>
		<input type='submit' value="저장">
	</form>
	<table cellpadding="0" cellspacing="0" width="400" height="23"
		style="margin-left: auto; margin-right: auto; text-align: center;">
		<tr>
			<td width="1350">
				<p align="right">
					<b><a href="Album.jsp"> <font size="2" face="돋움체"
							color="black">뒤로 가기</font></a></b>
				</p>
			</td>
		</tr>
	</table>
</body>
</html>