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
public class FrontController2 extends HttpServlet {
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

		if (buttonid == null) {
			buttonid = "BC000Top";
		}

		try {
			// Actionクラスの動的生成
			Class<?> clazz = Class.forName("tsys.sales.web." + buttonid
					+ "Action");
			ActionInterface action = (ActionInterface)clazz.newInstance();
			page = action.execute(req);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = req.getRequestDispatcher("/jsp" + page);
		rd.forward(req, res);
	}
}
