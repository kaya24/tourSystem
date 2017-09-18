package tsys.sales.web;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import tsys.sales.entity.Item;

public class B201CartPurchaseAction implements ActionInterface{

	@SuppressWarnings("unchecked")
	public String execute(HttpServletRequest req) {
		String page = "/UC200/b201G02_ConfirmOrder.jsp";

		// 予約人数の取得
		String[] quantity = req.getParameterValues("quantity");
		// 小計をそのまま取得できないので、計算するか、javascriptで値を送るか。
		//String[] total = req.getParameterValues("total");

		ArrayList<Item> itemList = null;

		// セッションの取得
		HttpSession session = req.getSession(false);

		// "B201ShoppingCart"セッションの取得
		if (session.getAttribute("B201ShoppingCart") == null) {
			page = "error.jsp";
			System.out.println("ショッピングカートの購入ボタンでエラー発生");
		} else {
			itemList = (ArrayList<Item>) session.getAttribute("B201ShoppingCart");
		}

		// 各商品の予約人数、小計を設定
		int orderTotal = 0;
		for( int i=0; i < itemList.size(); i++){
			itemList.get(i).setQuantity(Integer.parseInt(quantity[i]));
			//itemList.get(i).setSubTotal(Integer.parseInt(total[i]));
			//orderTotal += Integer.parseInt(total[i]);
		}

		itemList.get(0).setTotal(orderTotal);
		session.setAttribute("B201ShoppingCart", itemList);

		return page;
	}
}
