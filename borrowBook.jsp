<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>책 대출</title>
    <style>
        body {
            font-family: 'Times New Roman', serif;
            margin: 0;
            padding: 20px;
            background: #f5f5f5;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: white;
        }
        table th, table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        table th {
            background-color: #f2f2f2;
        }
        .action {
            color: white;
            background: #007BFF;
            text-decoration: none;
            padding: 5px 10px;
            border-radius: 4px;
        }
        .action:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
    <h1>대출 가능한 책 목록</h1>
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

            String sql = "SELECT id, title, author FROM Books123 WHERE status = 'available'";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
    %>
    <table>
        <thead>
            <tr>
                <th>제목</th>
                <th>저자</th>
                <th>대출</th>
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
                    <a class="action" href="borrowBookAction.jsp?id=<%= id %>">대출하기</a>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    <%
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
