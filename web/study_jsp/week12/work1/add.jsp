<%--
  Created by IntelliJ IDEA.
  User: ljj
  Date: 2024/11/21
  Time: 20:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>添加学生信息</title>
</head>
<body>
<h2 align="center">添加学生信息</h2>

<form action="add.jsp" method="post" style="text-align: center;">
    <label>姓名：<input type="text" name="name" required></label><br><br>
    <label>昵称：<input type="text" name="nicename" required></label><br><br>
    <label>密码：<input type="password" name="password" required></label><br><br>
    <button type="submit">添加</button>
</form>

<%
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String name = request.getParameter("name");
        String nicename = request.getParameter("nicename");
        String password = request.getParameter("password");

        if (name == null || nicename == null || password == null) {
            out.print("<p style='color: red; text-align: center;'>提交数据无效！</p>");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/test";
            String user = "root";
            String dbPassword = "QQ521...";
            Connection conn = DriverManager.getConnection(url, user, dbPassword);

            String insertSql = "INSERT INTO suser (name, nicename, password) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(insertSql);
            ps.setString(1, name);
            ps.setString(2, nicename);
            ps.setString(3, password);

            int rows = ps.executeUpdate();
            if (rows > 0) {
%>
<p style="color: green; text-align: center;">学生信息添加成功！</p>
<div style="text-align: center;">
    <a href="show.jsp"><button type="button">返回列表</button></a>
</div>
<%
            } else {
                out.print("<p style='color: red; text-align: center;'>添加失败，请重试！</p>");
            }

            ps.close();
            conn.close();
        } catch (Exception e) {
            out.print("<p style='color: red; text-align: center;'>数据库错误：" + e.getMessage() + "</p>");
        }
    }
%>
</body>
</html>

