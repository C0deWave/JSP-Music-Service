<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	/* 11g express edition�� orcl ��� XE�� �Է��Ѵ�. */
	// Connection dbconn=DriverManager.getConnection("jdbc:oracle:thin:@172.16.35.194:1521:orcl", "C##DBTEST", "dbgood");
	Connection dbconn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "C##DBTEST",
			"dbgood");
	Statement stmt = dbconn.createStatement();
	ResultSet myResultSet = stmt.executeQuery("SELECT NAME,DEBUTYEAR,ID FROM ARTIST ORDER BY ID ASC");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	���񽺿� �����ϴ� ��Ƽ��Ʈ
	<br>
	<table border="1" cellspacing="0" width="400" bordercolor="#9AD2F7"
		bordercolordark="white" bordercolorlight="#B9E0FA"
		style="margin-left: auto; margin-right: auto; text-align: center;">
		<tr>
			<td width"WebContent/image"="150" height="20" bgcolor="#D2E9F9">
				<p align="center">
					<span style="font-size: 8pt;"><b>��Ƽ��Ʈ��</b></span>
				</p>
			</td>
			<td width="50" height="20" bgcolor="#D2E9F9">
				<p align="center">
					<span style="font-size: 8pt;"><b>���߳⵵</b></span>
				</p>
			</td>
			<td width="50" height="20" bgcolor="#D2E9F9">
				<p align="center">
					<span style="font-size: 8pt;"><b>����</b></span>
				</p>
			</td>
		</tr>
		<%
		//�����ϴ� ��Ƽ��Ʈ�� ����� �ҷ����� ������ �Ѵ�.
			if (myResultSet != null) {
				while (myResultSet.next()) {
					String W_ARTISTNAME = myResultSet.getString("NAME");
					String W_DEBUTYEAR = myResultSet.getString("DEBUTYEAR");
					String W_ARTISTID = myResultSet.getString("ID");
		%>
		<tr>
			<td width="150" height="20">
				<p>
					<span style="font-size: 9pt;"> <font face="����ü"
						color="black"> <%=W_ARTISTNAME%></font></a></span>
				</p>
			</td>
			<td width="150" height="20">
				<p align="center">
					<span style="font-size: 9pt;"> <font face="����ü"><%=W_DEBUTYEAR%></font></span>
				</p>
			</td>
			<td width="150" height="20">
				<p align="center">
					<span style="font-size: 9pt;"> <a
						href="./delete/deleteArtist.jsp?ID=<%=W_ARTISTID%>"> <font
							face="����ü">����</font></a></span>
				</p>
			</td>
		</tr>
		<%
			}
			}
			stmt.close();
			dbconn.close();
		%>
	</table>

	��Ƽ��Ʈ �߰�
	<br>
	<form action="ProcessingArtist.jsp" name="��Ƽ��Ʈ �߰���" method="post"
		accept-charset="utf-8" onsubmit="document.charset='utf-8';">
		<!-- �̸�  ���߳⵵  ID -->
		<!-- NAME  DEBUTYEAR  ID -->
		�̸� :<input type="text" name="NAME" size="20"><br> ���� �⵵ :
		<input type="text" name="DEBUTYEAR" size="20"><br> <input
			type='submit' value="����">
	</form>


	<table cellpadding="0" cellspacing="0" width="400" height="23"
		style="margin-left: auto; margin-right: auto; text-align: center;">
		<tr>
			<td width="1350">
				<p align="right">
					<b><a href="Album.jsp"> <font size="2" face="����ü"
							color="black">�������</font></a></b>
				</p>
			</td>
		</tr>
	</table>
</body>
</html>