<%--
  Created by IntelliJ IDEA.
  User: ljj
  Date: 2024/12/11
  Time: 17:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page import="com.bean.DatabaseConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>修改课程</title>
    <link rel="stylesheet" href="css/edit_and_add.css">
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8"); // 解决传参汉字乱码的问题
    // 初始化变量
    String time = request.getParameter("time");
    String monday = "", tuesday = "", wednesday = "", thursday = "", friday = "";

    // 检查是否是表单提交
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        // 获取表单提交的数据
        time = request.getParameter("time");
        monday = request.getParameter("monday");
        tuesday = request.getParameter("tuesday");
        wednesday = request.getParameter("wednesday");
        thursday = request.getParameter("thursday");
        friday = request.getParameter("friday");

        // 执行更新操作
        try {
            Connection conn = DatabaseConnection.getConnection();
            String updateSql = "UPDATE course SET monday = ?, tuesday = ?, wednesday = ?, thursday = ?, friday = ? WHERE time = ?";
            PreparedStatement updateStmt = conn.prepareStatement(updateSql);

            updateStmt.setString(1, monday);
            updateStmt.setString(2, tuesday);
            updateStmt.setString(3, wednesday);
            updateStmt.setString(4, thursday);
            updateStmt.setString(5, friday);
            updateStmt.setString(6, time);

            int rows = updateStmt.executeUpdate();
            if (rows > 0) {
                out.print("<script>alert('修改成功！'); window.location.href='show_course.jsp';</script>");
            } else {
                out.print("<script>alert('修改失败！'); window.location.href='edit_course.jsp?time=" + time + "';</script>");
            }

            updateStmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.print("<script>alert('发生错误：" + e.getMessage() + "'); window.location.href='edit_course.jsp?time=" + time + "';</script>");
        }
    } else if (time != null) {
        // 如果是通过链接进入页面，加载初始数据
        try {
            Connection conn = DatabaseConnection.getConnection();
            String querySql = "SELECT * FROM course WHERE time = ?";
            PreparedStatement queryStmt = conn.prepareStatement(querySql);
            queryStmt.setString(1, time);
            ResultSet rs = queryStmt.executeQuery();

            if (rs.next()) {
                monday = rs.getString("monday");
                tuesday = rs.getString("tuesday");
                wednesday = rs.getString("wednesday");
                thursday = rs.getString("thursday");
                friday = rs.getString("friday");
            }

            rs.close();
            queryStmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>

<div class="formBox">
    <form action="edit_course.jsp" method="post">
        <h2>修改课程信息</h2>
        <input type="hidden" name="time" value="<%= time %>">
        <div class="item">
            <input type="text" value="<%= time %>" disabled>
            <label></label>
        </div>
        <div class="item">
            <input type="text" name="monday" value="<%= monday %>" required>
            <label>星期一</label>
        </div>
        <div class="item">
            <input type="text" name="tuesday" value="<%= tuesday %>" required>
            <label>星期二</label>
        </div>
        <div class="item">
            <input type="text" name="wednesday" value="<%= wednesday %>" required>
            <label>星期三</label>
        </div>
        <div class="item">
            <input type="text" name="thursday" value="<%= thursday %>" required>
            <label>星期四</label>
        </div>
        <div class="item">
            <input type="text" name="friday" value="<%= friday %>" required>
            <label>星期五</label>
        </div>
        <button type="submit" class="btn">保存修改
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </button>
    </form>
</div>
</body>
</html>

