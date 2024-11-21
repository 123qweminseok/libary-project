<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Search Results</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
        }
        .result-container {
            background: white;
            padding: 20px;
            margin: 10px 0;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        h2, h3 {
            color: #333;
        }
        p {
            color: #555;
        }
        .footer {
            margin-top: 20px;
            font-size: 14px;
            color: #777;
        }
    </style>
</head>
<body>
<%
    String dbURL = "jdbc:sqlserver://localhost:1433;databaseName=LibraryDB;encrypt=true;trustServerCertificate=true;";
    String username = "minseokgo";
    String password = "kms58325832@";
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String title = request.getParameter("title");
    String genre = request.getParameter("genre");
    String author = request.getParameter("author");

    try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        conn = DriverManager.getConnection(dbURL, username, password);

        String sql = "SELECT * FROM Books123 WHERE 1=1";
        if (title != null && !title.trim().isEmpty()) {
            sql += " AND title LIKE ?";
        } else if (genre != null && !genre.trim().isEmpty()) {
            sql += " AND genre = ?";
        } else if (author != null && !author.trim().isEmpty()) {
            sql += " AND author LIKE ?";
        }

        pstmt = conn.prepareStatement(sql);
        if (title != null && !title.trim().isEmpty()) {
            pstmt.setString(1, "%" + title + "%");
        } else if (genre != null && !genre.trim().isEmpty()) {
            pstmt.setString(1, genre);
        } else if (author != null && !author.trim().isEmpty()) {
            pstmt.setString(1, "%" + author + "%");
        }

        rs = pstmt.executeQuery();

        if (!rs.isBeforeFirst()) {
            out.println("<h3>No results found.</h3>");
        } else {
            out.println("<h2>Search Results:</h2>");
            while (rs.next()) {
                out.println("<div class='result-container'>");
                out.println("<h3>" + rs.getString("title") + "</h3>");
                out.println("<p><strong>Author:</strong> " + rs.getString("author") + "</p>");
                out.println("<p><strong>Genre:</strong> " + rs.getString("genre") + "</p>");
                out.println("<p><strong>ISBN:</strong> " + rs.getString("isbn") + "</p>");
                out.println("<p><strong>Publisher:</strong> " + rs.getString("publisher") + "</p>");
                out.println("<p><strong>Publish Date:</strong> " + rs.getDate("publish_date") + "</p>");
                out.println("<p><strong>Copies Available:</strong> " + rs.getInt("copies_available") + "</p>");
                out.println("<p><strong>Description:</strong> " + rs.getString("description") + "</p>");
                out.println("</div>");
            }
        }
    } catch (Exception e) {
        out.println("<h3>Error: " + e.getMessage() + "</h3>");
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
    }
%>
<div class="footer">
    <a href="searchBook.jsp">Back to Search</a>
</div>
</body>
</html>
