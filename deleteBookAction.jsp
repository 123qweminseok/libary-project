<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    String bookId = request.getParameter("id");

    String dbURL = "jdbc:sqlserver://localhost:1433;databaseName=LibraryDB;encrypt=true;trustServerCertificate=true;";
    String dbUser = "minseokgo";
    String dbPass = "kms58325832@";
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

        String sql = "DELETE FROM Books123 WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, Integer.parseInt(bookId));

        pstmt.executeUpdate();
        response.sendRedirect("viewMyBooks.jsp");
    } catch (Exception e) {
        out.println("<p>오류: " + e.getMessage() + "</p>");
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
    }
%>
