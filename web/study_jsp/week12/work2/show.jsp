<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生信息管理系统</title>
</head>
<style>
    table {
        margin: 0 auto;
        border-collapse: collapse;
        text-align: center;
    }

    tr, td {
        border: 1px solid black;
    }
</style>
<body>
<h1 align="center">
    学生信息管理系统
</h1>
<%--查询--%>
<form action="select.jsp" method="get" style="text-align: center;">
    <table style="background-color: aqua;">
        <tr>
            <td>
                请选择查询的条件：
                <select name="filter">
                    <option value="id">学号</option>
                    <option value="name">姓名</option><%-- 带模糊查询 --%>
                    <option value="department">系别</option><%-- 带模糊查询 --%>
                    <option value="gander">性别</option>
                </select>
                &nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td>
                请输入关键字：<input type="text" name="keyword" required>
            </td>
            <td>
                &nbsp;<input type="submit" value="搜索">&nbsp;
            </td>
        </tr>
    </table>
</form>

<table>
    <tr>
        <td style="width: 100px;">-学号-</td>
        <td style="width: 100px;">-姓名-</td>
        <td>-性别-</td>
        <td style="width: 80px;">-地址-</td>
        <td style="width: 100px;">-系别-</td>
        <td style="width: 100px;">-电话-</td>
        <td style="width: 170px;">-邮箱-</td>
        <td>-更新操作-</td>
        <td>-删除操作-</td>
    </tr>

    <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/test";
            String user = "root";
            String password = "QQ521...";
            Connection conn = DriverManager.getConnection(url, user, password);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from student");

            while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getInt(1)%>
        </td>
        <td><%= rs.getString(2)%>
        </td>
        <td><%= rs.getString(3)%>
        </td>
        <td><%= rs.getString(4)%>
        </td>
        <td><%= rs.getString(5)%>
        </td>
        <td><%= rs.getString(6)%>
        </td>
        <td><%= rs.getString(7)%>
        </td>
        <td>
            <a href="update.jsp?id=<%= rs.getInt(1) %>">修改</a>
        </td>
        <td>
            <a href="delete.jsp?id=<%= rs.getInt(1) %>">删除</a>
        </td>
    </tr>

    <% }

        rs.close(); //关闭数据库连接资源
        stmt.close();
        conn.close();

    } catch (Exception e) {
        out.print(e.getMessage());
    }
    %>
</table>
<%--    添加--%>
<form action="insert.jsp" style="text-align: center;">
    <input type="submit" value="添加">
</form>
</body>
</html>
