package tsys.sales.web;

import javax.servlet.http.HttpServletRequest;

/**
 * 顧客トップ画面のフライト[検索]ボタン押下時のActionクラス
 *
 * @author kayashima
 * @version 1.0 2017/09/28
 */
public class BC001FlightAction implements ActionInterface{

	public String execute(HttpServletRequest req){
		String page = "/UC700/b702G01_FlightSearch.jsp";

		return page;
	}

}
