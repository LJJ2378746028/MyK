<%--
  Created by IntelliJ IDEA.
  User: ljj
  Date: 2024/9/27
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String s = request.getParameter("n");
    if (s == null) {
        s = "1";
    }
    int n = Integer.parseInt(s);
    double t = 1;
    for (int i = 1; i <= n; i++) {
        t = t * i;
    }

    out.print(n + "的阶乘为:<br>" + t);
%>
</body>
</html>
