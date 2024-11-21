<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>책 수정</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f5f5;
            margin: 0;
            padding: 20px;
        }
        .form-container {
            max-width: 600px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .form-container h1 {
            text-align: center;
        }
        .form-container form {
            display: flex;
            flex-direction: column;
        }
        .form-container label {
            margin-top: 10px;
            font-weight: bold;
        }
        .form-container input, .form-container textarea {
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .form-container button {
            margin-top: 20px;
            padding: 10px;
            background: #4caf50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .form-container button:hover {
            background: #45a049;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>책 수정</h1>
        <%
            String bookId = request.getParameter("id");
            String dbURL = "jdbc:sqlserver://localhost:1433;databaseName=LibraryDB;encrypt=true;trustServerCertificate=true;";
            String dbUser = "minseokgo";
            String dbPass = "kms58325832@";
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            String title = "", author = "", genre = "", isbn = "", publisher = "", publishDate = "", copiesAvailable = "", description = "";

            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                String sql = "SELECT * FROM Books123 WHERE id = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, Integer.parseInt(bookId));
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    title = rs.getString("title");
                    author = rs.getString("author");
                    genre = rs.getString("genre");
                    isbn = rs.getString("isbn");
                    publisher = rs.getString("publisher");
                    publishDate = rs.getString("publish_date");
                    copiesAvailable = rs.getString("copies_available");
                    description = rs.getString("description");
                }
            } catch (Exception e) {
                out.println("<p>오류 발생: " + e.getMessage() + "</p>");
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
            }
        %>
        <form action="editBookAction.jsp" method="post">
            <input type="hidden" name="id" value="<%= bookId %>" />
            <label for="title">제목</label>
            <input type="text" name="title" value="<%= title %>" required />
            
            <label for="author">저자</label>
            <input type="text" name="author" value="<%= author %>" required />

            <label for="genre">장르</label>
            <input type="text" name="genre" value="<%= genre %>" />

            <label for="isbn">ISBN</label>
            <input type="text" name="isbn" value="<%= isbn %>" />

            <label for="publisher">출판사</label>
            <input type="text" name="publisher" value="<%= publisher %>" />

            <label for="publish_date">출판일</label>
            <input type="text" name="publish_date" value="<%= publishDate %>" />

            <label for="copies_available">재고 수량</label>
            <input type="text" name="copies_available" value="<%= copiesAvailable %>" />

            <label for="description">설명</label>
            <textarea name="description"><%= description %></textarea>

            <button type="submit">수정</button>
        </form>
    </div>
</body>
</html>
