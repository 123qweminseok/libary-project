<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Book</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: #f5f5f5;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        input, textarea, select {
            margin-bottom: 15px;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            padding: 10px;
            font-size: 16px;
            background: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Add a New Book</h2>
        <form action="addBookAction.jsp" method="post">
            <input type="text" name="title" placeholder="Title" required />
            <input type="text" name="author" placeholder="Author" required />
            <input type="text" name="genre" placeholder="Genre (Optional)" />
            <input type="text" name="isbn" placeholder="ISBN (Optional)" />
            <input type="text" name="publisher" placeholder="Publisher (Optional)" />
            <input type="date" name="publish_date" placeholder="Publish Date (Optional)" />
            <input type="number" name="copies_available" placeholder="Copies Available" min="0" required />
            <textarea name="description" placeholder="Description" rows="5" required></textarea>
            <button type="submit">Add Book</button>
        </form>
    </div>
</body>
</html>
