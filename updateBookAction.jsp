<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    String bookId = request.getParameter("id");
    String title = request.getParameter("title");
    String author = request.getParameter("author");
    String genre = request.getParameter("genre");
    String description = request.getParameter("description");

    String dbURL = "jdbc:sqlserver://localhost:1433;databaseName=LibraryDB;encrypt=true;trustServerCertificate=true;";
    String dbUser = "minseokgo";
    String dbPass = "kms58325832@";
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

        String sql = "UPDATE Books123 SET title = ?, author = ?, genre = ?, description = ? WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, title);
        pstmt.setString(2, author);
        pstmt.setString(3, genre);
        pstmt.setString(4, description);
        pstmt.setInt(5, Integer.parseInt(bookId));

        pstmt.executeUpdate();
        response.sendRedirect("viewMyBooks.jsp");
    } catch (Exception e) {
        out.println("<p>오류: " + e.getMessage() + "</p>");
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
    }
%>
