package tsys.sales.web;

import javax.servlet.http.HttpServletRequest;

/**
 * 顧客トップ画面のパッケージツアー[検索]ボタン押下時のActionクラス
 *
 * @author kayashima
 * @version 1.0 2017/09/28
 */
public class BC001PackageTourAction implements ActionInterface{

	public String execute(HttpServletRequest req){
		String page = "/UC600/b602G01_PackageTourSearch.jsp";

		return page;
	}

}
