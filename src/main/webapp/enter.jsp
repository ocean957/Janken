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
    <br>
   <div class="center_p"><p>最初の試合を始めましょう</p></div>
   <br>
   <div class="label"><label for="hand">↓↓あなたの手を選んでください↓↓</label></div>
   <form action="JankenServlet" method="GET">
    <div class="radio_enter">
                <input type="radio" class="radio_position" name="te" value="1" id="janken_gu" checked>
                <img src="/janken/janken_gu.png" alt="gu" class="img_enter" width="45px" height="45px">
                <input type="radio" class="radio_position" name="te" value="2" id="janken_choki">
                <img src="/janken/janken_choki.png" alt="choki" class="img_enter" width="45px" height="45px">
                <input type="radio" class="radio_position" name="te" value="3" id="janken_pa">
                <img src="/janken/janken_pa.png" alt="pa" class="img_enter" width="45px" height="45px">
            </div>
          
           <div class="janken_buttom"><input type="submit" value="じゃんけんする"></div>
        </form>
        
        
    <br>
    <br>
   <jsp:include page="footer.jsp"/>
    </div>
    </div>
</body>
</html>