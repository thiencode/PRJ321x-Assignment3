package controller.security;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Account;
import dao.OrdersDAO;

/**
 * Servlet implementation class register
 */
@WebServlet("/Register")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterController() {
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8"); // Vietnamese

		try {
			// make sure that email valid
			String regexMail = "^[A-Z0-9_a-z]+@[A-Z0-9\\.a-z]+\\.[A-Za-z]{2,6}$";
			String regex = "[a-zA-Z0-9_!@#$%^&*]+";

			String name = request.getParameter("name");
			String user = request.getParameter("user-mail");
			String pass = request.getParameter("pass");
			String repass = request.getParameter("repass");

			HttpSession session = request.getSession(true);
			if (name == "") {
				session.setAttribute("error", "User name can not be blank.");
				response.sendRedirect("URLController?action=register");
				return;
			}
			
			if (!user.matches(regexMail)) {
				session.setAttribute("error", " Email invalid syntax");
				response.sendRedirect("URLController?action=register");
				return;
			}
			
			if (pass == "") {
				session.setAttribute("error", "Password can not be blank.");
				response.sendRedirect("URLController?action=register");
				return;
			}
			
			if (!pass.matches(regex)) {
				session.setAttribute("error", "Only number");
				response.sendRedirect("URLController?action=register");
				return;
			}
			
			if (!pass.equals(repass)) {
				session.setAttribute("error", "Your password and confirmation password do not match.");
				response.sendRedirect("URLController?action=register");
			} else {
				OrdersDAO od = new OrdersDAO();
				Account acc = od.checkAccount(user);
				if (acc == null) {
					od.register(user, pass, name);
					response.sendRedirect("URLController");
				} else {
					session.setAttribute("error", "Email address already exists.");
					response.sendRedirect("URLController?action=register");
				}
			}

		} catch (NullPointerException e) {
			RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
			rd.forward(request, response);
		} catch (Exception ex) {
			response.getWriter().println(ex);
		}

	}
}
