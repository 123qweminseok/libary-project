<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.invalidate(); // 세션 종료
    response.sendRedirect("index.jsp"); // 메인 페이지로 리다이렉트
%>
