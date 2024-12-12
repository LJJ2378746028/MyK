<%--
  Created by IntelliJ IDEA.
  User: ljj
  Date: 2024/9/26
  Time: 20:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>答题页面</title>
</head>
<body>
<h1 align="center" style="color: cyan;">
    课后作业
</h1>

<form action="Handle.jsp" method="post">
    <div>
        <p>
            1. (单选题, 50分)下列（）不是OS关心的主要问题
        </p>
        <input type="radio" name="q1" value="A">A.管理计算机裸机
        <br>
        <input type="radio" name="q1" value="B">B. 设计用户程序与计算机硬件系统的界面
        <br>
        <input type="radio" name="q1" value="C">C. 管理计算机系统资源
        <br>
        <input type="radio" name="q1" value="D">D. 高级程序设计语言的编译器
    </div>
    <div>
        <p>
            2. (单选题, 50分)计算机系统中配置操作系统的目的是提高计算机的（）和方便用户使用。
        </p>
        <input type="radio" name="q2" value="A">A. 速度
        <br>
        <input type="radio" name="q2" value="B">B. 利用率
        <br>
        <input type="radio" name="q2" value="C">C. 灵活性
        <br>
        <input type="radio" name="q2" value="D">D. 兼容性
    </div>

    <input type="submit" value="提交答案">
</form>
</body>
</html>
