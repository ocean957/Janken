<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>じゃんけんゲーム</title>
</head>
<body>
    <h1>じゃんけんゲーム</h1>
    
    <%
    session.setAttribute("playerScore", 0); // 初期化
    session.setAttribute("cpuScore", 0); 
    %>
    
    
    <form action="enter.jsp" method="GET">
        <input type="submit" value="じゃんけんをはじめる">
    </form>

    
</body>
</html>
