<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("utf-8");
//     String nm = request.getParameter("dataNm"); // get
    String nm = request.getParameter("key"); // post
%>

넘어온 데이터 : <%=nm%>