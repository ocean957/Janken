<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>じゃんけんゲーム</title>
</head>
<body>
    <h1>じゃんけんゲーム</h1>
    <p>あなたの選んだ手は<%= handStr %>です。</p>
    <p>相手の選んだ手は<%= cpuHandStr %>です。</p>
    <p>結果: <%= resultStr %></p>

    <%-- ゲームが終了していない場合は再度じゃんけんをするフォームを表示 --%>
    <% if (gameCount < 3) { %>
        <form action="JankenServlet" method="GET">
            <label for="hand">あなたの手を選んでください：</label>
            <select name="hand" id="hand">
                <option value="1">グー</option>
                <option value="2">チョキ</option>
                <option value="3">パー</option>
            </select>
            <br>
            <input type="submit" value="じゃんけんする">
        </form>
    <% } %>

</body>
</html>
