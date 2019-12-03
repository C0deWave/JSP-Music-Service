<%@ page import="java.sql.*"%>
<%@ page contentType="image/jpeg;charset=utf-8"%>
<%@ page import="org.jfree.data.general.DefaultPieDataset"%>
<%@ page import="org.jfree.chart.JFreeChart"%>
<%@ page import="org.jfree.chart.ChartFactory"%>
<%@ page import="org.jfree.chart.ChartUtilities"%>
<%
	//DB를 연동합니다.
	Class.forName("oracle.jdbc.driver.OracleDriver");
	/* 11g express edition은 orcl 대신 XE를 입력한다. */
	// Connection dbconn=DriverManager.getConnection("jdbc:oracle:thin:@172.16.35.194:1521:orcl", "C##DBTEST", "dbgood");
	Connection dbconn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "C##DBTEST",
			"dbgood");
	Statement stmt = dbconn.createStatement();
	ResultSet myResultSet = stmt.executeQuery("SELECT MUSIC.NAME,MUSIC.LIKES FROM MUSIC ORDER BY LIKES DESC");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
		//JFreeChart를 불러와서 데이터 값을 추가해 줍니다.
		DefaultPieDataset dataset = new DefaultPieDataset();
		int i = 0;
		while (myResultSet.next() && i < 3) {
			i++;
			String W_ALBUMID = myResultSet.getString("NAME");
			String W_LIKES = myResultSet.getString("LIKES");
			dataset.setValue(W_ALBUMID, new Double(Double.parseDouble(W_LIKES)));
		}
		JFreeChart chart = ChartFactory.createPieChart("Music PlayCount Top3", dataset, true, true,
				java.util.Locale.getDefault());
		ServletOutputStream outStream = response.getOutputStream();
		ChartUtilities.writeChartAsJPEG(outStream, chart, 500, 500);
		outStream.close();
		stmt.close();
		dbconn.close();
	%>
</body>
</html>