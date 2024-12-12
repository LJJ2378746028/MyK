<%--
  Created by IntelliJ IDEA.
  User: ljj
  Date: 2024/10/11
  Time: 14:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>check</title>
</head>
<body>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    //对用户名和密码进行检测
    if ("admin".equals(username) && "1234".equals(password)) {
        //将用户名保存到session中
        session.setAttribute("username", username);
        //跳转
        response.sendRedirect("success.jsp");
    }
    else {
        //登入失败
        out.println("<h2>登入失败，用户名或密码错误</h2>");
        out.println("点击<a href='login.jsp'>重新尝试</a>");
    }
%>
</body>
</html>
