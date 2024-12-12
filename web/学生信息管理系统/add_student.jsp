<%--
  Created by IntelliJ IDEA.
  User: ljj
  Date: 2024/12/10
  Time: 14:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.bean.DatabaseConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>添加学生信息</title>
</head>
<link rel="stylesheet" href="css/edit_and_add.css">
<body>
<div class="formBox">
    <form action="add_student.jsp" method="post">
        <h2>添加学生信息</h2>
        <div class="item">
            <input type="text" name="id">
            <label>学号</label>
        </div>
        <div class="item">
            <input type="text" name="name" required>
            <label>姓名</label>
        </div>
        <div class="item">
            <input type="text" name="gander" required>
            <label>性别</label>
        </div>
        <div class="item">
            <input type="text" name="address" required>
            <label>地址</label>
        </div>
        <div class="item">
            <input type="text" name="department" required>
            <label>系别</label>
        </div>
        <div class="item">
            <input type="text" name="tel" required>
            <label>电话</label>
        </div>
        <div class="item">
            <input type="text" name="email" required>
            <label>邮箱</label>
        </div>
        <button type="submit" class="btn">提交信息
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </button>
    </form>
</div>

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
            out.print("<script>alert('学号必须是数字！'); window.location.href='add_student.jsp';</script>");
            return;
        }
        String name = request.getParameter("name");
        String gander = request.getParameter("gander");
        String address = request.getParameter("address");
        String department = request.getParameter("department");
        String tel = request.getParameter("tel");
        String email = request.getParameter("email");

        if (name == null || address == null || department == null) {
            out.print("<script>alert('提交的数据无效！'); window.location.href='add_student.jsp';</script>");
            return;
        }

        try (Connection conn = DatabaseConnection.getConnection()) {
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
<script>alert('学生信息添加成功！');
window.location.href = 'show_student.jsp';</script>
<%
            } else {
                out.print("<script>alert('添加失败，请重试！'); window.location.href='add_student.jsp';</script>");
            }

            ps.close();
        } catch (Exception e) {
            out.print("<script>alert('发生错误：" + e.getMessage() + "'); window.location.href='add_student.jsp';</script>");
        }
    }
%>
</body>
</html>
