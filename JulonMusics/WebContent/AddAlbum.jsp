<%@ page import="java.sql.*" contentType="text/html;charset=EUC-KR"%>
<%
	//DB���� �κ�
	Class.forName("oracle.jdbc.driver.OracleDriver");
	/* 11g express edition�� orcl ��� XE�� �Է��Ѵ�. */
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
	�ٹ� �߰�
	<br>
	<form action="ProcessingAlbum.jsp" name="��Ƽ��Ʈ �߰���" method="post"
		accept-charset="utf-8" onsubmit="document.charset='utf-8';">
		<!-- �̸�  ���߳⵵  ID -->
		<!-- NAME  DEBUTYEAR  ID -->
		�ٹ� �̸� :<input type="text" name="ALBUMNAME" size="20"><br>
		�߸� �⵵ : <input type="text" name="RELEASEYEAR" size="20"><br>
		��Ƽ��Ʈ <br>
		<%
			if (myResultSet != null) {
				//��Ƽ��Ʈ �̸��� ���� ȣ���Ѵ�.
				while (myResultSet.next()) {
		%>
		<input type="radio" name="album" value=<%=myResultSet.getInt("ID")%>
			checked="checked"><%=myResultSet.getString("NAME")%><br>
		<%
			}
			}
		%>
		��ȹ�� : <input type="text" name="PLANNINGCOMPANY" size="20"><br>
		<input type='submit' value="����">
	</form>
	<table cellpadding="0" cellspacing="0" width="400" height="23"
		style="margin-left: auto; margin-right: auto; text-align: center;">
		<tr>
			<td width="1350">
				<p align="right">
					<b><a href="Album.jsp"> <font size="2" face="����ü"
							color="black">�ڷ� ����</font></a></b>
				</p>
			</td>
		</tr>
	</table>
</body>
</html>