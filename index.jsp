<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Library Home</title>
    <style>
        body {
            font-family: 'Times New Roman', serif;
            margin: 0;
            padding: 0;
            background: url('images/SKULIB.jpg') no-repeat center center fixed;
            background-size: cover;
            color: white;
        }
        .header {
            background: rgba(0, 0, 0, 0.7);
            color: #f4f4f9;
            text-align: center;
            padding: 20px 0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
            position: relative;
        }
        .header h1 {
            font-size: 3em;
            margin: 0;
        }
        .login-bar {
            position: absolute;
            top: 10px;
            right: 10px;
            background: rgba(0, 0, 0, 0.8);
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            text-align: center;
        }
        .login-bar form {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .login-bar input {
            padding: 5px;
            font-size: 14px;
            border: none;
            border-radius: 3px;
            width: 120px;
        }
        .login-bar button {
            padding: 5px 10px;
            background: #ff5722;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-size: 14px;
            transition: background 0.3s ease-in-out;
        }
        .login-bar button:hover {
            background: #e64a19;
        }
        .menu-container {
            position: fixed;
            top: 0;
            left: -250px;
            height: 100%;
            width: 250px;
            background: linear-gradient(to right, #6a11cb, #2575fc);
            color: white;
            overflow-y: auto;
            transition: left 0.3s ease;
            z-index: 1000;
            box-shadow: 4px 0 8px rgba(0, 0, 0, 0.3);
        }
        .menu-container ul {
            padding: 20px;
            margin: 0;
            list-style: none;
        }
        .menu-container li {
            margin: 20px 0;
            text-align: center;
            font-size: 18px;
        }
        .menu-container li a {
            text-decoration: none;
            color: white;
        }
        .menu-toggle {
            position: fixed;
            top: 20px;
            left: 20px;
            background: #ff5722;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            z-index: 1001;
        }
        .menu-toggle:hover {
            background: #e64a19;
        }
        .main {
            text-align: center;
            margin: 50px auto;
            background: rgba(0, 0, 0, 0.5);
            padding: 30px;
            width: 80%;
            max-width: 800px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.7);
        }
        .main h2 {
            font-size: 2em;
            margin-bottom: 20px;
            text-transform: uppercase;
        }
        .link {
            display: inline-block;
            margin: 10px;
            padding: 15px 30px;
            background: #ff5722;
            color: white;
            text-decoration: none;
            font-size: 1.2em;
            font-weight: bold;
            border-radius: 50px;
            transition: background 0.3s ease-in-out;
        }
        .link:hover {
            background: #e64a19;
            transform: scale(1.05);
        }
        .book-list {
            margin-top: 20px;
            text-align: left;
            background: rgba(0, 0, 0, 0.7);
            padding: 20px;
            border-radius: 10px;
            color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
            overflow-y: auto;
            max-height: 300px;
        }
        .book-list ul {
            list-style: none;
            padding: 0;
        }
        .book-list li {
            margin: 10px 0;
        }
    </style>
    <script>
        function toggleMenu() {
            const menu = document.querySelector('.menu-container');
            if (menu.style.left === '0px') {
                menu.style.left = '-250px';
            } else {
                menu.style.left = '0px';
            }
        }
    </script>
</head>
<body>
    <div class="header">
        <h1>SKU 기부 도서관</h1>
        <div class="login-bar">
            <%
                String loggedInUser = (String) session.getAttribute("username");
                if (loggedInUser != null) {
            %>
                <p><strong><%= loggedInUser %></strong> 님이 로그인 중입니다.</p>
                <form action="logout.jsp" method="post">
                    <button type="submit">로그아웃</button>
                </form>
            <%
                } else {
            %>
                <form action="loginUser.jsp" method="post">
                    <input type="text" name="username" placeholder="아이디" required />
                    <input type="password" name="password" placeholder="비밀번호" required />
                    <button type="submit">로그인</button>
                </form>
            <%
                }
            %>
        </div>
    </div>

    <button class="menu-toggle" onclick="toggleMenu()">☰ 메뉴</button>

    <div class="menu-container">
        <ul>
            <li><a href="#">독서마라톤</a></li>
            <li><a href="#">전자도서관</a></li>
            <li><a href="#">문화행사신청</a></li>
            <li><a href="#">희망도서신청</a></li>
            <li><a href="#">스마트도서관</a></li>
            <li><a href="#">이용안내</a></li>
            <li><a href="#">도서관소개</a></li>
        </ul>
    </div>

    <div class="main">
        <h2>Explore Our Vast Library</h2>
        <a class="link" href="register.jsp">Sign Up</a>
        <a class="link" href="searchBook.jsp">Search Books</a>
        <%
            if (loggedInUser != null) {
        %>
        <a class="link" href="addBook.jsp">Add Book</a>
        <a class="link" href="viewMyBooks.jsp">내가 등록한 책 보기</a>
        <%
            }
        %>
        <h2>📚 현재 소장 중인 책장</h2>
        <div class="book-list">
            <ul>
                <%
                    String dbURL = "jdbc:sqlserver://localhost:1433;databaseName=LibraryDB;encrypt=true;trustServerCertificate=true;";
                    String dbUser = "minseokgo";
                    String dbPass = "kms58325832@";
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
                        stmt = conn.createStatement();

                        String sql = "SELECT title, author FROM Books123 ORDER BY id";
                        rs = stmt.executeQuery(sql);

                        while (rs.next()) {
                            String title = rs.getString("title");
                            String author = rs.getString("author");
                            out.println("<li><strong>" + title + "</strong> by " + author + "</li>");
                        }
                    } catch (Exception e) {
                        out.println("<p>책 데이터를 가져오는 중 오류가 발생했습니다: " + e.getMessage() + "</p>");
                    } finally {
                        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                        if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
                    }
                %>
            </ul>
        </div>
    </div>
</body>
</html>
