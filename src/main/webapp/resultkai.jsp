<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>じゃんけん結果</title>
</head>
<body>
    <h1>じゃんけん結果</h1>
    
    <%-- プレイヤーの手 --%>
    <p>あなたの手: 
        <% 
            int playerHand = (int) request.getAttribute("playerHand");
            switch(playerHand) {
                case 1:
                    out.println("グー");
                    break;
                case 2:
                    out.println("チョキ");
                    break;
                case 3:
                    out.println("パー");
                    break;
            }
        %>
    </p>
    
    <%-- CPUの手 --%>
    <p>CPUの手: 
        <% 
            int cpuHand = (int) request.getAttribute("cpuHand");
            switch(cpuHand) {
                case 1:
                    out.println("グー");
                    break;
                case 2:
                    out.println("チョキ");
                    break;
                case 3:
                    out.println("パー");
                    break;
            }
        %>
    </p>
    
    <%-- 勝敗結果 --%>
    <p>結果: 
        <% 
            int result = (int) request.getAttribute("result");
            switch(result) {
                case 0:
                    out.println("引き分け");
                    break;
                case 1:
                    out.println("勝ち");
                    break;
                case 2:
                    out.println("負け");
                    break;
            }
        %>
    </p>
</body>
</html>
