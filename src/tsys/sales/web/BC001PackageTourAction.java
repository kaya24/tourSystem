package tsys.sales.web;

import javax.servlet.http.HttpServletRequest;

public class BC001PackageTourAction implements ActionInterface{

	public String execute(HttpServletRequest req){
		String page = "/UC600/b602G01_PackageTourSearch.jsp";

		return page;
	}

}
