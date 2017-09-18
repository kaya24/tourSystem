package tsys.sales.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("/FrontCont")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		String page = null;

		req.setCharacterEncoding("UTF-8");
		String buttonid = req.getParameter("BUTTON_ID");

		ActionInterface action = null;
		if (buttonid == null) {
			buttonid = "bc001_CustTop";
		}

		switch (buttonid) {
		// 顧客ヘッダー [社名]
		case "bc000_Logo":
			action = new BC000LogoAction();
			page = action.execute(req);
			break;

		// 顧客フッター [TOPページ]
		case "bc001_CustTop":
			action = new BC000TopAction();
			page = action.execute(req);
			break;

		// 顧客ヘッダー [ログイン]
		case "bc000_Login":
			action = new BC000LoginAction();
			page = action.execute(req);
			break;

		// 顧客ヘッダー [ログアウト]
		case "bc000_Logout":
			action = new BC000LogoutAction();
			page = action.execute(req);
			break;

		// 顧客ヘッダー [ショッピングカート]
		case "bc000_ShoppingCart":
			action = new BC000ShoppingCartAction();
			page = action.execute(req);
			break;

		// ログイン [ログイン]
		case "b101_Login":
			action = new B101LoginAction();
			page = action.execute(req);
			break;

		case "b202_OrderDeleteCheck":
			action = new B202OrderDeleteCheckAction();
			page = action.execute(req);
			break;

		// 顧客トップ　パッケージツアー [検索]
		case "bc001_PackageTour":
			action = new BC001PackageTourAction();
			page = action.execute(req);
			break;
		// パッケージツアー検索 [検索]
		case "b602_PackageTourSearch":
			action = new B602PackageTourSearchAction();
			page = action.execute(req);
			break;
		// パッケージツアー商品一覧 [商品コード]
		case "b601_PackageTourDetail":
			action = new B602PackageTourListDetailAction();
			page = action.execute(req);
			break;

		// パッケージツアー商品詳細 [戻る]
		case "b601_DetailListBack":
			action = new B601DetailListBackAction();
			page = action.execute(req);
			break;

		// パッケージツアー商品詳細 [カートに入れる]
		case "b601_DetailPutCart":
			action = new B801DetailPutCartAction();
			page = action.execute(req);
			break;

		// パッケージツアー商品詳細 [カートを見る]
		case "b601_DetailViewCart":
			action = new B801DetailViewCartAction();
			page = action.execute(req);
			break;

		// ショッピングカート 商品コード(リンク)
		case "b201_CartDetailBack":
			action = new B201CartDetailBackAction();
			page = action.execute(req);
			break;

		// ショッピングカート [削除]
		case "b201_CartDelete":
			action = new B201CartDeleteAction();
			page = action.execute(req);
			break;

		//ショッピングカート [購入]
		case "b201_CartPurchase":
			action = new B201CartPurchaseAction();
			page = action.execute(req);
			break;
		}


		RequestDispatcher rd = req.getRequestDispatcher("/jsp" + page);
		rd.forward(req, res);
	}

}
