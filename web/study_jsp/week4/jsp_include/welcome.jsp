<%--
  Created by IntelliJ IDEA.
  User: ljj
  Date: 2024/9/27
  Time: 19:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
you are welcome!
<%
    String s = request.getParameter("count");
    int n = Integer.parseInt(s);
    for (int i = 1; i <= n; i++) {
        out.print("<br>you are welcome!");
    }
%>
</body>
</html>
