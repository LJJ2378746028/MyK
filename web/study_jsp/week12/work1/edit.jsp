<%--
  Created by IntelliJ IDEA.
  User: ljj
  Date: 2024/11/21
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>修改学生信息</title>
</head>
<body>
<h2 align="center">修改学生信息</h2>

<%
    int id = 0;
    String name = "", nicename = "", password = "";

    // 获取 ID 参数
    String idParam = request.getParameter("id");
    if (idParam == null || idParam.trim().isEmpty()) {
        out.print("<p style='color: red; text-align: center;'>未接收到有效的 ID 参数！</p>");
        return;
    }

    try {
        id = Integer.parseInt(idParam);
    } catch (NumberFormatException e) {
        out.print("<p style='color: red; text-align: center;'>ID 参数格式无效！</p>");
        return;
    }

    // 查询数据库
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/test";
        String user = "root";
        String dbPassword = "QQ521...";
        Connection conn = DriverManager.getConnection(url, user, dbPassword);

        String sql = "SELECT * FROM suser WHERE id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            name = rs.getString("name");
            nicename = rs.getString("nicename");
            password = rs.getString("password");
        } else {
            out.print("<p style='color: red; text-align: center;'>未找到对应 ID 的记录！</p>");
            rs.close();
            ps.close();
            conn.close();
            return;
        }

        rs.close();
        ps.close();
        conn.close();
    } catch (Exception e) {
        out.print("<p style='color: red; text-align: center;'>数据库连接或查询错误：" + e.getMessage() + "</p>");
        return;
    }
%>

<form action="edit.jsp" method="post" style="text-align: center;">
    <label>ID：<input type="text" value="<%= id %>" readonly></label><br><br>
    <input type="hidden" name="id" value="<%= id %>">
    <label>姓名：<input type="text" name="name" value="<%= name %>" required></label><br><br>
    <label>昵称：<input type="text" name="nicename" value="<%= nicename %>" required></label><br><br>
    <label>密码：<input type="password" name="password" value="<%= password %>" required></label><br><br>
    <button type="submit">提交修改</button>
</form>

<%
    // 提交表单后更新数据库
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String newName = request.getParameter("name");
        String newNicename = request.getParameter("nicename");
        String newPassword = request.getParameter("password");

        if (newName == null || newNicename == null || newPassword == null) {
            out.print("<p style='color: red; text-align: center;'>提交数据无效！</p>");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/test";
            String user = "root";
            String dbPassword = "QQ521...";
            Connection conn = DriverManager.getConnection(url, user, dbPassword);

            String updateSql = "UPDATE suser SET name = ?, nicename = ?, password = ? WHERE id = ?";
            PreparedStatement psUpdate = conn.prepareStatement(updateSql);
            psUpdate.setString(1, newName);
            psUpdate.setString(2, newNicename);
            psUpdate.setString(3, newPassword);
            psUpdate.setInt(4, id);

            int rows = psUpdate.executeUpdate();
            if (rows > 0) {
%>
<p style="color: green; text-align: center;">学生信息修改成功！</p>
<div style="text-align: center;">
    <a href="show.jsp">
        <button type="button">返回列表</button>
    </a>
</div>
<%
            } else {
                out.print("<p style='color: red; text-align: center;'>修改失败，请重试！</p>");
            }

            psUpdate.close();
            conn.close();
        } catch (Exception e) {
            out.print("<p style='color: red; text-align: center;'>数据库错误：" + e.getMessage() + "</p>");
        }
    }
%>
</body>
</html>


