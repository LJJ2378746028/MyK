<%--
  Created by IntelliJ IDEA.
  User: ljj
  Date: 2024/12/9
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录界面</title>
</head>
<link rel="stylesheet" href="./css/login.css">
<body>
<div class="loginBox">
    <form action="login_check.jsp" method="post">
        <h2>登录账号</h2>
        <div class="item">
            <input type="text" name="uname" id="uname" required>
            <label>账号</label>
        </div>
        <div class="item">
            <input type="password" name="upwd" id="upwd" required>
            <label>密码</label>
        </div>
        <button class="btn" type="submit">登录
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </button>
    </form>
    <br>
    <form action="register.jsp" method="post">
        <button class="btn" type="submit">注册
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </button>
    </form>
</div>
</body>
</html>
