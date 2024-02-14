package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/JankenServlet")
public class JankenServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // ゲームが開始されるタイミングでセッションのゲーム回数を初期化
    try {	HttpSession session = request.getSession(true);
    	
    	
    	String playerHandStr = request.getParameter("hand");
        int playerHand = Integer.parseInt(playerHandStr);
        
        
        Integer playerScoreObj = getPlayerScore(request);
        int playerScore = (playerScoreObj != null) ? playerScoreObj : 0;

        Integer cpuScoreObj = getCpuScore(request);
        int cpuScore = (cpuScoreObj != null) ? cpuScoreObj : 0;

        
        

        // CPUの手をランダム生成
        int cpuHand = (int) (Math.random() * 3) + 1;
        
        int result = judge(playerHand, cpuHand);
        
        
        if (result == 1) { // プレイヤーの勝利
            playerScore ++;
            request.getSession().setAttribute("playerScore", playerScore);
          System.out.println("プレイヤースコア：" + playerScore);
        } else if (result == 2) { // プレイヤーの敗北
            cpuScore ++;
            request.getSession().setAttribute("cpuScore", cpuScore);
            System.out.println("CPUスコア：" + cpuScore);
        } else if (result == 0) {
        	System.out.println("引き分け、スコアの変動なし");
        }
       
        
        int gameCount = getGameCount(request);
        
        
        
        
        
        
       
        // どちらかのポイントが3点未満の場合繰り返す
        
      	if(playerScore == 3 || cpuScore == 3){
            	System.out.println("3ポイント先取 に到達");

            	   session.setAttribute("playerScore", playerScore);
                   session.setAttribute("cpuScore", cpuScore);
                  
                   
                   
                   String results = "";
                   switch(result) {
                   case 1 :
                   	results = "プレイヤーの勝ちでした！！";
                   	break;
                   case 2 :
                   	results = "CPUの勝ちでした！！";
                   	break;
                   case 0 :
                   	results = "引き分けでした！！";
                   	break;
                   }
                   request.getSession().setAttribute("result", results);
                   
                   
                   String playerHandStrs = "";
                   switch (playerHand) {
                       case 1:
                           playerHandStrs = "グー";
                           break;
                       case 2:
                           playerHandStrs = "チョキ";
                           break;
                       case 3:
                           playerHandStrs = "パー";
                           break;
                       default:
                           playerHandStrs = "未知の手";
                   }
                   request.getSession().setAttribute("playerHand", playerHandStrs);

                   // CPUの手を取得
                   String cpuHandStr = "";
                   switch (cpuHand) {
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
                   request.getSession().setAttribute("cpuHand", cpuHandStr);

                   // 勝者を判定
                   String winner;
                   if (playerScore > cpuScore) {
                       winner = "あなたの勝ちー";
                   } else if (playerScore < cpuScore) {
                       winner = "CPUの勝ちー";
                   } else {
                       winner = "引き分け";
                   }

                   // 勝者をリクエストにセット
                   request.getSession().setAttribute("winner", winner);
                   
                   
                   

                   // JSPにフォワード
                   request.getRequestDispatcher("finalResult.jsp").forward(request, response);
                   return;
                  
            } 
        	
        	if (gameCount < 4) {
            // プレイヤーの手と結果をリクエストにセット
            request.setAttribute("playerHand", playerHand);
            request.setAttribute("cpuHand", cpuHand);
            request.setAttribute("result", result);
            
            
            session.setAttribute("gameCount", gameCount + 1);
            System.out.println("試合カウント：" + gameCount);
            // ゲームが終了していない場合は結果を表示
            request.getRequestDispatcher("result.jsp").forward(request, response);

           //どちらかが3ポイント到達で最終結果を表示
        } else {
        	 // スコアをセッションに保存
            session.setAttribute("playerScore", playerScore);
            session.setAttribute("cpuScore", cpuScore);
           
            
            
            String results = "";
            switch(result) {
            case 1 :
            	results = "プレイヤーの勝ちでした！！";
            	break;
            case 2 :
            	results = "CPUの勝ちでした！！";
            	break;
            case 0 :
            	results = "引き分けでした！！";
            	break;
            }
            request.getSession().setAttribute("result", results);
            
            
            String playerHandStrs = "";
            switch (playerHand) {
                case 1:
                    playerHandStrs = "グー";
                    break;
                case 2:
                    playerHandStrs = "チョキ";
                    break;
                case 3:
                    playerHandStrs = "パー";
                    break;
                default:
                    playerHandStrs = "未知の手";
            }
            request.getSession().setAttribute("playerHand", playerHandStrs);

            // CPUの手を取得
            String cpuHandStr = "";
            switch (cpuHand) {
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
            request.getSession().setAttribute("cpuHand", cpuHandStr);

            // 勝者を判定
            String winner;
            if (playerScore > cpuScore) {
                winner = "あなたの勝ちー";
            } else if (playerScore < cpuScore) {
                winner = "CPUの勝ちー";
            } else {
                winner = "引き分け";
            }

            // 勝者をリクエストにセット
            request.setAttribute("winner", winner);
            
            
            

            // JSPにフォワード
            RequestDispatcher dispatchers = request.getRequestDispatcher("finalResult.jsp");
            dispatchers.forward(request, response);
            System.out.println("finalに到達");
        }
    } catch (Exception e) {
        // 例外が発生した場合に例外情報をログに記録する
        e.printStackTrace(); // 例外のスタックトレースを標準エラー出力に出力する
    }
    }
    
     

    private static int judge(int playerHand, int cpuHand) {
        if (playerHand == cpuHand) {
            return 0;
        } else if ((playerHand + 1) % 3 == cpuHand) {
            return 1;
        } else {
            return 2;
        }
    }

   

    private static int getPlayerScore(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Integer playerScore = (Integer) session.getAttribute("playerScore");
        return (playerScore != null) ? playerScore : 0;
    }

    private static int getCpuScore(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Integer cpuScore = (Integer) session.getAttribute("cpuScore");
        return (cpuScore != null) ? cpuScore : 0;
    }
    
    private static int getGameCount(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Integer gameCount = (Integer) session.getAttribute("gameCount");
        if (gameCount == null) {
            return 0;
        } else {
            return (gameCount != null) ? gameCount : 0;
        }
    }
    
}