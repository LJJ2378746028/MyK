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
    String uname = (String) session.getAttribute("uname");
    if (uname == null) {
        response.sendRedirect("login.jsp"); // 如果用户未登录，重定向到登录页面
    }
%>
    <h2>
        Welcome:<%= uname %>!
    </h2>
    <p>
        登入成功
    </p>
</body>
</html>
