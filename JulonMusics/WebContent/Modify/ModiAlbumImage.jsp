<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		//���� �����ϱ�
		MultipartRequest multi = null;
		int sizeLimit = 100 * 1024 * 1024; // 10MB ũ�� ����
		String savePath = "C:\\Users\\jamg1\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\JulonMusic\\image";
		String savePath2 = request.getRealPath("\\image");
		// ���� ��� ����
		String fileName1 = null;
		String fileType = "";
		System.out.println("savePath : " + savePath);
		int id = 100000;

		try {
			multi = new MultipartRequest(request, savePath2, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
			id = Integer.parseInt(multi.getParameter("ID"));
			Enumeration files = multi.getFileNames();
			String file1 = (String) files.nextElement();
			out.println("������ġ : " + file1 + "<br>");
			out.println(savePath2);
			fileName1 = multi.getFilesystemName(file1);

			//���� Ÿ�� ��������
			fileType = multi.getContentType(file1);
			out.println("���� Ÿ��:" + fileType + "<br>");
			out.println("����� �̸� : " + savePath2 + "\\" + String.valueOf(id) + fileType);

			//������ �̹� ���� �� ��쿡�� ������ �����Ѵ�.
			File deleteFile = new File(savePath2 + "\\" + String.valueOf(id) + ".gif");
			if (deleteFile.exists()) {
				deleteFile.delete();
			}

			//���� �̸� �����ϱ�
			File oldFile = new File(savePath2 + "\\" + fileName1);
			File newFile = new File(savePath2 + "\\" + String.valueOf(id) + ".gif");
			oldFile.renameTo(newFile);

			// ���ε�
		} catch (Exception e) {
			e.printStackTrace();
			// ����ó��
		}
		id = Integer.parseInt(multi.getParameter("ID"));
	%>


	<%
		//DB�� ����ϱ�
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		/* 11g express edition�� orcl ��� XE�� �Է��Ѵ�. */
		Connection dbconn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "C##DBTEST",
				"dbgood");
		Statement stmt = dbconn.createStatement();

		stmt.executeUpdate(
				"UPDATE ALBUM SET FILENAME = '" + String.valueOf(id) + ".gif" + "' WHERE " + id + " = ID");
	
		stmt.close();
		dbconn.close();
	%>
	�̹����� ����߽��ϴ�.
	<table cellpadding="0" cellspacing="0" width="400" height="23"
		style="margin-left: auto; margin-right: auto; text-align: center;">
		<tr>
			<td width="1350">
				<p align="right">
					<b><a href="../Album.jsp"> <font size="2" face="����ü"
							color="black">�ٹ� �������</font></a></b>
				</p>
			</td>
		</tr>
	</table>
</body>
</html>