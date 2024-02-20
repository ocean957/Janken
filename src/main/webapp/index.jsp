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
    <%
    session.setAttribute("playerScore", 0); // 初期化
    session.setAttribute("cpuScore", 0); // 初期化
    session.setAttribute("gameCount", 0);
    %>
    <br>
    <div class="center_p"><p>5回勝負、3ポイント先取だよ！</p></div>
    <br>
    <br>
    <div class="center_buttom"><p>↓↓ボタンを押してはじめてね↓↓</p></div>
    <div class="index_buttom"><form action="enter.jsp" method="GET">
        <input type="submit" value="じゃんけんをはじめる">
    </form>
    </div>
    <br>
    <br>
    <jsp:include page="footer.jsp"/>
    </div>
    </div>
</body>
</html>
