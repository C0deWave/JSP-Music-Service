<%@ page import="java.sql.*"%>
<%@ page contentType="image/jpeg;charset=utf-8"%>
<%@ page import="org.jfree.data.general.DefaultPieDataset"%>
<%@ page import="org.jfree.chart.JFreeChart"%>
<%@ page import="org.jfree.chart.ChartFactory"%>
<%@ page import="org.jfree.chart.ChartUtilities"%>
<%@ page import="java.io.*"%>
<%@ page import="org.jfree.chart.plot.PlotOrientation"%>
<%@ page import="org.jfree.data.*"%>
<%@ page import="org.jfree.data.jdbc.JDBCCategoryDataset"%>

<%
	//DB를 연동합니다.
	Class.forName("oracle.jdbc.driver.OracleDriver");
	/* 11g express edition은 orcl 대신 XE를 입력한다. */
	// Connection dbconn=DriverManager.getConnection("jdbc:oracle:thin:@172.16.35.194:1521:orcl", "C##DBTEST", "dbgood");
	Connection dbconn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "C##DBTEST",
			"dbgood");
	Statement stmt = dbconn.createStatement();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
		String query = "SELECT ALBUM.NAME,SUM(MUSIC.LIKES) as score from ALBUM,MUSIC WHERE ALBUM.ID = MUSIC.ALBUMID GROUP BY ALBUM.NAME ORDER BY MAX(ALBUM.ID) ASC";
		JDBCCategoryDataset dataset = new JDBCCategoryDataset("jdbc:oracle:thin:@localhost:1521:orcl",
				"oracle.jdbc.driver.OracleDriver", "C##DBTEST", "dbgood");

		dataset.executeQuery(query);
		JFreeChart chart = ChartFactory.createBarChart3D("Streming Score", "Album", "Streming", dataset, PlotOrientation.VERTICAL,
				true, true, false);
		try {
			ServletOutputStream outStream = response.getOutputStream();
			ChartUtilities.writeChartAsJPEG(outStream, chart, 500, 500);
		} catch (IOException e) {
			System.out.println("Problem in creating chart.");
		}
	%>
</body>
</html>