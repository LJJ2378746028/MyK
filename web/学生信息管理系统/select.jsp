<%--
  Created by IntelliJ IDEA.
  User: ljj
  Date: 2024/12/10
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.bean.DatabaseConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查询页面</title>
</head>
<link rel="stylesheet" href="./css/table_show.css">
<body>
<table>
    <thead>
    <tr>
        <td>-学号-</td>
        <td>-姓名-</td>
        <td>-性别-</td>
        <td>-地址-</td>
        <td>-系别-</td>
        <td>-电话-</td>
        <td>-邮箱-</td>
    </tr>
    </thead>
    <%
        // 获取查询条件和关键字
        String filter = request.getParameter("filter");
        String keyword = request.getParameter("keyword");

        if (filter != null && keyword != null) {
            try (Connection conn = DatabaseConnection.getConnection()) {
                // 构造查询SQL
                String query = "SELECT * FROM student WHERE " + filter;
                if (filter.equals("name") || filter.equals("department")) {
                    query += " LIKE ?";
                    keyword = "%" + keyword + "%"; // 模糊查询
                } else {
                    query += " = ?";
                }

                PreparedStatement ps = conn.prepareStatement(query);
                ps.setString(1, keyword);
                ResultSet rs = ps.executeQuery();

                boolean hasData = false; // 标志查询是否有结果
                while (rs.next()) {
                    hasData = true;
    %>
    <tr>
        <td><%= rs.getInt("id") %>
        </td>
        <td><%= rs.getString("name") %>
        </td>
        <td><%= rs.getString("gander") %>
        </td>
        <td><%= rs.getString("address") %>
        </td>
        <td><%= rs.getString("department") %>
        </td>
        <td><%= rs.getString("tel") %>
        </td>
        <td><%= rs.getString("email") %>
        </td>
    </tr>
    <%
        }
        if (!hasData) {
    %>
    <script>alert('未找到学生信息');
    window.location.href = 'show_student.jsp';</script>
    <%
                }

                rs.close();
                ps.close();
            } catch (Exception e) {
                out.print("<script>alert('发生错误：" + e.getMessage() + "'); window.location.href='show_student.jsp';</script>");
            }
        }
    %>
    <tfoot>
    <tr>
        <td colspan="9">
            <a href="show_student.jsp">返回学生信息表</a>
        </td>
    </tr>
    </tfoot>
</table>
</body>
</html>

