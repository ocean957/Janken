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
	<br>
    <h1>じゃんけん最終結果</h1>
    <div class="result_p"><p>あなたの最後の手は：　<img src="/janken/janken_<%= session.getAttribute("playerHand") %>.png" alt="p" class="hand" width="25%" height="25%"></div>
    <br>
    <div class="result_p"><p>ＣＰＵの最後の手は：　<img src="/janken/janken_<%= session.getAttribute("cpuHand") %>.png" alt="p" class="hand" width="25%" height="25%"></div> 
    <br>
    <div class="center_final_p"><p>最後の勝負の結果は：<%= session.getAttribute("result") %></p></div>
	<!-- ゲームカウントを表示する -->
	<br>
	<br>
	<p>合計で <%= session.getAttribute("gameCount") %> 試合しました！</p>
    <br>
    <p>プレイヤーの最終スコア: <%= session.getAttribute("playerScore") %></p>
    <p>CPUの最終スコア: <%=  session.getAttribute("cpuScore") %></p>
    <br>
    <br>
    <p>最終勝者: <%= session.getAttribute("winner") %></p>
    <br>
    <form action="index.jsp" method="GET">
        <div class="janken_buttom"><input class="button" type="submit" value="もう一度じゃんけんする？"></div>
    </form>
    <br>
    <jsp:include page="footer.jsp"/>
    </div>
    </div>
</body>
</html>