<%@ page import="java.sql.*" contentType="text/html;charset=EUC-KR"%>
<%
	//���� �߰����̴�.
	//ID�� �ڵ����� �Ҵ��ϱ� ���ؼ� DB�������Ѵ�.
	Class.forName("oracle.jdbc.driver.OracleDriver");
	/* 11g express edition�� orcl ��� XE�� �Է��Ѵ�. */
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
	���� �߰�
	<br>
	<form action="ProcessingMusic.jsp" name="���� �߰���" method="post"
		accept-charset="utf-8" onsubmit="document.charset='utf-8';">

		<!-- �̸�  ���߳⵵  ID -->
		<!-- MUSICNAME  GENRE  ID -->
		�뷡 ���� :<input type="text" name="MUSICNAME" size="20"><br>
		�帣 : <input type="text" name="GENRE" size="20"><br> <br>
		<br> �ٹ� <br>
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
		<br> <input type='submit' value="����">
	</form>
	<table cellpadding="0" cellspacing="0" width="400" height="23"
		style="margin-left: auto; margin-right: auto; text-align: center;">
		<tr>
			<td width="1350">
				<p align="right">
					<b><a href="Album.jsp"> <font size="2" face="����ü"
							color="black">�ڷΰ���</font></a></b>
				</p>
			</td>
		</tr>
	</table>
</body>
</html>