<%@ page import="java.sql.*" contentType="text/html;charset=EUC-KR"%>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	/* 11g express edition은 orcl 대신 XE를 입력한다. */
	Connection dbconn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "C##DBTEST",
			"dbgood");
	Statement stmt = dbconn.createStatement();
	String W_ALBUMID = request.getParameter("W_ALBUMID");
	ResultSet myResultSet = stmt.executeQuery(
			"SELECT MUSIC.ID,MUSIC.NAME,MUSIC.LIKES,MUSIC.GENRE,ALBUM.NAME AS ALBUMNAME,ARTIST.NAME AS ARTISTNAME"
					+ " FROM MUSIC,ALBUM,ARTIST "
					+ "WHERE ARTIST.ID = MUSIC.ARTISTID AND MUSIC.ALBUMID = ALBUM.ID AND MUSIC.ALBUMID='"
					+ W_ALBUMID + "'");
	//우선은 가져올 음악이 있는지 확인을 합니다.
	if (myResultSet.next()) {
		//myResultSet.next();
%>
<html>

<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<title>** MUSIC VIEW **</title>
</head>

<body bgcolor="white" text="black" link="blue" vlink="purple"
	alink="red">
	<p align="center">
		앨범명 :
		<%=myResultSet.getString("ALBUMNAME")%>
		<br> 가수 :
		<%=myResultSet.getString("ARTISTNAME")%>
	</p>
	<table border="1" cellspacing="0" width="400" bordercolor="#9AD2F7"
		bordercolordark="white" bordercolorlight="#B9E0FA"
		style="margin-left: auto; margin-right: auto; text-align: center;">
		<tr>
			<td width="150" height="20" bgcolor="#D2E9F9">
				<p align="center">
					<span style="font-size: 8pt;"><b>노래 제목</b></span>
				</p>
			</td>
			<td width="150" height="20" bgcolor="#D2E9F9">
				<p align="center">
					<span style="font-size: 8pt;"><b>장르</b></span>
				</p>
			</td>
			<td width="50" height="20" bgcolor="#D2E9F9">
				<p align="center">
					<span style="font-size: 8pt;"><b>들은 횟수</b></span>
				</p>
			</td>
			<td width="50" height="20" bgcolor="#D2E9F9">
				<p align="center">
					<span style="font-size: 8pt;"><b>수정</b></span>
				</p>
			</td>
			<td width="50" height="20" bgcolor="#D2E9F9">
				<p align="center">
					<span style="font-size: 8pt;"><b>삭제</b></span>
				</p>
			</td>
		</tr>
		<%
			//음악 리스트를 불러옵니다.
				if (myResultSet != null) {
					do {
						String W_MUSICID = myResultSet.getString("ID");
						String W_MUSICNAME = myResultSet.getString("NAME");
						String W_GENRE = myResultSet.getString("GENRE");
						String W_LIKES = myResultSet.getString("LIKES");
		%>
		<tr>
			<td width="150" height="23">
				<p align="center">
					<a href="Music.jsp?W_MUSICID=<%=W_MUSICID%>"> <span
						style="font-size: 9pt;"><%=W_MUSICNAME%></span></a>
				</p>
			</td>
			<td width="150" height="23">
				<p align="center">
					<span style="font-size: 9pt;"><%=W_GENRE%></span>
				</p>
			</td>
			<td width="150" height="23">
				<p align="center">
					<span style="font-size: 9pt;"><%=W_LIKES%></span>
				</p>
			</td>
			<td width="150" height="23">
				<p align="center">
					<span style="font-size: 9pt;"> <a
						href="./Modify/ModifyMusic.jsp?ID=<%=W_MUSICID%>">수정</a></span>
				</p>
			</td>
			<td width="150" height="23">
				<p align="center">
					<span style="font-size: 9pt;"> <a
						href="./delete/deleteMusic.jsp?ID=<%=W_MUSICID%>">삭제</a></span>
				</p>
			</td>
		</tr>
		<%
			} while (myResultSet.next());
				}
				//DB연동을 종료합니다.
				stmt.close();
				dbconn.close();
		%>
	</table>

	<table cellpadding="0" cellspacing="0" width="400" height="23"
		style="margin-left: auto; margin-right: auto; text-align: center;">
		<tr>
			<td width="150">
				<p align="right">
					<span style="font-size: 9pt;"> <a href="Album.jsp?"> <font
							color="black">앨범 목록</font></a></span>
				</p>
			</td>
		</tr>
	</table>
	<%
		//노래가 없을 경우에 노래가 없다고 출력합니다.
		} else {
			out.print("노래가 없음");
		}
		stmt.close();
		dbconn.close();
	%>
</body>
</html>
