<%@ page import="java.sql.*" contentType="text/html;charset=EUC-KR"%>
<html>

<head>
<%
	//DB연동 부분
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	/* 11g express edition은 orcl 대신 XE를 입력한다. */
	Connection dbconn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "C##DBTEST",
			"dbgood");
	Statement stmt = dbconn.createStatement();
	String W_MUSICID = request.getParameter("W_MUSICID");
%>

<%
	//음악 스트리밍 수를 1추가해 줍니다.
	stmt.executeUpdate("UPDATE MUSIC SET LIKES = LIKES + 1 WHERE " + W_MUSICID + " = ID");

	ResultSet myResultSet = stmt.executeQuery(
			"SELECT MUSIC.FILENAME AS MFILE,ALBUM.FILENAME AS AFILE, MUSIC.NAME AS MUSICNAME, ARTIST.NAME AS ARTISTNAME, MUSIC.GENRE, MUSIC.LIKES ,ALBUM.PLANNINGCOMPANY,ALBUM.ID AS ALBUMID FROM MUSIC,ALBUM,ARTIST WHERE ARTIST.ID = MUSIC.ARTISTID AND MUSIC.ALBUMID = ALBUM.ID AND MUSIC.ID='"
					+ W_MUSICID + "'");
	if (myResultSet != null) {
		myResultSet.next();
		String musicFilePosition = "./music/" + myResultSet.getString("MFILE");
%>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<title>** Listen Music **</title>
</head>
<body bgcolor="white" text="black" link="blue" vlink="purple"
	alink="red">
	<p align="center">
		<img alt="이미지가 없습니다."
			src="./image/<%=myResultSet.getString("AFILE")%>" width="400">
		</br>
		<audio autoplay controls>
			<source src=<%=musicFilePosition%> type="audio/mp3">
		</audio>
	<form>
		<input type="button" id="#id02" value="좋아요"
			style="align-content: center;">
	</form>
	</p>

	<table border="1" cellspacing="0" width="400" bordercolor="#9AD2F7"
		bordercolordark="white" bordercolorlight="#B9E0FA"
		style="margin-left: auto; margin-right: auto; text-align: center;">
		<tr>
			<td width="150" height="23">
				<p align="center">
					<span style="font-size: 9pt;">음 악 명</span>
				</p>
			</td>
			<td width="513">
				<p>
					<span style="font-size: 9pt;"> <%=myResultSet.getString("MUSICNAME")%></span>
				</p>
			</td>
		</tr>
		<tr>
			<td width="150" height="23">
				<p align="center">
					<span style="font-size: 9pt;">아티스트</span>
				</p>
			</td>
			<td width="513">
				<p>
					<span style="font-size: 9pt;"> <%=myResultSet.getString("ARTISTNAME")%></span>
				</p>
			</td>
		</tr>
		<tr>
			<td width="150" height="23">
				<p align="center">
					<span style="font-size: 9pt;">장 르</span>
				</p>
			</td>
			<td width="513">
				<p>
					<span style="font-size: 9pt;"> <%=myResultSet.getString("GENRE")%></span>
				</p>
			</td>
		</tr>
		<tr>
			<td width="150" height="23">
				<p align="center">
					<span style="font-size: 9pt;">들은 횟수</span>
				</p>
			</td>
			<td width="513">
				<p>
					<span style="font-size: 9pt;"> <%=myResultSet.getString("LIKES")%>
					</span>
				</p>
			</td>
		</tr>
		<tr>
			<td width="150" height="23">
				<p align="center">
					<span style="font-size: 9pt;">기 획 사</span>
				</p>
			</td>
			<td width="513">
				<p>
					<span style="font-size: 9pt;"> <%=myResultSet.getString("PLANNINGCOMPANY")%></span>
				</p>
			</td>
		</tr>
	</table>
	<table cellpadding="0" cellspacing="0" width="400" height="23"
		style="margin-left: auto; margin-right: auto; text-align: center;">
		<tr>
			<td width="150">
				<p align="right">
					<span style="font-size: 9pt;"> <a
						href="Albumlist.jsp?W_ALBUMID=<%=myResultSet.getString("ALBUMID")%>">
							<font color="black">음악 리스트</font>
					</a></span>
				</p>
			</td>
		</tr>
	</table>
	<table cellpadding="0" cellspacing="0" width="400" height="23"
		style="margin-left: auto; margin-right: auto; text-align: center;">
		<tr>
			<td>
				<p align="right">
					<span style="font-size: 9pt;"> <a href="Album.jsp"> <font
							color="black">앨범 리스트</font></a></span>
				</p>
			</td>
		</tr>
	</table>
	<%
		}
		stmt.close();
		dbconn.close();
	%>
</body>
</html>
