<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String email = request.getParameter("email");

    String dbURL = "jdbc:sqlserver://localhost:1433;databaseName=LibraryDB;encrypt=true;trustServerCertificate=true;";
    String dbUser = "minseokgo";
    String dbPass = "kms58325832@";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

        // `Users` 테이블에 데이터 삽입
        String sql = "INSERT INTO Users (username, password, email) VALUES (?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);
        pstmt.setString(2, password);
        pstmt.setString(3, email);

        int rows = pstmt.executeUpdate();
        if (rows > 0) {
            out.println("<script>alert('회원가입 성공! 로그인 페이지로 이동합니다.'); location.href='login.jsp';</script>");
        } else {
            out.println("<script>alert('회원가입에 실패했습니다. 다시 시도해주세요.'); history.back();</script>");
        }
    } catch (Exception e) {
        out.println("<script>alert('오류 발생: " + e.getMessage() + "'); history.back();</script>");
        e.printStackTrace();
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
    }
%>
