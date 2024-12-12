<%--
  Created by IntelliJ IDEA.
  User: ljj
  Date: 2024/9/27
  Time: 19:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>include案例</title>
</head>
<body>
<p>
    请输入一个n，n>=1,求n的阶乘!
</p>
<form action="" method="post">
    <input type="text" name="n">
    <input type="submit" value="确定">
</form>
<%@include file="answer.jsp" %>
</body>
</html>
