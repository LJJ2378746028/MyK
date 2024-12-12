<%--
  Created by IntelliJ IDEA.
  User: ljj
  Date: 2024/9/27
  Time: 19:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<P>
    加载文件welcome.jsp
</P>
<jsp:include page="welcome.jsp">
    <jsp:param name="count" value="3"/>
</jsp:include>
</body>
</html>
