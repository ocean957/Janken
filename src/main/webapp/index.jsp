<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="Janken.css">
    <title>じゃんけん5番勝負</title>
</head>
<body>
<div class="center_parent_child">
	<div class="center_item">
    <h1>じゃんけん5番勝負</h1>
    <%
    session.setAttribute("playerScore", 0); // 初期化
    session.setAttribute("cpuScore", 0); // 初期化
    session.setAttribute("gameCount", 0); // 初期化
    %>
    <br>
    <div class="center_p"><p>5回勝負、3ポイント先取だよ！</p></div>
    <br>
    <br>
    <div class="center_button"><p>↓↓ボタンを押してはじめてね↓↓</p></div>
    <div class="index_button"><form action="enter.jsp" method="GET">
        <div class=".janken_button_index"><input class="button" type="submit" value="じゃんけんをはじめる"></div>
    </form>
    </div>
    <br>
    <jsp:include page="footer.jsp"/>
    </div>
    </div>
</body>
</html>
