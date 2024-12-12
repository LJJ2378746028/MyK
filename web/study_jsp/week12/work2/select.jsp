<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查询页面</title>
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
<table>
    <tr>
        <td style="width: 100px;">-学号-</td>
        <td style="width: 100px;">-姓名-</td>
        <td>-性别-</td>
        <td style="width: 80px;">-地址-</td>
        <td style="width: 100px;">-系别-</td>
        <td style="width: 100px;">-电话-</td>
        <td style="width: 170px;">-邮箱-</td>
    </tr>
    <%
        // 获取查询条件和关键字
        String filter = request.getParameter("filter");
        String keyword = request.getParameter("keyword");

        if (filter != null && keyword != null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf8";
                String user = "root";
                String password = "QQ521...";
                Connection conn = DriverManager.getConnection(url, user, password);

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
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("gander") %></td>
        <td><%= rs.getString("address") %></td>
        <td><%= rs.getString("department") %></td>
        <td><%= rs.getString("tel") %></td>
        <td><%= rs.getString("email") %></td>
    </tr>
    <%
        }
        if (!hasData) {
    %>
    <tr>
        <td colspan="7" style="color: red;">未找到匹配的学生信息</td>
    </tr>
    <%
                }

                rs.close();
                ps.close();
                conn.close();
            } catch (Exception e) {
                out.print("<p style='color: red; text-align: center;'>查询错误：" + e.getMessage() + "</p>");
            }
        }
    %>
</table>
</body>
</html>
