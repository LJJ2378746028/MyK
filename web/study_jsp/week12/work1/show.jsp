<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%--
  Created by IntelliJ IDEA.
  User: ljj
  Date: 2024/11/21
  Time: 20:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生信息管理系统</title>
</head>
<style>
    table {
        margin: 0 auto;
        border-collapse: collapse;
        text-align: center;
    }

    tr, td {
        border: 1px solid black;
    }
</style>
<body>
<h1 align="center">
    学生信息管理系统
</h1>
<%--查询--%>
<form action="inquire.jsp">
    <table>
        <tr>
            <td>
                <select name="searchField">
                    <option value="id" <% if ("id".equals(request.getParameter("searchField"))) { %>selected<% } %>>学号</option>
                    <option value="name" <% if ("name".equals(request.getParameter("searchField"))) { %>selected<% } %>>姓名</option>
                </select>
            </td>
            <td>
                请输入关键字：<input type="text" name="keyword" value="<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : "" %>">
                <input type="submit" value="搜索">
            </td>
        </tr>
    </table>
</form>
<table>
    <tr>
        <td>-学号-</td>
        <td>-姓名-</td>
        <td>-网名-</td>
        <td>-密码-</td>
        <td>-功能-</td>
    </tr>

    <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/test";
            String user = "root";
            String password = "QQ521...";
            Connection conn = DriverManager.getConnection(url, user, password);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from suser");

            while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getInt(1)%></td>
        <td><%= rs.getString(2)%></td>
        <td><%= rs.getString(3)%></td>
        <td><%= rs.getString(4)%></td>
        <td>
            <a href="edit.jsp?id=<%= rs.getInt(1) %>">修改</a>
            <a href="delete.jsp?id=<%= rs.getInt(1) %>">删除</a>
        </td>
    </tr>

    <% }

        rs.close(); //关闭数据库连接资源
        stmt.close();
        conn.close();

    } catch (Exception e) {
        out.print(e.getMessage());
    }
    %>
</table>
<%--    添加--%>
<form action="add.jsp" style="text-align: center;">
    <input type="submit" value="添加">
</form>
</body>
</html>
