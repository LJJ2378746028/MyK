<%@ page import="java.sql.*" %>

<%--
  Created by IntelliJ IDEA.
  User: ljj
  Date: 2024/11/12
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据库操作</title>
</head>
<body>
<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    // 获取用户名和密码
    String u_name = request.getParameter("uname");
    String u_pwd = request.getParameter("upwd");

    try {
        //加载驱动
        Class.forName("com.mysql.cj.jdbc.Driver");
        //创建数据库连接
        String url = "jdbc:mysql://localhost:3306/test";
        String user = "root";
        String password = "QQ521...";
        conn = DriverManager.getConnection(url, user, password);
//        stmt = conn.createStatement();


//        String sql = "SELECT * FROM user WHERE username = '" + u_name + "'";
        String ssql = "select * from user where username = ? and password = ?";

//        rs = stmt.executeQuery(ssql);
        PreparedStatement p = conn.prepareStatement(ssql);
        p.setString(1, u_name);
        p.setString(2, u_pwd);

        rs = p.executeQuery();

        if (!rs.next()) {
            response.sendRedirect("error.jsp");

        }
        else {
//            out.print("用户登入成功");
            session.setAttribute("uname", u_name);
            response.sendRedirect("success.jsp");
        }

//        while (rs.next()) {
//            String uname = rs.getString(2);
//            String upass = rs.getString(3);
//            if (uname.equals(u_name) && upass.equals(u_pwd)) {
//                session.setAttribute("uname", uname);
//                response.sendRedirect("success.jsp");
//            } else {
//                response.sendRedirect("error.jsp");
//            }
//        }

        rs.close(); //关闭数据库连接资源
        stmt.close();
        conn.close();
    } catch (Exception e) {
        out.print(e.getMessage());
    }

%>
</body>
</html>