<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Book Action</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
        }
        .message {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            background: white;
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
            String id = request.getParameter("id");
            String title = request.getParameter("title");
            String author = request.getParameter("author");
            String genre = request.getParameter("genre");
            String isbn = request.getParameter("isbn");
            String publisher = request.getParameter("publisher");
            String publishDate = request.getParameter("publish_date");
            String copiesAvailable = request.getParameter("copies_available");
            String description = request.getParameter("description");

            String dbURL = "jdbc:sqlserver://localhost:1433;databaseName=LibraryDB;encrypt=true;trustServerCertificate=true;";
            String dbUser = "minseokgo";
            String dbPass = "kms58325832@";
            Connection conn = null;
            PreparedStatement pstmt = null;

            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                String sql = "UPDATE Books123 SET title = ?, author = ?, genre = ?, isbn = ?, publisher = ?, publish_date = ?, copies_available = ?, description = ? WHERE id = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, title);
                pstmt.setString(2, author);
                pstmt.setString(3, genre);
                pstmt.setString(4, isbn);
                pstmt.setString(5, publisher);
                pstmt.setString(6, publishDate);
                pstmt.setInt(7, Integer.parseInt(copiesAvailable));
                pstmt.setString(8, description);
                pstmt.setInt(9, Integer.parseInt(id));

                int rows = pstmt.executeUpdate();

                if (rows > 0) {
                    out.println("<p class='success'>책 정보가 성공적으로 수정되었습니다!</p>");
                } else {
                    out.println("<p class='error'>수정에 실패했습니다. 다시 시도해주세요.</p>");
                }
            } catch (Exception e) {
                out.println("<p class='error'>오류 발생: " + e.getMessage() + "</p>");
            } finally {
                if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
            }
        %>
        <a href="index.jsp">홈으로  돌아가기</a>
    </div>
</body>
</html>
