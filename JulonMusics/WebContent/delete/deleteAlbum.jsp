<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	한번 삭제하면 복구할 수 없습니다.
	<br> 그래도 삭제 하시겠습니까?
	<br> 앨범의 경우 노래가 남아있으면 삭제가 되지 않습니다.
	<br>

	<form action="deleteAlbumProcessing.jsp" name="음악 수정폼" method="post"
		accept-charset="utf-8" onsubmit="document.charset='utf-8';">
		<input type="text" hidden="true" name="ID"
			value="<%=request.getParameter("ID")%>"> <input type='submit'
			value="삭제">
	</form>
	</table>
	<table cellpadding="0" cellspacing="0" width="400" height="23"
		style="margin-left: auto; margin-right: auto; text-align: center;">
		<tr>
			<td>
				<p align="right">
					<span style="font-size: 9pt;"> <a href="../Album.jsp"> <font
							color="black">뒤로 가기</font></a></span>
				</p>
			</td>
		</tr>
	</table>
</body>
</html>