<%@ page import="java.sql.*" contentType="text/html;charset=EUC-KR"%>
<%
	//DB �����ϴ� �κ�
	Class.forName("oracle.jdbc.driver.OracleDriver");
	/* 11g express edition�� orcl ��� XE�� �Է��Ѵ�. */
	// Connection dbconn=DriverManager.getConnection("jdbc:oracle:thin:@172.16.35.194:1521:orcl", "C##DBTEST", "dbgood");
	Connection dbconn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "C##DBTEST",
			"dbgood");
	Statement stmt = dbconn.createStatement();
	ResultSet myResultSet = stmt.executeQuery(
			"SELECT ALBUM.ID,ALBUM.NAME,ALBUM.RELEASEYEAR,ALBUM.PLANNINGCOMPANY,ARTIST.NAME AS ARTIST FROM ALBUM,ARTIST WHERE ALBUM.ARTISTID = ARTIST.ID ORDER BY ID ASC");
%>
<html>

<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<title>** Music LIST **</title>
</head>

<body bgcolor="white" text="black" link="blue" vlink="purple"
	alink="red">
	<p align="center">
		<font size="5" face="����ü" color="black">���� ��� ���� ������</font>
	</p>
	<table border="1" cellspacing="0" width="400" bordercolor="#9AD2F7"
		bordercolordark="white" bordercolorlight="#B9E0FA"
		style="margin-left: auto; margin-right: auto; text-align: center;">
		<tr>
			<td width"WebContent/image"="150" height="20" bgcolor="#D2E9F9">
				<p align="center">
					<span style="font-size: 8pt;"><b>�ٹ���</b></span>
				</p>
			</td>
			<td width="150" height="20" bgcolor="#D2E9F9">
				<p align="center">
					<span style="font-size: 8pt;"><b>��Ƽ��Ʈ</b></span>
				</p>
			</td>
			<td width="50" height="20" bgcolor="#D2E9F9">
				<p align="center">
					<span style="font-size: 8pt;"><b>��ó⵵</b></span>
				</p>
			</td>
			<td width="50" height="20" bgcolor="#D2E9F9">
				<p align="center">
					<span style="font-size: 8pt;"><b>��ȹ��</b></span>
				</p>
			</td>
			<td width="50" height="20" bgcolor="#D2E9F9">
				<p align="center">
					<span style="font-size: 8pt;"><b>����</b></span>
				</p>
			</td>
			<td width="50" height="20" bgcolor="#D2E9F9">
				<p align="center">
					<span style="font-size: 8pt;"><b>����</b></span>
				</p>
			</td>
		</tr>
		<%
			//DB���� ���̺� ���� �����ͼ� ���̺� �Ҵ��Ѵ�.
			if (myResultSet != null) {
				while (myResultSet.next()) {
					String W_ALBUMID = myResultSet.getString("ID");
					String W_ARTISTNAME = myResultSet.getString("ARTIST");
					String W_ALBUMNAME = myResultSet.getString("NAME");
					String W_RELEASEYEAR = myResultSet.getString("RELEASEYEAR");
					String W_PLANNINGCOMPANY = myResultSet.getString("PLANNINGCOMPANY");
		%>
		<tr>
			<td width="250" height="20">
				<p>
					<span style="font-size: 9pt;"> <a
						href="Albumlist.jsp?W_ALBUMID=<%=W_ALBUMID%>"> <font
							face="����ü" color="black"> <%=W_ALBUMNAME%></font></a></span>
				</p>
			</td>
			<td width="150" height="20">
				<p>
					<span style="font-size: 9pt;"> <font face="����ü"
						color="black"> <%=W_ARTISTNAME%></font></a></span>
				</p>
			</td>
			<td width="150" height="20">
				<p align="center">
					<span style="font-size: 9pt;"> <font face="����ü"><%=W_RELEASEYEAR%></font></span>
				</p>
			</td>
			<td width="150" height="20">
				<p align="center">
					<span style="font-size: 9pt;"> <font face="����ü"><%=W_PLANNINGCOMPANY%></font></span>
				</p>
			</td>
			<td width="150" height="20">
				<p align="center">
					<span style="font-size: 9pt;"> <a
						href="./Modify/ModifyAlbum.jsp?ID=<%=W_ALBUMID%>"> <font
							face="����ü">����</font></a></span>
				</p>
			</td>
			<td width="150" height="20">
				<p align="center">
					<span style="font-size: 9pt;"> <a
						href="./delete/deleteAlbum.jsp?ID=<%=W_ALBUMID%>"> <font
							face="����ü">����</font></a></span>
				</p>
			</td>
		</tr>
		<%
			}
			}
			//DB�� �ݴ´�.
			stmt.close();
			dbconn.close();
		%>
	</table>
	<table cellpadding="0" cellspacing="0" width="400" height="23"
		style="margin-left: auto; margin-right: auto; text-align: center;">
		<tr>
			<td width="1350">
				<p align="right">
					<b><a href="Album.jsp"> <font size="1" face="����ü"
							color="black">LIST</font></a></b>
				</p>
			</td>
		</tr>
	</table>
	<p align="center">
		<iframe src="Olap1.jsp" width="500" height="500" name="olap"
			frameborder=0 framespacing=0 marginheight=0 marginwidth=0
			scrolling=no vspace=0 style="margin-right: auto; margin-left: auto;">
		</iframe>
		<iframe src="Olap2.jsp" width="500" height="500" name="olap"
			frameborder=0 framespacing=0 marginheight=0 marginwidth=0
			scrolling=no vspace=0 style="margin-right: auto; margin-left: auto;">
		</iframe>
	</p>
	<hr>
	<p align="center">
		<font size="5" face="����ü" color="black">������ ������</font>
	</p>

	<p align="center">
		<a href="AddArtist.jsp"> <font size="3" face="����ü" color="black">��Ƽ��Ʈ
				�߰�</font></a>
	</p>

	<p align="center">
		<a href="AddAlbum.jsp"> <font size="3" face="����ü" color="black">�ٹ�
				�߰�(��Ƽ��Ʈ�� �־�� ��)</font></a>
	</p>

	<p align="center">
		<a href="AddMusic.jsp"> <font size="3" face="����ü" color="black">����
				�߰�(�ٹ��� ������ ���ƾ� ��)</font></a>
	</p>

</body>
</html>