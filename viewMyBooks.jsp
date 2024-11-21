<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>내가 등록한 책 보기</title>
    <style>
        body {
            font-family: 'Times New Roman', serif;
            background: #f5f5f5;
            margin: 0;
            padding: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background: white;
        }
        table th, table td {
            padding: 8px;
            border: 1px solid #ddd;
            text-align: left;
        }
        table th {
            background-color: #f4f4f4;
        }
        .action-buttons {
            display: flex;
            gap: 5px;
        }
        .action-buttons a {
            text-decoration: none;
            padding: 5px 10px;
            color: white;
            border-radius: 3px;
        }
        .edit {
            background: #4caf50;
        }
        .delete {
            background: #f44336;
        }
    </style>
</head>
<body>
    <h1>내가 등록한 책 보기</h1>
    <%
        String loggedInUser = (String) session.getAttribute("username");
        if (loggedInUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String dbURL = "jdbc:sqlserver://localhost:1433;databaseName=LibraryDB;encrypt=true;trustServerCertificate=true;";
        String dbUser = "minseokgo";
        String dbPass = "kms58325832@";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            String sql = "SELECT id, title, author FROM Books123 WHERE added_by = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, loggedInUser);
            rs = pstmt.executeQuery();

            if (!rs.isBeforeFirst()) {
                out.println("<p>등록한 책이 없습니다.</p>");
            } else {
    %>
    <table>
        <thead>
            <tr>
                <th>제목</th>
                <th>저자</th>
                <th>액션</th>
            </tr>
        </thead>
        <tbody>
            <%
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String title = rs.getString("title");
                    String author = rs.getString("author");
            %>
            <tr>
                <td><%= title %></td>
                <td><%= author %></td>
                <td>
                    <div class="action-buttons">
                        <a class="edit" href="editBook.jsp?id=<%= id %>">수정</a>
                        <a class="delete" href="deleteBook.jsp?id=<%= id %>" onclick="return confirm('삭제하시겠습니까?');">삭제</a>
                    </div>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    <%
            }
        } catch (Exception e) {
            out.println("<p>오류 발생: " + e.getMessage() + "</p>");
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
            if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
        }
    %>
</body>
</html>
