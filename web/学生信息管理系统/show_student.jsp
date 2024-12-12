<%--
  Created by IntelliJ IDEA.
  User: ljj
  Date: 2024/12/9
  Time: 20:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.bean.DatabaseConnection" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生信息管理系统</title>
</head>
<link rel="stylesheet" href="./css/table_show.css">
<body>
<h1>
    学生信息管理系统
</h1>
<%--跳转到学生课程表--%>
<div class="form-container">
    <form action="show_course.jsp">
        <input type="submit" value="查看学生课程表">
    </form>
</div>
<%--查询--%>
<div class="form-container">
    <form action="select.jsp" method="get">
        <label>
            请选择查询的条件：
            <select name="filter">
                <option value="id">学号</option>
                <option value="name">姓名</option>
                <option value="department">系别</option>
                <option value="gander">性别</option>
            </select>
        </label>
        <input type="text" name="keyword" placeholder="请输入关键字" required>
        <input type="submit" value="搜索">
    </form>
</div>


<%--分页查询参数--%>
<%
    int pageSize = 8;
    int currentPage = 1;
    if (request.getParameter("page") != null) {
        currentPage = Integer.parseInt(request.getParameter("page"));
    }
    int offset = (currentPage - 1) * pageSize;
    int totalRecords = 0;
    int totalPages = 0;

    List<String[]> studentList = new ArrayList<>();

    try {
        Connection conn = DatabaseConnection.getConnection();

        // 获取总记录数
        String countSql = "SELECT COUNT(*) FROM student";
        PreparedStatement countStmt = conn.prepareStatement(countSql);
        ResultSet countRs = countStmt.executeQuery();
        if (countRs.next()) {
            totalRecords = countRs.getInt(1);
        }
        totalPages = (int) Math.ceil((double) totalRecords / pageSize);

        // 分页查询
        String querySql = "SELECT * FROM student LIMIT ?, ?";
        PreparedStatement queryStmt = conn.prepareStatement(querySql);
        queryStmt.setInt(1, offset);
        queryStmt.setInt(2, pageSize);
        ResultSet rs = queryStmt.executeQuery();

        while (rs.next()) {
            String[] student = new String[7];
            student[0] = String.valueOf(rs.getInt("id"));
            student[1] = rs.getString("name");
            student[2] = rs.getString("gander");
            student[3] = rs.getString("address");
            student[4] = rs.getString("department");
            student[5] = rs.getString("tel");
            student[6] = rs.getString("email");
            studentList.add(student);
        }

        rs.close();
        queryStmt.close();
        countStmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

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
        <td>-更新操作-</td>
        <td>-删除操作-</td>
    </tr>
    </thead>

    <% for (String[] student : studentList) { %>
    <tr>
        <td><%= student[0] %>
        </td>
        <td><%= student[1] %>
        </td>
        <td><%= student[2] %>
        </td>
        <td><%= student[3] %>
        </td>
        <td><%= student[4] %>
        </td>
        <td><%= student[5] %>
        </td>
        <td><%= student[6] %>
        </td>
        <td><a href="edit_student.jsp?id=<%= student[0] %>">修改</a></td>
        <td>
            <a href="show_student.jsp?id=<%= student[0] %>"
               onclick="return confirm('确定要删除这条记录吗？');">删除</a>
        </td>
    </tr>
    <% } %>
    <%--分页导航--%>
    <tfoot>
    <tr>
        <td colspan="9">
            <% if (currentPage > 1) { %>
            <a href="?page=<%= currentPage - 1 %>">上一页</a>
            <% } %>
            <% for (int i = 1; i <= totalPages; i++) { %>
            <% if (i == currentPage) { %>
            <b><%= i %>
            </b>
            <% } else { %>
            <a href="?page=<%= i %>"><%= i %>
            </a>
            <% } %>
            <% } %>
            <% if (currentPage < totalPages) { %>
            <a href="?page=<%= currentPage + 1 %>">下一页</a>
            <% } %>
        </td>
    </tr>
    </tfoot>
</table>
<%--添加--%>
<div class="form-container">
    <form action="add_student.jsp">
        <input type="submit" value="添加学生信息">
    </form>
</div>

<%
    // 检查是否有删除操作
    String idParam = request.getParameter("id");
    if (idParam != null && !idParam.isEmpty()) {
        try {
            int id = Integer.parseInt(idParam);

            try (Connection conn = DatabaseConnection.getConnection()) {
                String sql = "DELETE FROM student WHERE id = ?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setInt(1, id);

                int rows = ps.executeUpdate();
                if (rows > 0) {
                    out.print("<script>alert('删除成功！'); window.location.href='show_student.jsp';</script>");
                } else {
                    out.print("<script>alert('删除失败！没有找到该记录。'); window.location.href='show_student.jsp';</script>");
                }
                ps.close();
            }
        } catch (NumberFormatException e) {
            out.print("<script>alert('ID格式错误！'); window.location.href='show_student.jsp';</script>");
        } catch (Exception e) {
            out.print("<script>alert('发生错误：" + e.getMessage() + "'); window.location.href='show_student.jsp';</script>");
        }
    }
%>
</body>
</html>
