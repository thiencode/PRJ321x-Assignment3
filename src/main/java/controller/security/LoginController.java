package controller.security;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Account;
import dao.OrdersDAO;

/**
 * Servlet implementation class LoginServlet
 */

public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8"); // Vietnamese
		try {
			request.getSession(true).invalidate();
			// make sure that email valid
			String regexMail = "^[A-Z0-9_a-z]+@[A-Z0-9\\.a-z]+\\.[A-Za-z]{2,6}$";
			String regex = "[a-zA-Z0-9_!@#$%^&*]+";

			// collect data from a login form
			String user = request.getParameter("username");
			String password = request.getParameter("password");
			int role;
			
			if(request.getParameter("forAdmin") != null)
				role = 1;
			else 
				role = 0;


			HttpSession session = request.getSession(true);
			if (!password.matches(regex) || !user.matches(regexMail)) {
				session.setAttribute("error", "Invalid syntax");
				response.sendRedirect("URLController?action=login");
				return;
			}
			//remember me 
			if(request.getParameter("remember") != null){
				Cookie cookie = new Cookie("username", user);
				cookie.setMaxAge(300);
				response.addCookie(cookie);
			}
			// read information of account in Database Source
			OrdersDAO od = new OrdersDAO();
			Account account = od.login(user, password, role);

			if (account == null) {
				session.setAttribute("error", "Wrong username or password");
				response.sendRedirect("URLController?action=login");
			} else {
				// set session
				session.setAttribute("acc", account);
				session.setAttribute("user", user);
				if (request.getParameter("forAdmin") != null) {
					// login is valid, now redirect to index page of admin
					session.removeAttribute("error");
					response.sendRedirect("ManagerProduct");
				} else {
					session.setAttribute("acc", account);
					// login is valid, now redirect to index page of user
					String a = account.getUsr();
					response.sendRedirect("History?user="+a);
				}
			}

		} catch (NullPointerException e) {
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		} catch (Exception ex) {
			response.getWriter().println(ex);
		}

	}

}
