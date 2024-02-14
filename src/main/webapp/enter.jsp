<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="Janken.css">
    <title>じゃんけん5番勝負</title>
</head>
<body>
<div class="center_parent">
	<div class="center_item">
    <h1>じゃんけん5番勝負</h1>
   <div class="center_p"><p>最初の試合を始めましょう！！</p></div>
    <form action="JankenServlet" method="GET">
       <div class="label"><label for="hand">↓↓あなたの手を選んでください↓↓</label></div>
        <select name="hand" id="hand">
            <option value="1">グー</option>
            <option value="2">チョキ</option>
            <option value="3">パー</option>
        </select>
        <br>
        <br>
        <input type="submit" value="じゃんけんする">
    </form>
    <br>
    <br>
    <div class="center_footer"><jsp:include page="footer.jsp"/></div>
    </div>
    </div>
</body>
</html>