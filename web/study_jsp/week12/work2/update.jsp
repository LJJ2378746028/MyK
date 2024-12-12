<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>修改学生信息</title>
</head>
<body>
<h2 align="center">修改学生信息</h2>

<%
    request.setCharacterEncoding("UTF-8");//解决传参汉字乱码的问题
    int id = 0;
    String name = "", gander = "", address = "", department = "", tel = "", email = "";

    // 获取 ID 参数
    String idParam = request.getParameter("id");
    if (idParam == null || idParam.trim().isEmpty()) {
        out.print("<p style='color: red; text-align: center;'>未接收到有效的 ID 参数！</p>");
        return;
    }

    try {
        id = Integer.parseInt(idParam);
    } catch (NumberFormatException e) {
        out.print("<p style='color: red; text-align: center;'>ID 参数格式无效！</p>");
        return;
    }

    // 查询数据库
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/test";
        String user = "root";
        String dbPassword = "QQ521...";
        Connection conn = DriverManager.getConnection(url, user, dbPassword);

        String sql = "SELECT * FROM student WHERE id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            name = rs.getString("name");
            gander = rs.getString("gander");
            address = rs.getString("address");
            department = rs.getString("department");
            tel = rs.getString("tel");
            email = rs.getString("email");
        } else {
            out.print("<p style='color: red; text-align: center;'>未找到对应 ID 的记录！</p>");
            rs.close();
            ps.close();
            conn.close();
            return;
        }

        rs.close();
        ps.close();
        conn.close();
    } catch (Exception e) {
        out.print("<p style='color: red; text-align: center;'>数据库连接或查询错误：" + e.getMessage() + "</p>");
        return;
    }
%>

<form action="update.jsp" method="post" style="text-align: center;">
    <label>学号：<input type="text" value="<%= id %>" readonly></label><br><br>
    <input type="hidden" name="id" value="<%= id %>">
    <label>姓名：<input type="text" name="name" value="<%= name %>" required></label><br><br>
    <label>性别：<input type="text" name="gander" value="<%= gander %>" required></label><br><br>
    <label>地址：<input type="text" name="address" value="<%= address %>" required></label><br><br>
    <label>系别：<input type="text" name="department" value="<%= department %>" required></label><br><br>
    <label>电话：<input type="text" name="tel" value="<%= tel %>" required></label><br><br>
    <label>邮箱：<input type="text" name="email" value="<%= email %>" required></label><br><br>
    <button type="submit">提交修改</button>
</form>

<%
    request.setCharacterEncoding("UTF-8");//解决传参汉字乱码的问题
    // 提交表单后更新数据库
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String newname = request.getParameter("name");
        String newgander = request.getParameter("gander");
        String newaddress = request.getParameter("address");
        String newdepartment = request.getParameter("department");
        String newtel = request.getParameter("tel");
        String newemail = request.getParameter("email");

        if (newname == null || newgander == null || newaddress == null || newdepartment == null || newtel == null || newemail == null) {
            out.print("<p style='color: red; text-align: center;'>提交数据无效！</p>");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/test";
            String user = "root";
            String dbPassword = "QQ521...";
            Connection conn = DriverManager.getConnection(url, user, dbPassword);

            String updateSql = "UPDATE student SET name = ?, gander = ?, address = ?, department = ?, tel = ?, email = ? WHERE id = ?";
            PreparedStatement psUpdate = conn.prepareStatement(updateSql);
            psUpdate.setString(1, newname);
            psUpdate.setString(2, newgander);
            psUpdate.setString(3, newaddress);
            psUpdate.setString(4, newdepartment);
            psUpdate.setString(5, newtel);
            psUpdate.setString(6, newemail);
            psUpdate.setInt(7, id);

            int rows = psUpdate.executeUpdate();
            if (rows > 0) {
%>
<p style="color: green; text-align: center;">学生信息修改成功！</p>
<div style="text-align: center;">
    <a href="show.jsp">
        <button type="button">返回列表</button>
    </a>
</div>
<%
            } else {
                out.print("<p style='color: red; text-align: center;'>修改失败，请重试！</p>");
            }

            psUpdate.close();
            conn.close();
        } catch (Exception e) {
            out.print("<p style='color: red; text-align: center;'>数据库错误：" + e.getMessage() + "</p>");
        }
    }
%>
</body>
</html>


