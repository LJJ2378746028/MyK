<%--
  Created by IntelliJ IDEA.
  User: ljj
  Date: 2024/12/9
  Time: 21:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.bean.DatabaseConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>修改学生信息</title>
</head>
<link rel="stylesheet" href="css/edit_and_add.css">
<body>
<%
    request.setCharacterEncoding("UTF-8"); // 解决传参汉字乱码的问题

    int id = 0;
    String name = "", gander = "", address = "", department = "", tel = "", email = "";

    // 获取 ID 参数
    String idParam = request.getParameter("id");
    if (idParam == null || idParam.trim().isEmpty()) {
        out.print("<script>alert('未接收到有效 ID'); window.location.href='edit_student.jsp';</script>");
        return;
    }

    try {
        id = Integer.parseInt(idParam);
    } catch (NumberFormatException e) {
        out.print("<script>alert('ID格式有误'); window.location.href='edit_student.jsp';</script>");
        return;
    }

    // 使用 JavaBean 查询数据库
    try (Connection conn = DatabaseConnection.getConnection()) {
        String sql = "SELECT * FROM student WHERE id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    name = rs.getString("name");
                    gander = rs.getString("gander");
                    address = rs.getString("address");
                    department = rs.getString("department");
                    tel = rs.getString("tel");
                    email = rs.getString("email");
                } else {
                    out.print("<script>alert('未找到 ID'); window.location.href='edit_student.jsp';</script>");
                    return;
                }
            }
        }
    } catch (Exception e) {
        out.print("<script>alert('发生错误：" + e.getMessage() + "'); window.location.href='edit_student.jsp';</script>");
        return;
    }
%>

<div class="formBox">
    <form action="edit_student.jsp" method="post">
        <h2>修改学生信息</h2>
        <input type="hidden" name="id" value="<%= id %>">
        <div class="item">
            <input type="text" name="name" value="<%= name %>" required>
            <label>姓名</label>
        </div>
        <div class="item">
            <input type="text" name="gander" value="<%= gander %>" required>
            <label>性别</label>
        </div>
        <div class="item">
            <input type="text" name="address" value="<%= address %>" required>
            <label>地址</label>
        </div>
        <div class="item">
            <input type="text" name="department" value="<%= department %>" required>
            <label>系别</label>
        </div>
        <div class="item">
            <input type="text" name="tel" value="<%= tel %>" required>
            <label>电话</label>
        </div>
        <div class="item">
            <input type="email" name="email" value="<%= email %>" required>
            <label>邮箱</label>
        </div>
        <button type="submit" class="btn">提交修改
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </button>
    </form>
</div>


<%
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String newname = request.getParameter("name");
        String newgander = request.getParameter("gander");
        String newaddress = request.getParameter("address");
        String newdepartment = request.getParameter("department");
        String newtel = request.getParameter("tel");
        String newemail = request.getParameter("email");

        if (newname == null || newgander == null || newaddress == null || newdepartment == null || newtel == null || newemail == null) {
            out.print("<script>alert('提交的数据无效！'); window.location.href='edit_student.jsp';</script>");
            return;
        }

        try (Connection conn = DatabaseConnection.getConnection()) {
            String updateSql = "UPDATE student SET name = ?, gander = ?, address = ?, department = ?, tel = ?, email = ? WHERE id = ?";
            try (PreparedStatement psUpdate = conn.prepareStatement(updateSql)) {
                psUpdate.setString(1, newname);
                psUpdate.setString(2, newgander);
                psUpdate.setString(3, newaddress);
                psUpdate.setString(4, newdepartment);
                psUpdate.setString(5, newtel);
                psUpdate.setString(6, newemail);
                psUpdate.setInt(7, id);

                int rows = psUpdate.executeUpdate();
                if (rows > 0) {
                    out.print("<script>alert('学生信息修改成功'); window.location.href='show_student.jsp';</script>");
                } else {
                    out.print("<script>alert('修改失败！'); window.location.href='edit_student.jsp';</script>");
                }
            }
        } catch (Exception e) {
            out.print("<script>alert('发生错误：" + e.getMessage() + "'); window.location.href='edit_student.jsp';</script>");
        }
    }
%>
</body>
</html>
