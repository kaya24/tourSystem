package tsys.sales.web;

import javax.servlet.http.HttpServletRequest;

public class BE001PackageRegistAction implements ActionInterface{

	public String execute(HttpServletRequest req){
		String page = "/UC300/b301G01_RegistSearch.jsp";

		return page;
	}

}
