<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>じゃんけん最終結果</title>
</head>
<body>
    <h1>じゃんけん最終結果</h1>

   
    
    <p>あなたの最後の手: <%= session.getAttribute("playerHand") %></p>
    <p>CPUの最後の手: <%= session.getAttribute("cpuHand") %></p>
    <p>最後の勝負の結果は～：<%= session.getAttribute("result") %></p>
    
    <p>プレイヤーのスコア: <%= session.getAttribute("playerScore") %></p>
    <p>CPUのスコア: <%=  session.getAttribute("cpuScore") %></p>
    <p>勝者: <%= request.getAttribute("winner") %></p>
    
    <form action="index.jsp" method="GET">
        <input type="submit" value="もう一度じゃんけんする？">
    </form>
</body>
</html>