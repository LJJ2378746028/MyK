<%@ page import="com.bean.DatabaseConnection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%--
  Created by IntelliJ IDEA.
  User: ljj
  Date: 2024/12/9
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录验证</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            height: 100vh;
            background: linear-gradient(to bottom right, #141e30, #243b55);
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Arial', sans-serif;
            color: #fff;
        }

        .container {
            width: 400px;
            background-color: rgba(0, 0, 0, 0.8);
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
        }

        h2 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        .links a {
            display: block;
            margin: 10px 0;
            text-decoration: none;
            color: #03e9f4;
            font-size: 18px;
            transition: color 0.3s;
        }

        .links a:hover {
            color: #fff;
            text-shadow: 0 0 5px #03e9f4, 0 0 10px #03e9f4, 0 0 20px #03e9f4;
        }

        .button {
            padding: 10px 20px;
            margin-top: 20px;
            color: #03e9f4;
            background: none;
            border: 1px solid #03e9f4;
            cursor: pointer;
            transition: 0.5s;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .button:hover {
            background: #03e9f4;
            color: #000;
            box-shadow: 0 0 10px #03e9f4, 0 0 20px #03e9f4, 0 0 40px #03e9f4;
        }
    </style>
</head>
<body>
<div class="container">
    <%
        String username = request.getParameter("uname");
        String password = request.getParameter("upwd");
        DatabaseConnection DC = new DatabaseConnection();
        String sql = "select * from user where username = ? and password = ?";
        ResultSet rs = null;
        try {
            rs = DC.doPreparedQuery(sql, username, password);
            if (rs.next()) {
    %>
    <h2>登录成功，欢迎您！<%= username %>
    </h2>
    <div class="links">
        <a href="show_student.jsp">学生信息表查看</a>
        <a href="show_course.jsp">课程表查看</a>
    </div>
    <%
    } else {
    %>
    <h2>登录失败，请重试。</h2>
    <a href="login.jsp" class="button">返回登录</a>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                DC.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</div>
</body>
</html>
