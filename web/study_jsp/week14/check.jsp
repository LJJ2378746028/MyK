<%--
  Created by IntelliJ IDEA.
  User: ljj
  Date: 2024/12/1
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.bean.ConnDB" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>登录验证</title>
</head>
<body>
<%
    String username = request.getParameter("uname");
    String password = request.getParameter("upwd");

    ConnDB connDB = new ConnDB();
    String sql = "SELECT * FROM user WHERE username = ? AND password = ?";
    ResultSet rs = null;

    try {
        rs = connDB.doPreparedQuery(sql, username, password);
        if (rs.next()) {
%>
<h2>登录成功，欢迎您！<%= username %>
</h2>
<%
} else {
%>
<h2>登录失败，请重试。</h2>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            connDB.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
</body>
</html>
