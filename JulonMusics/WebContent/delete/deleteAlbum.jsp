<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	�ѹ� �����ϸ� ������ �� �����ϴ�.
	<br> �׷��� ���� �Ͻðڽ��ϱ�?
	<br> �ٹ��� ��� �뷡�� ���������� ������ ���� �ʽ��ϴ�.
	<br>

	<form action="deleteAlbumProcessing.jsp" name="���� ������" method="post"
		accept-charset="utf-8" onsubmit="document.charset='utf-8';">
		<input type="text" hidden="true" name="ID"
			value="<%=request.getParameter("ID")%>"> <input type='submit'
			value="����">
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