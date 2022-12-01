package controller.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/URLController" })
public class URLController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		
		String page = "";
		if (action == null) {
			page = "/ListProduct";
		} else {
			switch (action) {
			case "login":
				page = "/login.jsp";
				break;
			case "manageP":
				page = "/productManage.jsp";
				break;
			case "register":
				page = "/register.jsp";
				break;
			case "history":
				page = "/historyProduct.jsp";
				break;
			case "edit":
				page = "/edit.jsp";
				break;
			case "cart":
				page = "/cart.jsp";
				break;
			}
		}
		

		getServletContext().getRequestDispatcher(page).forward(req, resp);

	}
}
