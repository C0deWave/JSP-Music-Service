<%@ page import="java.sql.*" contentType="text/html;charset=EUC-KR"%>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	/* 11g express edition�� orcl ��� XE�� �Է��Ѵ�. */
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
	�ٹ� ����
	<br>
	<form action="ModiAlbumProcessing.jsp" name="��Ƽ��Ʈ �߰���" method="post"
		accept-charset="utf-8" onsubmit="document.charset='utf-8';">
		<!-- �̸�  ���߳⵵  ID -->
		<!-- NAME  DEBUTYEAR  ID -->
		�ٹ� �̸� :<input type="text" name="ALBUMNAME"
			value="<%=myResultSet.getString("NAME")%>" size="20"><br>
		�߸� �⵵ : <input type="text" name="RELEASEYEAR"
			value="<%=myResultSet.getInt("RELEASEYEAR")%>" size="20"><br>
		��ȹ�� : <input type="text" name="PLANNINGCOMPANY"
			value="<%=myResultSet.getString("PLANNINGCOMPANY")%>" size="20"><br>
		��Ƽ��Ʈ <br>
		<%
			myResultSet = stmt.executeQuery("SELECT * FROM ARTIST ORDER BY ID ASC");
			if (myResultSet != null) {
				while (myResultSet.next()) {
		%>
		<input type="radio" name="album" value=<%=myResultSet.getInt("ID")%>
			<%//��Ƽ��Ʈ�� ��� ������ �⺻ üũ�� ��Ų��.
					if (artistId == myResultSet.getInt("ID"))
						out.print("checked='checked'");%>><%=myResultSet.getString("NAME")%><br>
		<%
			}
			}
		%>
		<input hidden="true" type="text" name="ALBUMID" value="<%=idNum%>">
		<input type='submit' value="����">
	</form>
	</table>
	<table cellpadding="0" cellspacing="0" width="400" height="23"
		style="margin-left: auto; margin-right: auto; text-align: center;">
		<tr>
			<td>
				<p align="right">
					<span style="font-size: 9pt;"> <a href="../Album.jsp"> <font
							color="black">�ڷ� ����</font></a></span>
				</p>
			</td>
		</tr>
	</table>
</body>
</html>