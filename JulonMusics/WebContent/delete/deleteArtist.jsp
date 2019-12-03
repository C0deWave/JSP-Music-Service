<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@page import="java.io.File"%>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@localhost:1521:orcl"; 
		/* 11g express edition은 orcl 대신 XE를 입력한다. */
 Connection dbconn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "C##DBTEST", "dbgood");
  Statement stmt = dbconn.createStatement();
  String ARTISTID=request.getParameter("ID");
  ResultSet myResultSet=stmt.executeQuery("SELECT * FROM ALBUM WHERE ID ="+ARTISTID+"");
  myResultSet.next();
  try{
  	stmt.execute("DELETE ARTIST WHERE ID ="+ARTISTID+"");
	  out.print("아티스트를 삭제했습니다.<br>");
	  
  }catch(SQLException e){
	  out.print("해당 아티스트를 참조하는 앨범 있습니다.<br>");
	  out.print("아티스트를 삭제할 수 없습니다..<br>");
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
							<font color="black">앨범 목록</font>
					</a></span>
				</p>
			</td>
		</tr>
	</table>
</body>
</html>