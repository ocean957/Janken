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
                handStr = "グー";
                 request.getSession().setAttribute("playerHand", playerHand); 
                break;
            case 2:
                handStr = "チョキ";
                 request.getSession().setAttribute("playerHand", playerHand); 
                break;
            case 3:
                handStr = "パー";
                 request.getSession().setAttribute("playerHand", playerHand); 
                break;
            default:
                handStr = "未知の手";
        }

        
            switch (cpuHandObj.intValue()) {
                case 1:
                    cpuHandStr = "グー";
                    break;
                case 2:
                    cpuHandStr = "チョキ";
                    break;
                case 3:
                    cpuHandStr = "パー";
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
		<div class="result_p"><p>現在：<%= request.getSession().getAttribute("gameCount") %> 試合目でございます！</p></div>
        <div class="result_p"><p>あなたの選んだ手は：<%= handStr  %>です。</p></div>
        <div class="result_p"><p>相手の選んだ手は：<%= cpuHandStr  %>です。</p></div>
        <div class="result_kekka_p"><p>結果: <%= resultStr %></p></div>
        <P>今の勝敗は～</P>
       <p>あなた：<%= (Integer) request.getSession().getAttribute("playerScore") %>　CPU：<%= (Integer) request.getSession().getAttribute("cpuScore") %></p>
        <%-- 勝負が決まっていない場合は再度じゃんけんをする --%>
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
         <% System.out.println("じゃんけんに到達"); %>
         <br>
         <br>
   <div class="center_footer"><jsp:include page="footer.jsp"/></div>
   </div>
   </div>
   
</body>
</html>