<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据库操作示例</title>
</head>
<body>
<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        // 加载驱动程序
        Class.forName("com.mysql.cj.jdbc.Driver");
        // 创建数据库连接
        String url = "jdbc:mysql://localhost:3306/test";
        String user = "root";
        String password = "QQ521...";
        conn = DriverManager.getConnection(url, user, password);

        // 创建statement
        stmt = conn.createStatement();

        // 增加数据
        String insertSQL = "INSERT INTO suser (id, name, nicename, password) VALUES (4, '新用户', '昵称4', '密码4')";
        int insertResult = stmt.executeUpdate(insertSQL);
        out.println("增加" + (insertResult > 0 ? "成功" : "失败") + "<br>");

        // 更新数据
        String updateSQL = "UPDATE suser SET name='更新用户' WHERE id=1";
        int updateResult = stmt.executeUpdate(updateSQL);
        out.println("更新" + (updateResult > 0 ? "成功" : "失败") + "<br>");

        // 删除数据
        String deleteSQL = "DELETE FROM suser WHERE id=3";
        int deleteResult = stmt.executeUpdate(deleteSQL);
        out.println("删除" + (deleteResult > 0 ? "成功" : "失败") + "<br>");

        // 查询并显示数据
        rs = stmt.executeQuery("SELECT * FROM suser");
        while (rs.next()) {
            out.print("用户名：" + rs.getString("id") + "，");
            out.print("名字：" + rs.getString("name") + "，");
            out.print("用户昵称：" + rs.getString("nicename") + "，");
            out.print("用户密码：" + rs.getString("password") + "<br>");
        }
    } catch (Exception e) {
        out.println("数据库操作失败：" + e.getMessage());
    } finally {
        // 关闭资源
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>
</body>
</html>
