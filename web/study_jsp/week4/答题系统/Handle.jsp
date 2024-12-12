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
    <title>提交结果</title>
</head>
<body>
<%
    int score = 0;

    //根据选项来判断
    String q1 = request.getParameter("q1");
    String q2 = request.getParameter("q2");

    if ("D".equals(q1)) {
        score += 50;
    }
    if ("B".equals(q2)) {
        score += 50;
    }

%>

<h1 align="center" style="color: aqua">
    提交结果
</h1>
<p>
    你的得分是：<%= score %>
</p>
</body>
</html>
