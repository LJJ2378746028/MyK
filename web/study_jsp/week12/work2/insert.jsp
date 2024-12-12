<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>添加学生信息</title>
</head>
<body>
<h2 align="center">添加学生信息</h2>

<form action="insert.jsp" method="post" style="text-align: center;">
    <label>学号：<input type="text" name="id"></label><br><br>
    <label>姓名：<input type="text" name="name" required></label><br><br>
    <label>性别：<input type="text" name="gander" required></label><br><br>
    <label>地址：<input type="text" name="address" required></label><br><br>
    <label>系别：<input type="text" name="department" required></label><br><br>
    <label>电话：<input type="text" name="tel" required></label><br><br>
    <label>邮箱：<input type="text" name="email" required></label><br><br>
    <button type="submit">添加</button>
</form>

<%
    request.setCharacterEncoding("UTF-8");//解决传参汉字乱码的问题
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String idStr = request.getParameter("id");
        Integer id = null;
        try {
            if (idStr != null && !idStr.trim().isEmpty()) {
                id = Integer.parseInt(idStr); // 转换为 Integer
            }
        } catch (NumberFormatException e) {
            out.print("<p style='color: red; text-align: center;'>学号必须为数字！</p>");
            return;
        }
        String name = request.getParameter("name");
        String gander = request.getParameter("gander");
        String address = request.getParameter("address");
        String department = request.getParameter("department");
        String tel = request.getParameter("tel");
        String email = request.getParameter("email");

        if (name == null || address == null || department == null) {
            out.print("<p style='color: red; text-align: center;'>提交数据无效！</p>");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/test";
            String user = "root";
            String dbPassword = "QQ521...";
            Connection conn = DriverManager.getConnection(url, user, dbPassword);

            String insertSql;
            PreparedStatement ps;

            // 判断 id 是否为空
            if (id == null) {
                insertSql = "INSERT INTO student (name, gander, address, department, tel, email) VALUES (?, ?, ?, ?, ?, ?)";
                ps = conn.prepareStatement(insertSql);
                ps.setString(1, name);
                ps.setString(2, gander);
                ps.setString(3, address);
                ps.setString(4, department);
                ps.setString(5, tel);
                ps.setString(6, email);
            } else {
                insertSql = "INSERT INTO student (id, name, gander, address, department, tel, email) VALUES (?, ?, ?, ?, ?, ?, ?)";
                ps = conn.prepareStatement(insertSql);
                ps.setInt(1, id);
                ps.setString(2, name);
                ps.setString(3, gander);
                ps.setString(4, address);
                ps.setString(5, department);
                ps.setString(6, tel);
                ps.setString(7, email);
            }

            int rows = ps.executeUpdate();
            if (rows > 0) {
%>
<p style="color: green; text-align: center;">学生信息添加成功！</p>
<div style="text-align: center;">
    <a href="show.jsp">
        <button type="button">返回列表</button>
    </a>
</div>
<%
            } else {
                out.print("<p style='color: red; text-align: center;'>添加失败，请重试！</p>");
            }

            ps.close();
            conn.close();
        } catch (Exception e) {
            out.print("<p style='color: red; text-align: center;'>数据库错误：" + e.getMessage() + "</p>");
        }
    }
%>
</body>
</html>