<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>내가 대출한 책</title>
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
    </style>
</head>
<body>
    <h1>내가 대출한 책</h1>
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

            // 대출된 책을 가져오는 SQL 쿼리
            String sql = "SELECT B.title, B.author, L.borrowed_at " +
                         "FROM Loans L " +
                         "JOIN Books123 B ON L.book_id = B.id " +
                         "WHERE L.borrowed_by = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, loggedInUser);
            rs = pstmt.executeQuery();

            if (!rs.isBeforeFirst()) {
                out.println("<p>대출한 책이 없습니다.</p>");
            } else {
    %>
    <table>
        <thead>
            <tr>
                <th>제목</th>
                <th>저자</th>
                <th>대출 날짜</th>
            </tr>
        </thead>
        <tbody>
            <%
                while (rs.next()) {
                    String title = rs.getString("title");
                    String author = rs.getString("author");
                    String borrowedAt = rs.getString("borrowed_at");
            %>
            <tr>
                <td><%= title %></td>
                <td><%= author %></td>
                <td><%= borrowedAt %></td>
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
