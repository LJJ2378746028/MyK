<%--
  Created by IntelliJ IDEA.
  User: ljj
  Date: 2024/12/9
  Time: 15:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.bean.DatabaseConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
</head>
<link rel="stylesheet" href="./css/register.css">
<body>
<div id="login_box">
    <h2>注册界面</h2>
    <form action="register.jsp" method="post">
        <div id="input_box">
            <input type="text" placeholder="请输入用户名" name="uname" id="uname" required>
        </div>
        <div class="input_box">
            <input type="password" placeholder="请输入密码" name="upwd" id="upwd" required>
        </div>
        <button type="submit">注册</button>
        <br>
    </form>
</div>

<%
    // 判断是否有表单提交
    String uname = request.getParameter("uname");
    String upwd = request.getParameter("upwd");

    if (uname != null && upwd != null) {
        try {
            Connection conn = DatabaseConnection.getConnection();

            String checkUserSql = "SELECT COUNT(*) FROM user WHERE username = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkUserSql);
            checkStmt.setString(1, uname);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next() && rs.getInt(1) > 0) {
                out.println("<script>alert('用户名已存在，请重新注册！'); window.location.href='register.jsp';</script>");
            } else {
                String insertUserSql = "INSERT INTO user (username, password) VALUES (?, ?)";
                PreparedStatement insertStmt = conn.prepareStatement(insertUserSql);
                insertStmt.setString(1, uname);
                insertStmt.setString(2, upwd);
                insertStmt.executeUpdate();

                out.println("<script>alert('注册成功，请登录！'); window.location.href='login.jsp';</script>");
            }

            rs.close();
            checkStmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
</body>
</html>
