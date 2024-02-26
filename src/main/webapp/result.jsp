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
    <div class="result_h1"><h1>じゃんけん結果</h1></div>
<%
   Integer playerScore = (Integer) request.getSession().getAttribute("playerScore");
   Integer cpuScore = (Integer) request.getSession().getAttribute("cpuScore");
    
    	Integer playerHandObj = (Integer) request.getAttribute("playerHand");
        int playerHand = (playerHandObj != null) ? playerHandObj.intValue() : 0;
        
        Integer cpuHandObj = (Integer) request.getAttribute("cpuHand");
        int cpuHand;
        if (cpuHandObj != null) {
            cpuHand = cpuHandObj.intValue();
        } else {
            cpuHand = 0;
        }
        int result = (request.getAttribute("result") != null) ? (int) request.getAttribute("result") : 0;
        
    	
        String handStr = "";
        String cpuHandStr = "";

        switch (playerHand) {
            case 1:
                handStr = "gu";
                 request.getSession().setAttribute("playerHand", playerHand); 
                break;
            case 2:
                handStr = "choki";
                 request.getSession().setAttribute("playerHand", playerHand); 
                break;
            case 3:
                handStr = "pa";
                 request.getSession().setAttribute("playerHand", playerHand); 
                break;
            default:
                handStr = "未知の手";
        }

        
            switch (cpuHandObj.intValue()) {
                case 1:
                    cpuHandStr = "gu";
                    break;
                case 2:
                    cpuHandStr = "choki";
                    break;
                case 3:
                    cpuHandStr = "pa";
                    break;
                default:
                    cpuHandStr = "未知の手";
            }
       
        String resultStr = "";
        switch (result) {
        case 0:
            resultStr = "引き分けです！";
            break;
        case 1:
            resultStr = "あなたの勝ちです！";
            break;
        case 2:
            resultStr = "あなたの負けです！";
            break;
    }
%>
		<br>
		<div class="result_p"><p>現在：<%= request.getSession().getAttribute("gameCount") %> 試合目でございます！</p></div>
		<br>
		<div class="result_p"><p>あなたの選んだ手は：　<img src="/janken/janken_<%= handStr %>.png" alt="<%= handStr %>" class="hand" width="40px" height="40px"></div>
        <br>
        <div class="result_p"><p>ＣＰＵの選んだ手は：　<img src="/janken/janken_<%= cpuHandStr %>.png" alt="<%= cpuHandStr %>" class="hand" width="40px" height="40px"></p></div>
        <br>
        <br>
        <div class="result_kekka_p"><p>結果: <%= resultStr %></p></div>
        <br>
        <P>～今の勝敗は～</P>
        <p>あなた：<%= (Integer) request.getSession().getAttribute("playerScore") %>　CPU：<%= (Integer) request.getSession().getAttribute("cpuScore") %></p>
        <br>
       <%-- 勝負が決まっていない場合は再度じゃんけんをする --%>
       <div class="label"><label for="hand">↓↓あなたの手を選んでください↓↓</label></div>
    
    <form action="JankenServlet" method="GET">
    <div class="radio">
                <input type="radio" class="radio_position_result" name="te" value="1" checked>
                <img src="/janken/janken_gu.png" alt="gu" class="img_result" width="45px" height="45px">
                <input type="radio" class="radio_position_result" name="te" value="2">
                <img src="/janken/janken_choki.png" alt="choki" class="img_result" width="45px" height="45px">
                <input type="radio" class="radio_position_result" name="te" value="3">
                <img src="/janken/janken_pa.png" alt="pa" class="img_result" width="45px" height="45px">
           
            </div>
           <div class="janken_buttom"><input class="button" type="submit" value="じゃんけんする"></div>
        </form>
          
         <% System.out.println("じゃんけんに到達"); %>
         
   <jsp:include page="footer.jsp"/>
   </div>
   </div>
</body>
</html>