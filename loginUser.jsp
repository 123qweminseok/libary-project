<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    // 사용자 입력 가져오기
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // 데이터베이스 연결 정보
    String dbURL = "jdbc:sqlserver://localhost:1433;databaseName=LibraryDB;encrypt=true;trustServerCertificate=true;";
    String dbUser = "minseokgo";
    String dbPass = "kms58325832@";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // 데이터베이스 연결
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

        // SQL 쿼리로 사용자 인증
        String sql = "SELECT * FROM Users WHERE username = ? AND password = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);
        pstmt.setString(2, password);

        rs = pstmt.executeQuery();

        if (rs.next()) {
            // 로그인 성공: 세션에 사용자 정보 저장
            session.setAttribute("username", username);
            out.println("<script>alert('로그인 성공!'); location.href='index.jsp';</script>");
        } else {
            // 로그인 실패: 메시지 출력 후 이전 페이지로 돌아감
            out.println("<script>alert('로그인 실패: 사용자 이름 또는 비밀번호를 확인하세요.'); history.back();</script>");
        }
    } catch (Exception e) {
        // 오류 발생 시 메시지 출력
        out.println("<script>alert('오류 발생: " + e.getMessage() + "'); history.back();</script>");
        e.printStackTrace();
    } finally {
        // 리소스 정리
        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
    }
%>
