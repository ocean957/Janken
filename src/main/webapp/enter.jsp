<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>じゃんけんゲーム</title>
</head>
<body>

    <h1>じゃんけんゲーム</h1>
    <form action="JankenServlet" method="GET">
        <label for="hand">あなたの手を選んでください：</label>
        <select name="hand" id="hand">
            <option value="1">グー</option>
            <option value="2">チョキ</option>
            <option value="3">パー</option>
        </select>
        <br>
        <br>
        <input type="submit" value="じゃんけんする">
    </form>
    
    
    
    
    
    
</body>
</html>