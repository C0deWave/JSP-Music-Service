<%@ page import="java.sql.*" contentType="text/html;charset=EUC-KR"%>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	/* 11g express edition은 orcl 대신 XE를 입력한다. */
	// Connection dbconn=DriverManager.getConnection("jdbc:oracle:thin:@172.16.35.194:1521:orcl", "C##DBTEST", "dbgood");
	Connection dbconn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "C##DBTEST",
			"dbgood");
	Statement stmt = dbconn.createStatement();
	ResultSet myResultSet = null;
	int idNum = Integer.parseInt(request.getParameter("ID"));
	myResultSet = stmt
			.executeQuery("SELECT NAME,RELEASEYEAR,PLANNINGCOMPANY,ARTISTID FROM ALBUM WHERE ID = " + idNum);
	myResultSet.next();
	int artistId = myResultSet.getInt("ARTISTID");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	앨범 수정
	<br>
	<form action="ModiAlbumProcessing.jsp" name="아티스트 추가폼" method="post"
		accept-charset="utf-8" onsubmit="document.charset='utf-8';">
		<!-- 이름  데뷔년도  ID -->
		<!-- NAME  DEBUTYEAR  ID -->
		앨범 이름 :<input type="text" name="ALBUMNAME"
			value="<%=myResultSet.getString("NAME")%>" size="20"><br>
		발매 년도 : <input type="text" name="RELEASEYEAR"
			value="<%=myResultSet.getInt("RELEASEYEAR")%>" size="20"><br>
		기획사 : <input type="text" name="PLANNINGCOMPANY"
			value="<%=myResultSet.getString("PLANNINGCOMPANY")%>" size="20"><br>
		아티스트 <br>
		<%
			myResultSet = stmt.executeQuery("SELECT * FROM ARTIST ORDER BY ID ASC");
			if (myResultSet != null) {
				while (myResultSet.next()) {
		%>
		<input type="radio" name="album" value=<%=myResultSet.getInt("ID")%>
			<%//아티스트의 경우 같으면 기본 체크를 시킨다.
					if (artistId == myResultSet.getInt("ID"))
						out.print("checked='checked'");%>><%=myResultSet.getString("NAME")%><br>
		<%
			}
			}
		%>
		<input hidden="true" type="text" name="ALBUMID" value="<%=idNum%>">
		<input type='submit' value="저장">
	</form>
	</table>
	<table cellpadding="0" cellspacing="0" width="400" height="23"
		style="margin-left: auto; margin-right: auto; text-align: center;">
		<tr>
			<td>
				<p align="right">
					<span style="font-size: 9pt;"> <a href="../Album.jsp"> <font
							color="black">뒤로 가기</font></a></span>
				</p>
			</td>
		</tr>
	</table>
</body>
</html>