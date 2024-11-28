<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>대출 처리</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 20px;
        }
        .message {
            font-size: 18px;
            margin-bottom: 20px;
        }
        .back-link {
            text-decoration: none;
            color: white;
            background: #007BFF;
            padding: 10px 20px;
            border-radius: 5px;
        }
        .back-link:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
    <div class="message">
        <%
            String loggedInUser = (String) session.getAttribute("username");
            if (loggedInUser == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            String bookId = request.getParameter("id");
            if (bookId == null || bookId.isEmpty()) {
                out.println("<p class='error'>대출할 책의 ID가 누락되었습니다.</p>");
                return;
            }

            String dbURL = "jdbc:sqlserver://localhost:1433;databaseName=LibraryDB;encrypt=true;trustServerCertificate=true;";
            String dbUser = "minseokgo";
            String dbPass = "kms58325832@";

            Connection conn = null;
            PreparedStatement pstmt1 = null;
            PreparedStatement pstmt2 = null;

            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                // 1. Loans 테이블에 대출 기록 삽입
                String loanInsertSQL = "INSERT INTO Loans (book_id, borrowed_by) VALUES (?, ?)";
                pstmt1 = conn.prepareStatement(loanInsertSQL);
                pstmt1.setInt(1, Integer.parseInt(bookId));
                pstmt1.setString(2, loggedInUser);
                pstmt1.executeUpdate();

                // 2. Books123 테이블의 상태를 'borrowed'로 변경
                String bookUpdateSQL = "UPDATE Books123 SET status = 'borrowed' WHERE id = ?";
                pstmt2 = conn.prepareStatement(bookUpdateSQL);
                pstmt2.setInt(1, Integer.parseInt(bookId));
                pstmt2.executeUpdate();

                out.println("<p class='success'>책이 성공적으로 대출되었습니다!</p>");
            } catch (Exception e) {
                out.println("<p class='error'>오류 발생: " + e.getMessage() + "</p>");
            } finally {
                if (pstmt1 != null) try { pstmt1.close(); } catch (SQLException ignore) {}
                if (pstmt2 != null) try { pstmt2.close(); } catch (SQLException ignore) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
            }
        %>
    </div>
    <a class="back-link" href="index.jsp">메인 페이지로 돌아가기</a>
</body>
</html>
