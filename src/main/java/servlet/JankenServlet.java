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
    
	// try-catchでなんらかのエラーが出た場合捕捉
    try {
    	// セッションを取得
    	HttpSession session = request.getSession(true);
    	
    	// プレイヤーの手を生成
    	String playerHandStr = request.getParameter("te");
        int playerHand = Integer.parseInt(playerHandStr);
        
        // CPUの手をランダム生成
        int cpuHand = (int) (Math.random() * 3) + 1;
        
        // プレイヤーのスコアを取得
        Integer playerScoreObj = getPlayerScore(request);
        int playerScore = (playerScoreObj != null) ? playerScoreObj : 0;
        
        // cpuのスコアを取得
        Integer cpuScoreObj = getCpuScore(request);
        int cpuScore = (cpuScoreObj != null) ? cpuScoreObj : 0;

        // 勝敗の判定
        int result = judge(playerHand, cpuHand);
        
        
        if (result == 1) { // プレイヤーの勝利
            playerScore ++;
            request.getSession().setAttribute("playerScore", playerScore);
          System.out.println("プレイヤースコア：" + playerScore);
        } else if (result == 2) { // cpuの勝ち
            cpuScore ++;
            request.getSession().setAttribute("cpuScore", cpuScore);
            System.out.println("CPUスコア：" + cpuScore);
        } else if (result == 0) { //引き分け
        	System.out.println("引き分け、スコアの変動なし");
        }
        
        // 試合数の取得
        int gameCount = getGameCount(request);
        
        //どちらかが3ポイント到達で最終結果を表示
      		if(playerScore == 3 || cpuScore == 3){
      			// どちらかが3ポイント先取に到達したらこのブロックに到達したか確認のためコンソールに出力
            	System.out.println("3ポイント先取 に到達");

            		// プレイヤースコアとcpuスコアの取得
            	   session.setAttribute("playerScore", playerScore);
                   session.setAttribute("cpuScore", cpuScore);
                  
                   // 勝者を判定
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
                   
                   // 勝者の判定をセッションスコープに保存
                   request.getSession().setAttribute("result", results);
                   
                   // プレイヤーの手を取得
                   String playerHandStrs = request.getParameter("te");
                   switch (playerHand) {
                       case 1:
                           playerHandStrs = "gu";
                           break;
                       case 2:
                           playerHandStrs = "choki";
                           break;
                       case 3:
                           playerHandStrs = "pa";
                           break;
                       default:
                           playerHandStrs = "未知の手";
                   }
                   
                   // プレイヤーの手をセッションスコープに保存
                   request.getSession().setAttribute("playerHand", playerHandStrs);

                   
                   // CPUの手を取得
                   String cpuHandStr = "";
                   switch (cpuHand) {
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
                   
                   // cpuの手をセッションスコープに保存
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
                   
                   // gameCountを保存
                   session.setAttribute("gameCount", gameCount += 1);
                   // 試合数をカウントしてコンソールに表示
                   System.out.println("試合カウント：" + gameCount);
                   
                   // finalResult.jspにフォワード
                   request.getRequestDispatcher("finalResult.jsp").forward(request, response);
                   return; // java.lang.IllegalStateExceptionを回避するためのreturn文
            } 
        	
        	if (gameCount < 4) { // 4試合目までの処理
            // プレイヤーの手とcpuの手と結果をリクエストにセット
            request.setAttribute("playerHand", playerHand);
            request.setAttribute("cpuHand", cpuHand);
            request.setAttribute("result", result);
            // gameCountを保存
            session.setAttribute("gameCount", gameCount += 1);
            // 試合数をカウントしてコンソールに表示
            System.out.println("試合カウント：" + gameCount);
            // ゲームが終了していない場合はresult.jspを表示
            request.getRequestDispatcher("result.jsp").forward(request, response);
           
	        } else { // 5試合目に到達した場合の処理
	        	 // スコアをセッションに保存
	            session.setAttribute("playerScore", playerScore);
	            session.setAttribute("cpuScore", cpuScore);
	            // 勝者を判定
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
	            
	            // 判定結果をセッションスコープに保存
	            request.getSession().setAttribute("result", results);
	            
	            // プレイヤーの手を取得
	            String playerHandStrs = "";
	            switch (playerHand) {
	                case 1:
	                    playerHandStrs = "gu";
	                    break;
	                case 2:
	                    playerHandStrs = "choki";
	                    break;
	                case 3:
	                    playerHandStrs = "pa";
	                    break;
	                default:
	                    playerHandStrs = "なし";
	            }
	            // プレイヤーの手をセッションスコープに保存
	            request.getSession().setAttribute("playerHand", playerHandStrs);
	
	            // CPUの手を取得
	           String cpuHandStr = "";
	            switch (cpuHand) {
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
	                    cpuHandStr = "なし";
	            }
	            // cpuの手をセッションスコープに保存
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
	
	            // gameCountを保存
	            session.setAttribute("gameCount", gameCount += 1);
	            // 試合数をカウントしてコンソールに表示
	            System.out.println("試合カウント：" + gameCount);
	            
	            // 勝者をリクエストにセット
	            request.getSession().setAttribute("winner", winner);
	
	            // finalResult.jspにフォワード
	            RequestDispatcher dispatchers = request.getRequestDispatcher("finalResult.jsp");
	            dispatchers.forward(request, response);
	            
	            // 最後のブロックに到達したか確認のためにコンソールに出力
	            System.out.println("finalに到達");
	        }
    } catch (Exception e) {// 例外が発生した場合に例外情報をログに記録する
        e.printStackTrace(); // 例外のスタックトレースを標準エラー出力に出力する
    }
    }
    
     
    // 試合判定のためのメソッド定義
    public static int judge(int playerHand, int cpuHand) {
    	if (playerHand == cpuHand) {
            return 0; // あいこ
        } else if ((playerHand == 1 && cpuHand == 2) || (playerHand == 2 && cpuHand == 3) || (playerHand == 3 && cpuHand == 1)) {
            return 1; // 勝ち
        } else {
            return 2; // 負け
        }
    	}
    // プレイヤースコアをセッションスコープに保存するためのメソッド
    private static int getPlayerScore(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Integer playerScore = (Integer) session.getAttribute("playerScore");
        return (playerScore != null) ? playerScore : 0; //初期値ではnullなので0が入るようにする
    }
    // cpuスコアをセッションスコープに保存するためのメソッド
    private static int getCpuScore(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Integer cpuScore = (Integer) session.getAttribute("cpuScore");
        return (cpuScore != null) ? cpuScore : 0; //初期値ではnullなので0が入るようにする
    }
    // 試合数をカウントするためのメソッド
    private static int getGameCount(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Integer gameCount = (Integer) session.getAttribute("gameCount");
        if (gameCount == null) {
            return 0; //初期値ではnullなので0が入るようにする
        } else {
            return (gameCount != null) ? gameCount : 0; //初期値ではnullなので0が入るようにする
        }
    }
}