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
   
   <div class="label"><label for="hand">↓↓あなたの手を選んでください↓↓</label></div>
   <br>
    
   <form action="JankenServlet" method="GET">
    <div class="radio">
                <input type="radio" name="te" value="1" id="janken_gu" checked>
                <img src="/janken/janken_gu.png" alt="gu" class="gu-img">
                <input type="radio" name="te" value="2" id="janken_choki">
                <img src="/janken/janken_choki.png" alt="choki" class="gu-img">
                <input type="radio" name="te" value="3" id="janken_pa">
                <img src="/janken/janken_pa.png" alt="pa" class="gu-img">
            </div>
           <div class="janken_buttom"><input type="submit" value="じゃんけんする"></div>
        </form>
        
    <br>
    <br>
    <div class="center_footer"><jsp:include page="footer.jsp"/></div>
    </div>
    </div>
</body>
</html>