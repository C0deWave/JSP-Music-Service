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
		//파일 저장하기
		MultipartRequest multi = null;
		int sizeLimit = 100 * 1024 * 1024; // 10MB 크기 제한
		String savePath = "C:\\Users\\jamg1\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\JulonMusic\\image";
		String savePath2 = request.getRealPath("\\image");
		// 저장 경로 설정
		String fileName1 = null;
		String fileType = "";
		System.out.println("savePath : " + savePath);
		int id = 100000;

		try {
			multi = new MultipartRequest(request, savePath2, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
			id = Integer.parseInt(multi.getParameter("ID"));
			Enumeration files = multi.getFileNames();
			String file1 = (String) files.nextElement();
			out.println("저장위치 : " + file1 + "<br>");
			out.println(savePath2);
			fileName1 = multi.getFilesystemName(file1);

			//파일 타입 가져오기
			fileType = multi.getContentType(file1);
			out.println("파일 타입:" + fileType + "<br>");
			out.println("저장된 이름 : " + savePath2 + "\\" + String.valueOf(id) + fileType);

			//파일이 이미 존재 할 경우에는 파일을 삭제한다.
			File deleteFile = new File(savePath2 + "\\" + String.valueOf(id) + ".gif");
			if (deleteFile.exists()) {
				deleteFile.delete();
			}

			//파일 이름 변경하기
			File oldFile = new File(savePath2 + "\\" + fileName1);
			File newFile = new File(savePath2 + "\\" + String.valueOf(id) + ".gif");
			oldFile.renameTo(newFile);

			// 업로드
		} catch (Exception e) {
			e.printStackTrace();
			// 예외처리
		}
		id = Integer.parseInt(multi.getParameter("ID"));
	%>


	<%
		//DB에 등록하기
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		/* 11g express edition은 orcl 대신 XE를 입력한다. */
		Connection dbconn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "C##DBTEST",
				"dbgood");
		Statement stmt = dbconn.createStatement();

		stmt.executeUpdate(
				"UPDATE ALBUM SET FILENAME = '" + String.valueOf(id) + ".gif" + "' WHERE " + id + " = ID");
	
		stmt.close();
		dbconn.close();
	%>
	이미지를 등록했습니다.
	<table cellpadding="0" cellspacing="0" width="400" height="23"
		style="margin-left: auto; margin-right: auto; text-align: center;">
		<tr>
			<td width="1350">
				<p align="right">
					<b><a href="../Album.jsp"> <font size="2" face="돋움체"
							color="black">앨범 목록으로</font></a></b>
				</p>
			</td>
		</tr>
	</table>
</body>
</html>