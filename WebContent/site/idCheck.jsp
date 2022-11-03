<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String uId = request.getParameter("userId");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "LHJ93", "java");
	Statement stmt = conn.createStatement();
	String sql = "select mem_id from member where mem_id ='" + uId + "'";
	ResultSet rs = stmt.executeQuery(sql);


	if(rs.next()){
		// 결과가 조회되었을 때 id사용불가
%>
		{"code" : "no", "msg" : "사용불가"}
<%
	}else{
		// 결과가 조회되지 않았을 때 id사용가능		
%>
		{"code" : "ok", "msg" : "사용가능"}
<%
	}
%>