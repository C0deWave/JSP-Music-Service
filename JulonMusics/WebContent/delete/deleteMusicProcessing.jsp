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
  String MUSICID=request.getParameter("ID");
  stmt.execute("DELETE MUSIC WHERE ID ="+MUSICID+"");
  
  String savePath = "C:\\Users\\jamg1\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\JulonMusics\\music";
	File deleteFile = new File(savePath +"\\"+ MUSICID+".mp3");
	if(deleteFile.exists()){
		deleteFile.delete();
	}else{
		out.print("���� ����");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	������ �Ϸ� �Ǿ����ϴ�.
	<br>
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