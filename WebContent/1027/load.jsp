<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

	String uId = request.getParameter("userId");
	String uPw = request.getParameter("userPw");

	// JDBC�� ����ؼ� DB���� ��������
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "LHJ93", "java");
	Statement stmt = conn.createStatement();
	String sql = "select mem_id from member where mem_id = '" + uId + "' and mem_pass = '" + uPw + "'";
	stmt.executeQuery(sql);

	ResultSet rs = stmt.executeQuery(sql);
	
	//System.out.print(rs.next()); // boolean ������ ���� ������ Ȯ��
	
	if(rs.next()){
%>
		{"rst" : "ok"}
<%
	}else{
%>
		{"rst" : "fail"}		
<%
	}
%>