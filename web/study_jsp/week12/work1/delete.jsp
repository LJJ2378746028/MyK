<%--
  Created by IntelliJ IDEA.
  User: ljj
  Date: 2024/11/21
  Time: 21:10
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
    <title>删除学生信息</title>
</head>
<body>
<%
    int id = Integer.parseInt(request.getParameter("id"));

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/test";
        String user = "root";
        String password = "QQ521...";
        Connection conn = DriverManager.getConnection(url, user, password);

        String sql = "DELETE FROM suser WHERE id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);

        int rows = ps.executeUpdate();
        if (rows > 0) {
            out.print("<p style='text-align: center; color: green;'>学生信息删除成功！</p>");
        } else {
            out.print("<p style='text-align: center; color: red;'>删除失败，请重试。</p>");
        }

        ps.close();
        conn.close();
    } catch (Exception e) {
        out.print("<p style='text-align: center; color: red;'>发生错误：" + e.getMessage() + "</p>");
    }
%>

<p style="text-align: center;">
    <a href="show.jsp">返回学生信息列表</a>
</p>
</body>
</html>

