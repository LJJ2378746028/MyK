<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%--
  Created by IntelliJ IDEA.
  User: ljj
  Date: 2024/11/22
  Time: 18:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查询结果</title>
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
<h1 align="center">查询结果</h1>

<%-- 查询结果表格 --%>
<table>
    <tr>
        <td>-学号-</td>
        <td>-姓名-</td>
        <td>-网名-</td>
        <td>-密码-</td>
        <td>-功能-</td>
    </tr>

    <%
        String searchField = request.getParameter("searchField"); // 获取查询字段
        String keyword = request.getParameter("keyword"); // 获取关键字

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/test";
            String user = "root";
            String password = "QQ521...";
            Connection conn = DriverManager.getConnection(url, user, password);

            // SQL 查询
            String sql = "SELECT * FROM suser";
            if (searchField != null && keyword != null && !keyword.trim().isEmpty()) {
                sql += " WHERE " + searchField + " LIKE ?";
            }

            PreparedStatement stmt = conn.prepareStatement(sql);

            if (searchField != null && keyword != null && !keyword.trim().isEmpty()) {
                stmt.setString(1, "%" + keyword + "%");
            }

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getInt("id") %>
        </td>
        <td><%= rs.getString("name") %>
        </td>
        <td><%= rs.getString("nicename") %>
        </td>
        <td><%= rs.getString("password") %>
        </td>
        <td>
            <a href="edit.jsp?id=<%= rs.getInt(1) %>">修改</a>
            <a href="delete.jsp?id=<%= rs.getInt(1) %>">删除</a>
        </td>
    </tr>
    <%
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            out.print(e.getMessage());
        }
    %>
</table>

<%-- 返回按钮 --%>
<div style="text-align: center; margin-top: 20px;">
    <a href="show.jsp">返回</a>
</div>
</body>
</html>
