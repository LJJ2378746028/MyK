<%--
  Created by IntelliJ IDEA.
  User: ljj
  Date: 2024/10/11
  Time: 14:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登入成功</title>
</head>
<body>
<%
    String username = (String) session.getAttribute("username");

    if (username != null) {
        out.println("<h2>欢迎：" + username + "!</h2>");
    }
    else {
        response.sendRedirect("login.jsp");
    }
%>
</body>
</html>
