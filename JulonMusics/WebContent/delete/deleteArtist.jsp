<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@page import="java.io.File"%>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@localhost:1521:orcl"; 
		/* 11g express edition�� orcl ��� XE�� �Է��Ѵ�. */
 Connection dbconn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "C##DBTEST", "dbgood");
  Statement stmt = dbconn.createStatement();
  String ARTISTID=request.getParameter("ID");
  ResultSet myResultSet=stmt.executeQuery("SELECT * FROM ALBUM WHERE ID ="+ARTISTID+"");
  myResultSet.next();
  try{
  	stmt.execute("DELETE ARTIST WHERE ID ="+ARTISTID+"");
	  out.print("��Ƽ��Ʈ�� �����߽��ϴ�.<br>");
	  
  }catch(SQLException e){
	  out.print("�ش� ��Ƽ��Ʈ�� �����ϴ� �ٹ� �ֽ��ϴ�.<br>");
	  out.print("��Ƽ��Ʈ�� ������ �� �����ϴ�..<br>");
  }
  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table cellpadding="0" cellspacing="0" width="400" height="23"
		style="margin-left: auto; margin-right: auto; text-align: center;">
		<tr>
			<td width="150">
				<p align="right">
					<span style="font-size: 9pt;"> <a href="../Album.jsp?">
							<font color="black">�ٹ� ���</font>
					</a></span>
				</p>
			</td>
		</tr>
	</table>
</body>
</html>