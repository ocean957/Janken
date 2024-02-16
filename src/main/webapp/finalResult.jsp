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
	
	
	
	
	
    <h1>じゃんけん最終結果</h1>
   
   <div class="result_p"><p>あなたの最後の手は：　<img src="/janken/janken_<%= session.getAttribute("playerHand") %>.png" alt="p" width="30%" height="30%"></div>
   <div class="result_p"><p>CPUの最後の手は：　<img src="/janken/janken_<%= session.getAttribute("cpuHand") %>.png" alt="p" width="30%" height="30%"></div> 
    <div class="center_final_p"><p>最後の勝負の結果は～：<%= session.getAttribute("result") %></p></div>
    <br>
	<!-- ゲームカウントを表示する -->
	<p>合計で <%= session.getAttribute("gameCount") %> 試合しました！</p>
    <p>プレイヤーの最終スコア: <%= session.getAttribute("playerScore") %></p>
    <p>CPUの最終スコア: <%=  session.getAttribute("cpuScore") %></p>
    <p>最終勝者: <%= session.getAttribute("winner") %></p>
    <br>
    <form action="index.jsp" method="GET">
        <input type="submit" value="もう一度じゃんけんする？">
    </form>
    <br>
    <div class="center_footer"><jsp:include page="footer.jsp"/></div>
    </div>
    </div>
</body>
</html>
