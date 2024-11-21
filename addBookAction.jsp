<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Book Action</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: #f5f5f5;
            text-align: center;
            padding-top: 50px;
        }
        .message {
            max-width: 600px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .success {
            color: green;
        }
        .error {
            color: red;
        }
    </style>
</head>
<body>
    <div class="message">
        <%
            // Fetch form data
            String title = request.getParameter("title");
            String author = request.getParameter("author");
            String genre = request.getParameter("genre");
            String isbn = request.getParameter("isbn");
            String publisher = request.getParameter("publisher");
            String publishDate = request.getParameter("publish_date");
            String copiesAvailable = request.getParameter("copies_available");
            String description = request.getParameter("description");

            // Get the logged-in user's username from the session
            String addedBy = (String) session.getAttribute("username");
            if (addedBy == null) {
                out.println("<p class='error'>You must be logged in to add a book.</p>");
                out.println("<a href='login.jsp'>Login</a>");
                return;
            }

            // Database connection details
            String dbURL = "jdbc:sqlserver://localhost:1433;databaseName=LibraryDB;encrypt=true;trustServerCertificate=true;";
            String dbUser = "minseokgo";
            String dbPass = "kms58325832@";

            Connection conn = null;
            PreparedStatement pstmt = null;

            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                // Insert query with the added_by field
                String sql = "INSERT INTO Books123 (title, author, genre, isbn, publisher, publish_date, copies_available, description, added_by) " +
                             "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, title);
                pstmt.setString(2, author);
                pstmt.setString(3, genre != null ? genre : "N/A");
                pstmt.setString(4, isbn != null ? isbn : "N/A");
                pstmt.setString(5, publisher != null ? publisher : "N/A");
                pstmt.setString(6, publishDate != null ? publishDate : null);
                pstmt.setInt(7, copiesAvailable != null && !copiesAvailable.isEmpty() ? Integer.parseInt(copiesAvailable) : 0);
                pstmt.setString(8, description);
                pstmt.setString(9, addedBy); // Store the logged-in user's username

                int rows = pstmt.executeUpdate();

                if (rows > 0) {
                    out.println("<p class='success'>The book has been added successfully!</p>");
                } else {
                    out.println("<p class='error'>Failed to add the book. Please try again.</p>");
                }
            } catch (Exception e) {
                out.println("<p class='error'>An error occurred: " + e.getMessage() + "</p>");
                e.printStackTrace();
            } finally {
                if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
            }
        %>
        <a href="index.jsp">Back to Home</a>
    </div>
</body>
</html>
