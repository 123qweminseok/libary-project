<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Book</title>
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
        a {
            text-decoration: none;
            color: #007bff;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="message">
        <%
            // Fetch the book ID from the request
            String bookId = request.getParameter("id");

            // Database connection details
            String dbURL = "jdbc:sqlserver://localhost:1433;databaseName=LibraryDB;encrypt=true;trustServerCertificate=true;";
            String dbUser = "minseokgo";
            String dbPass = "kms58325832@";

            Connection conn = null;
            PreparedStatement pstmt = null;

            try {
                // Establish a database connection
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                // SQL query to delete the book
                String sql = "DELETE FROM Books123 WHERE id = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, Integer.parseInt(bookId)); // Set the book ID in the query

                int rowsAffected = pstmt.executeUpdate();

                if (rowsAffected > 0) {
                    out.println("<p class='success'>The book has been successfully deleted!</p>");
                } else {
                    out.println("<p class='error'>Failed to delete the book. Please try again.</p>");
                }
            } catch (Exception e) {
                out.println("<p class='error'>An error occurred: " + e.getMessage() + "</p>");
                e.printStackTrace();
            } finally {
                // Close resources
                if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
            }
        %>
        <a href="index.jsp">홈으로  돌아가기</a>
    </div>
</body>
</html>
