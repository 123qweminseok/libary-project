<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Search Books</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: url('images/lib.webp') no-repeat center center fixed;
            background-size: cover;
            color: #fff;
        }
        .container {
            max-width: 600px;
            margin: 100px auto;
            background-color: rgba(0, 0, 0, 0.7);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            text-align: center;
        }
        h2 {
            font-size: 28px;
            margin-bottom: 20px;
        }
        form {
            margin: 20px 0;
        }
        input[type="text"], select {
            width: 80%;
            padding: 10px;
            margin: 10px 0;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #ff6f61;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #e55d50;
        }
        .footer {
            margin-top: 20px;
            font-size: 14px;
            color: #ccc;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>📚 Search for a Book</h2>
        <p>Find your favorite book in our digital library.</p>

        <!-- 일반 검색 -->
        <form action="searchResult.jsp" method="get">
            <input type="text" name="title" id="title" placeholder="Search by Title (e.g., 별이 빛나는 밤에)" required /><br/>
            <input type="submit" value="Search by Title" />
        </form>

        <!-- 장르별 검색 -->
        <form action="searchResult.jsp" method="get">
            <select name="genre">
                <option value="" disabled selected>Select Genre</option>
                <option value="소설">소설</option>
                <option value="판타지">판타지</option>
                <option value="자기계발">자기계발</option>
                <option value="과학">과학</option>
                <option value="역사">역사</option>
            </select><br/>
            <input type="submit" value="Search by Genre" />
        </form>

        <!-- 저자별 검색 -->
        <form action="searchResult.jsp" method="get">
            <input type="text" name="author" placeholder="Search by Author (e.g., 정수민)" required /><br/>
            <input type="submit" value="Search by Author" />
        </form>

        <div class="footer">
            <p>&copy; 2024 My Library. All Rights Reserved.</p>
        </div>
    </div>
</body>
</html>
