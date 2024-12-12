package com.bean;
import java.sql.*;

public class ConnDB {
    public static Connection conn;
    public static Statement stmt;
    public static PreparedStatement pstmt;
    public static ResultSet rs;

    private static String url = "jdbc:mysql://localhost:3306/test";
    private static String name = "root";
    private static String password = "QQ521...";

    /**
     * 创建数据库连接
     */
    public static Connection getConnection() throws ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver"); // Updated to com.mysql.cj.jdbc.Driver
        try {
            conn = DriverManager.getConnection(url, name, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }

    public ResultSet doQuery(String sql) throws ClassNotFoundException {
        conn = ConnDB.getConnection();
        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }

    public int doUpdate(String sql) throws ClassNotFoundException {
        int irs = 0;
        conn = ConnDB.getConnection();
        try {
            stmt = conn.createStatement();
            irs = stmt.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return irs;
    }

    public ResultSet doPreparedQuery(String sql, Object... params) throws ClassNotFoundException {
        conn = ConnDB.getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            for (int i = 0; i < params.length; i++) {
                pstmt.setObject(i + 1, params[i]);
            }
            rs = pstmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }

    public int doPreparedUpdate(String sql, Object... params) throws ClassNotFoundException {
        int irs = 0;
        conn = ConnDB.getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            for (int i = 0; i < params.length; i++) {
                pstmt.setObject(i + 1, params[i]);
            }
            irs = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return irs;
    }

    public void close() throws SQLException {
        if (rs != null) {
            rs.close();
        }
        if (stmt != null) {
            stmt.close();
        }
        if (pstmt != null) {
            pstmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
}