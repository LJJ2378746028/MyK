<%--
  Created by IntelliJ IDEA.
  User: ljj
  Date: 2024/11/12
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登入系统</title>
</head>
<style>
    * {
        margin: 0;
        padding: 0;
        font-family: "微软雅黑";
        font-size: 18px;
    }
    .box1 {
        color: aliceblue;
        width: 420px;
        height: 200px;
        padding-top: 60px;
        margin: 250px auto;
        border-radius: 20px;
        background-color: rgba(255, 255, 255, 0.3);
    }
    .input1 {
        width: 165px;
        height: 18px;
        padding: 2px 2px 2px 22px;
        border-radius: 5px;
        background: url(./账户.png);
        background-repeat: no-repeat;
        background-position: left 1px top 3px;
        border: rgba(255, 255, 255, 0.3) solid 0.5px;
    }
    .input2 {
        width: 165px;
        height: 18px;
        padding: 2px 2px 2px 22px;
        border-radius: 5px;
        background: url(./密码.png);
        background-repeat: no-repeat;
        background-position: left 1px top 3px;
        border: rgba(255, 255, 255, 0.3) solid 0.5px;
    }
    .input3 {
        width: 190px;
        height: 25px;
        margin-left: 65px;
        border-radius: 3px;
        border: aqua solid 0.3px;
        background-color: aqua;
    }
</style>
<body style="background: url(./登入背景.png); background-size: cover; background-attachment: fixed;">
<div class="box1">
    <form action="sql.jsp" method="post" style="text-align: center;">
        账号：<input type="text" class="input1" name="uname" id="uname" required>
        <br>
        <br>
        密码：<input type="password" class="input2" name="upwd" id="upwd" required>
        <br>
        <br>
        <input type="submit" value="登录" class="input3">
    </form>
</div>
</body>
</html>