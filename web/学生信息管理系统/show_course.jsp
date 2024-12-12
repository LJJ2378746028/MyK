<%--
  Created by IntelliJ IDEA.
  User: ljj
  Date: 2024/12/11
  Time: 17:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.bean.DatabaseConnection" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>课程表管理系统</title>
</head>
<link rel="stylesheet" href="./css/table_show.css">
<body>
<h1>课程表管理系统</h1>

<%
    // 读取课程信息
    List<String[]> courseList = new ArrayList<>();
    try {
        Connection conn = DatabaseConnection.getConnection();
        String querySql = "SELECT * FROM course";
        PreparedStatement queryStmt = conn.prepareStatement(querySql);
        ResultSet rs = queryStmt.executeQuery();

        while (rs.next()) {
            String[] course = new String[6];
            course[0] = rs.getString("time");
            course[1] = rs.getString("monday");
            course[2] = rs.getString("tuesday");
            course[3] = rs.getString("wednesday");
            course[4] = rs.getString("thursday");
            course[5] = rs.getString("friday");
            courseList.add(course);
        }

        rs.close();
        queryStmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<table>
    <thead>
    <tr>
        <th>时间</th>
        <th>星期一</th>
        <th>星期二</th>
        <th>星期三</th>
        <th>星期四</th>
        <th>星期五</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <% for (String[] course : courseList) { %>
    <tr>
        <td><%= course[0] %>
        </td>
        <td><%= course[1] %>
        </td>
        <td><%= course[2] %>
        </td>
        <td><%= course[3] %>
        </td>
        <td><%= course[4] %>
        </td>
        <td><%= course[5] %>
        </td>
        <td>
            <a href="edit_course.jsp?time=<%= course[0] %>">修改</a>
        </td>
    </tr>
    <% } %>
    </tbody>
</table>

<div class="form-container">
    <form action="show_student.jsp" method="post">
        <input type="submit" value="查看学生信息表">
    </form>
</div>

</body>
</html>
